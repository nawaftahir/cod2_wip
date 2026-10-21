#!/usr/bin/env python3
"""Turn retail resources into an .rc script: rc_extract.py [--assets-only]

Writes src/res/CoD2Radiant.rc (dialogs, menus, string tables, accelerators, version, MFC DLGINIT and
TOOLBAR as RC text, numeric ids and styles so it round-trips exactly) and extracts the image assets
(bitmaps, icons, cursors) to build/res/ (never committed; they only exist as image files). link.py
compiles the .rc with the original rc.exe. Resources are emitted in retail data order. Owner tool.
"""
import pathlib
import struct
import sys

import pefile

BASE = pathlib.Path(__file__).resolve().parent.parent
RT = {v: k for k, v in pefile.RESOURCE_TYPE.items()}


def q(s):
    out = []
    for ch in s:
        o = ord(ch)
        if ch == '"':
            out.append('""')
        elif ch == "\\":
            out.append("\\\\")
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\r":
            out.append("\\r")
        elif ch == "\t":
            out.append("\\t")
        elif 32 <= o < 127 or 160 <= o < 256:
            out.append(ch)  # the .rc is written in code page 1252, as Visual Studio does
        else:
            out.append("\\%03o" % o if o < 256 else "?")
    return '"' + "".join(out) + '"'


def wstr(d, o):
    e = o
    while d[e:e + 2] != b"\0\0":
        e += 2
    return d[o:e].decode("utf-16-le"), e + 2


def sz_or_ord(d, o):
    w = struct.unpack_from("<H", d, o)[0]
    if w == 0xFFFF:
        return struct.unpack_from("<H", d, o + 2)[0], o + 4
    if w == 0:
        return "", o + 2
    return wstr(d, o)


def align4(o):
    return (o + 3) & ~3


def name_of(e):
    return str(e.name) if e.name is not None else str(e.id)


def dialog(name, d):
    out = []
    ex = struct.unpack_from("<HH", d, 0) == (1, 0xFFFF)
    if ex:
        _, _, helpid, exstyle, style, n, x, y, cx, cy = struct.unpack_from("<HHIIIHhhhh", d, 0)
        o = 26
    else:
        style, exstyle, n, x, y, cx, cy = struct.unpack_from("<IIHhhhh", d, 0)
        o = 18
    menu, o = sz_or_ord(d, o)
    cls, o = sz_or_ord(d, o)
    title, o = wstr(d, o)
    font = None
    if style & 0x40:  # DS_SETFONT
        if ex:
            pt, weight, italic, charset = struct.unpack_from("<HHBB", d, o)
            fname, o = wstr(d, o + 6)
            font = "FONT %d, %s, %d, %d, 0x%x" % (pt, q(fname), weight, italic, charset)
        else:
            pt = struct.unpack_from("<H", d, o)[0]
            fname, o = wstr(d, o + 2)
            font = "FONT %d, %s" % (pt, q(fname))
    head = "%s %s %d, %d, %d, %d" % (name, "DIALOGEX" if ex else "DIALOG", x, y, cx, cy)
    if ex and helpid:
        head += ", %d" % helpid
    out.append(head)
    out.append("STYLE 0x%08x" % style)
    if exstyle:
        out.append("EXSTYLE 0x%08x" % exstyle)
    if title:
        out.append("CAPTION %s" % q(title))
    if menu != "":
        out.append("MENU %s" % (menu if isinstance(menu, int) else q(menu)))
    if cls != "":
        out.append("CLASS %s" % (cls if isinstance(cls, int) else q(cls)))
    if font:
        out.append(font)
    out.append("BEGIN")
    for _ in range(n):
        o = align4(o)
        if ex:
            helpid, cexstyle, cstyle, x, y, cx, cy, cid = struct.unpack_from("<IIIhhhhI", d, o)
            o += 24
        else:
            cstyle, cexstyle, x, y, cx, cy, cid = struct.unpack_from("<IIhhhhH", d, o)
            o += 18
            helpid = 0
        ccls, o = sz_or_ord(d, o)
        ctext, o = sz_or_ord(d, o)
        extra = struct.unpack_from("<H", d, o)[0]
        o += 2 + extra
        clsname = {0x80: "Button", 0x81: "Edit", 0x82: "Static", 0x83: "ListBox", 0x84: "ScrollBar", 0x85: "ComboBox"}.get(ccls, ccls) \
            if isinstance(ccls, int) else ccls
        text = ctext if isinstance(ctext, int) else q(ctext)
        # rc.exe ORs WS_CHILD|WS_VISIBLE into every CONTROL; retail controls without them need NOT
        style = "0x%08x" % cstyle
        if not cstyle & 0x10000000:
            style += " | NOT WS_VISIBLE"
        if not cstyle & 0x40000000:
            style += " | NOT WS_CHILD"
        line = "    CONTROL %s, %d, %s, %s, %d, %d, %d, %d" % (text, cid, q(clsname) if isinstance(clsname, str) else clsname,
                                                              style, x, y, cx, cy)
        if cexstyle or (ex and helpid):
            line += ", 0x%08x" % cexstyle
        if ex and helpid:
            line += ", %d" % helpid
        out.append(line)
    out.append("END")
    return out


