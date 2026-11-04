from pathlib import Path

root = Path("/home/nawaf/cod2/test/dev/radiant/.agents/gemini")
path = root / "src/universal/com_files.cpp"
text = path.read_text().splitlines()

anchors = [
    ("assert(!streamThread);", 526),
    ('assertMsg((f > 0 && f < (1 + 50 + 13)), "(f) = %i", f);', 544),
    ("assert(!fsh[f].zipFile);", 545),
    ("assert(fsh[f].handleFiles.file.o);", 546),
    ("assert(f);", 585),
    ("assert(base);", 662),
    ("assert(qpath);", 663),
    ("assert(ospath);", 664),
    ("assert(filename);", 1268),
    ("assert(sanitizedName);", 1269),
    ('assertMsg((sanitizedNameSize > 0), "(sanitizedNameSize) = %i", sanitizedNameSize);', 1270),
    ('FS_ASSERT_MSG(0, dstIndex + 1 < sanitizedNameSize, va("%i + 1 > %i", dstIndex, sanitizedNameSize));', 1284),
    ('FS_ASSERT_MSG(1, dstIndex <= srcIndex, va("%i > %i", dstIndex, srcIndex));', 1297),
    ("assert(buffer);", 2160),
    ("assert(gfx);", 4099),
]

# Compact only the newly inserted bodies so all five sanitizer assertions fit.
begin = next(i for i, line in enumerate(text) if line.startswith("static bool FS_IsBackupSubStr("))
end = next(i for i, line in enumerate(text) if line.startswith("int FS_FOpenFileReadStream("))
compact = []
for line in text[begin:end]:
    if not line.strip() or line.lstrip().startswith("//"):
        continue
    if line.strip() == "{" and compact and compact[-1].lstrip().startswith(("if (", "while (", "else", "switch (")):
        compact[-1] += " {"
    else:
        compact.append(line)
text[begin:end] = compact
previous = 0
for anchor, want in anchors:
    at = next((i for i in range(previous, len(text)) if text[i].strip() == anchor), None)
    if at is None:
        continue
    delta = want - (at + 1)
    if delta < 0:
        candidates = [i for i in range(previous, at) if not text[i].strip()]
        assert len(candidates) >= -delta, (anchor, want, at + 1)
        for i in reversed(candidates[: -delta]):
            del text[i]
    elif delta:
        text[previous:previous] = [""] * delta
    actual = next(i for i in range(previous, len(text)) if text[i].strip() == anchor)
    assert actual + 1 == want, (anchor, actual + 1, want)
    previous = actual + 1

path.write_text("\n".join(text).rstrip() + "\n")
print("Aligned com_files.cpp successfully!")