def menu(name, d):
    ver, off = struct.unpack_from("<HH", d, 0)
    if ver != 0:
        return ["// MENUEX %s not handled" % name]
    out = ["%s MENU" % name, "BEGIN"]

    def items(o, depth):
        # one level of items; the item flagged END (0x80) is the last of its level
        while True:
            flags = struct.unpack_from("<H", d, o)[0]
            o += 2
            popup = flags & 0x10
            if not popup:
                mid = struct.unpack_from("<H", d, o)[0]
                o += 2
            text, o = wstr(d, o)
            opts = [w for bit, w in ((0x1, "GRAYED"), (0x2, "INACTIVE"), (0x8, "CHECKED"), (0x20, "MENUBARBREAK"),
                                     (0x40, "MENUBREAK"), (0x4000, "HELP")) if flags & bit]
            pad = "    " * depth
            if popup:
                out.append("%sPOPUP %s%s" % (pad, q(text), "".join(", " + w for w in opts)))
                out.append("%sBEGIN" % pad)
                o = items(o, depth + 1)
                out.append("%sEND" % pad)
            elif text == "" and mid == 0 and not (flags & ~0x80):
                out.append("%sMENUITEM SEPARATOR" % pad)
            else:
                out.append("%sMENUITEM %s, %d%s" % (pad, q(text), mid, "".join(", " + w for w in opts)))
            if flags & 0x80:
                return o

    items(4 + off, 1)
    return out + ["END"]


def strings(block, d):
    out, o = [], 0
    for i in range(16):
        n = struct.unpack_from("<H", d, o)[0]
        o += 2
        if n:
            out.append("    %d, %s" % ((block - 1) * 16 + i, q(d[o:o + 2 * n].decode("utf-16-le"))))
        o += 2 * n
    return out


def accel(name, d):
    out = ["%s ACCELERATORS" % name, "BEGIN"]
    for o in range(0, len(d), 8):
        flags, key, cmd, _ = struct.unpack_from("<HHHH", d, o)
        opts = ["VIRTKEY" if flags & 1 else "ASCII"]
        if flags & 2:
            opts.append("NOINVERT")
        if flags & 4:
            opts.append("SHIFT")
        if flags & 8:
            opts.append("CONTROL")
        if flags & 0x10:
            opts.append("ALT")
        out.append("    %d, %d, %s" % (key, cmd, ", ".join(opts)))
        if flags & 0x80:
            break
    return out + ["END"]


def version(name, d):
    out = ["%s VERSIONINFO" % name]
    fi = d.find(struct.pack("<I", 0xFEEF04BD))
    sig, sv, fvms, fvls, pvms, pvls, mask, flags, os_, typ, sub, dms, dls = struct.unpack_from("<13I", d, fi)
    out += [" FILEVERSION %d,%d,%d,%d" % (fvms >> 16, fvms & 0xFFFF, fvls >> 16, fvls & 0xFFFF),
            " PRODUCTVERSION %d,%d,%d,%d" % (pvms >> 16, pvms & 0xFFFF, pvls >> 16, pvls & 0xFFFF),
            " FILEFLAGSMASK 0x%xL" % mask, " FILEFLAGS 0x%xL" % flags, " FILEOS 0x%xL" % os_,
            " FILETYPE 0x%xL" % typ, " FILESUBTYPE 0x%xL" % sub, "BEGIN"]

    def block(o, end, depth):
        lines = []
        while o < end:
            ln, vln, typ = struct.unpack_from("<HHH", d, o)
            key, ko = wstr(d, o + 6)
            vo = align4(ko)
            pad = "    " * depth
            if key in ("StringFileInfo", "VarFileInfo") or (depth == 2 and typ == 1 and vln == 0):
                lines.append('%sBLOCK %s' % (pad, q(key)))
                lines.append("%sBEGIN" % pad)
                lines += block(vo, o + ln, depth + 1)
                lines.append("%sEND" % pad)
            elif key == "Translation":
                vals = struct.unpack_from("<%dH" % (vln // 2), d, vo)
                lines.append('%sVALUE "Translation", %s' % (pad, ", ".join("0x%x" % v for v in vals)))
            else:
                val = d[vo:vo + 2 * vln].decode("utf-16-le").rstrip("\0") if vln else ""
                lines.append("%sVALUE %s, %s" % (pad, q(key), q(val)))
            o = align4(o + ln)
        return lines

    root_len = struct.unpack_from("<H", d, 0)[0]
    o = align4(fi + 52)
    out += block(o, root_len, 1)
    return out + ["END"]


def toolbar(name, d):
    ver, w, h, n = struct.unpack_from("<HHHH", d, 0)
    out = ["%s TOOLBAR %d, %d" % (name, w, h), "BEGIN"]
    for i in range(n):
        cid = struct.unpack_from("<H", d, 8 + 2 * i)[0]
        out.append("    SEPARATOR" if cid == 0 else "    BUTTON %d" % cid)
    return out + ["END"]


def dlginit(name, d):
    out = ["%s DLGINIT" % name, "BEGIN"]
    o = 0
    while o + 2 <= len(d):
        ctl = struct.unpack_from("<H", d, o)[0]
        if ctl == 0:
            out.append("    0")
            break
        msg, ln = struct.unpack_from("<HI", d, o + 2)
        data = d[o + 8:o + 8 + ln]
        # even part as words, an odd last byte as a one-char string, the way Visual Studio writes DLGINIT
        parts = ["0x%04x" % struct.unpack_from("<H", data, i)[0] for i in range(0, len(data) - 1, 2)]
        if len(data) % 2:
            parts.append('"\\%03o"' % data[-1])
        out.append("    %d, 0x%x, %d, 0, %s," % (ctl, msg, ln, ", ".join(parts)) if parts else "    %d, 0x%x, %d, 0," % (ctl, msg, ln))
        o += 8 + ln
    return out + ["END"]


def main():
    pe = pefile.PE(str(BASE / "binaries" / "CoD2Radiant.exe"))
    res = BASE / "build" / "res"
    res.mkdir(parents=True, exist_ok=True)
    items = []
    for t in pe.DIRECTORY_ENTRY_RESOURCE.entries:
        tname = RT.get(t.id, name_of(t))
        for e in t.directory.entries:
            for l in e.directory.entries:
                items.append((l.data.struct.OffsetToData, tname, name_of(e), l.id,
                              pe.get_data(l.data.struct.OffsetToData, l.data.struct.Size)))
    items.sort()
    rc = ["// Generated by tools/rc_extract.py from the retail resources; numeric ids (names unknown).",
          '#include <windows.h>', "LANGUAGE 9, 1", ""]
    icons = {}
    for _, t, n, lang, d in items:
        if t == "RT_ICON":
            icons[n] = d
    for _, t, n, lang, d in items:
        if t == "RT_DIALOG":
            rc += dialog(n, d) + [""]
        elif t == "RT_MENU":
            rc += menu(n, d) + [""]
        elif t == "RT_STRING":
            rc += ["STRINGTABLE", "BEGIN"] + strings(int(n), d) + ["END", ""]
        elif t == "RT_ACCELERATOR":
            rc += accel(n, d) + [""]
        elif t == "RT_VERSION":
            rc += version(n, d) + [""]
        elif t == "241":
            rc += toolbar(n, d) + [""]
        elif t == "240":
            rc += dlginit(n, d) + [""]
        elif t == "RT_BITMAP":
            # a .bmp file is the BITMAPINFO+bits resource with a 14-byte file header in front
            hsz, = struct.unpack_from("<I", d, 0)
            bits, clr = struct.unpack_from("<HI", d, 14)[0], struct.unpack_from("<I", d, 32)[0]
            pal = (clr or (1 << bits if bits <= 8 else 0)) * 4
            hdr = b"BM" + struct.pack("<IHHI", 14 + len(d), 0, 0, 14 + hsz + pal)
            (res / ("bitmap_%s.bmp" % n)).write_bytes(hdr + d)
            rc += ['%s BITMAP "bitmap_%s.bmp"' % (n, n), ""]
        elif t == "RT_GROUP_ICON":
            rc += ['%s ICON "icon_%s.ico"' % (n, n), ""]
            _, _, cnt = struct.unpack_from("<HHH", d, 0)
            ents, blobs, off = [], [], 6 + 16 * cnt
            for i in range(cnt):
                w, h, colors, r, planes, bpp, size, iid = struct.unpack_from("<BBBBHHIH", d, 6 + 14 * i)
                blob = icons[str(iid)]
                ents.append(struct.pack("<BBBBHHII", w, h, colors, r, planes, bpp, len(blob), off))
                blobs.append(blob)
                off += len(blob)
            (res / ("icon_%s.ico" % n)).write_bytes(struct.pack("<HHH", 0, 1, cnt) + b"".join(ents) + b"".join(blobs))
        elif t == "RT_GROUP_CURSOR":
            rc += ['%s CURSOR "cursor_%s.cur"' % (n, n), ""]
            _, _, cnt = struct.unpack_from("<HHH", d, 0)
            ents, blobs, off = [], [], 6 + 16 * cnt
            for i in range(cnt):
                w, h, planes, bpp, size, cid = struct.unpack_from("<HHHHIH", d, 6 + 14 * i)
                cur = [x for x in items if x[1] == "RT_CURSOR" and x[2] == str(cid)][0][4]
                hx, hy = struct.unpack_from("<HH", cur, 0)
                blob = cur[4:]
                ents.append(struct.pack("<BBBBHHII", w & 0xFF, (h // 2) & 0xFF, 0, 0, hx, hy, len(blob), off))
                blobs.append(blob)
                off += len(blob)
            (res / ("cursor_%s.cur" % n)).write_bytes(struct.pack("<HHH", 0, 2, cnt) + b"".join(ents) + b"".join(blobs))
    if "--assets-only" not in sys.argv:
        out = BASE / "src" / "res" / "CoD2Radiant.rc"
        out.parent.mkdir(parents=True, exist_ok=True)
        out.write_text("\n".join(rc) + "\n", encoding="latin-1")
        print("wrote %s (%d lines)" % (out.relative_to(BASE), len(rc)))
    print("assets in build/res:", len(list(res.iterdir())))


if __name__ == "__main__":
    main()
