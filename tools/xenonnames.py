#!/usr/bin/env python3
"""xenonnames.py MAP [OUT.tsv]: names, demangled signatures and obj names from the Xbox 360 CoD2MP.map
(Oct 2005, PowerPC; SUPPORTED evidence only: names/signatures/obj, never layout).
Reads both the publics section and "Static symbols". Columns: name, signature, obj, mangled.
Demangler is a small MSVC subset (free/member functions, builtin/ptr/ref/struct/class/union/enum types,
back-references); anything it cannot parse gets an empty signature and keeps the mangled name."""
import re, sys

BUILTIN = {'X': 'void', 'D': 'char', 'C': 'signed char', 'E': 'unsigned char', 'F': 'short',
           'G': 'unsigned short', 'H': 'int', 'I': 'unsigned int', 'J': 'long', 'K': 'unsigned long',
           'M': 'float', 'N': 'double', 'O': 'long double'}
BUILTIN2 = {'N': 'bool', 'J': '__int64', 'K': 'unsigned __int64', 'W': 'wchar_t'}
KIND = {'U': 'struct', 'V': 'class', 'T': 'union'}
CV = {'A': '', 'B': 'const ', 'C': 'volatile ', 'D': 'const volatile '}


class Fail(Exception):
    pass


class P:
    def __init__(s, t):
        s.t, s.i, s.names, s.args = t, 0, [], []

    def peek(s):
        return s.t[s.i] if s.i < len(s.t) else ''

    def take(s):
        if s.i >= len(s.t):
            raise Fail
        c = s.t[s.i]
        s.i += 1
        return c

    def frag(s):
        c = s.peek()
        if c.isdigit():
            s.i += 1
            if int(c) >= len(s.names):
                raise Fail
            return s.names[int(c)]
        if c == '?':
            raise Fail
        j = s.t.find('@', s.i)
        if j < 0:
            raise Fail
        n = s.t[s.i:j]
        s.i = j + 1
        if not n:
            raise Fail
        if n not in s.names:
            s.names.append(n)
        return n

    def qname(s):
        parts = []
        while s.peek() != '@':
            parts.append(s.frag())
        s.i += 1
        return '::'.join(reversed(parts))

    def typ(s):
        c = s.take()
        if c in BUILTIN:
            return BUILTIN[c]
        if c == '_':
            return BUILTIN2[s.take()]
        if c in 'PQRS':  # pointer; Q const, R volatile, S const volatile (stored as cv of the pointer)
            cv = {'P': '', 'Q': 'const ', 'R': 'volatile ', 'S': 'const volatile '}[c]
            return s.ptr('*', cv)
        if c == 'A':
            return s.ptr('&', '')
        if c == 'B':
            return s.ptr('&', 'volatile ')
        if c in KIND:
            return s.qname()
        if c == 'W':
            s.take()
            return s.qname()
        raise Fail(c)

    def ptr(s, sym, cv):
        q = s.take()
        if q not in CV:
            raise Fail
        if s.peek() == '6':  # function pointer
            raise Fail
        inner = s.typ()
        return (CV[q] + inner + ' ' + sym + (' ' + cv.strip() if cv else '')).replace('  ', ' ').rstrip()

    def func(s, member):
        cc = s.take()
        if member:
            pass
        if s.peek() == '@':  # ctor/dtor: no return type
            s.i += 1
            ret = ''
        else:
            if s.peek() == '?':
                s.i += 1
                q = s.take()
                ret = CV.get(q, '') + s.typ()
            else:
                ret = s.typ()
        params = []
        if s.peek() == 'X':
            s.i += 1
        else:
            while s.peek() not in ('@', 'Z', ''):
                c = s.peek()
                if c.isdigit():
                    s.i += 1
                    if int(c) >= len(s.args):
                        raise Fail
                    params.append(s.args[int(c)])
                    continue
                st = s.i
                p = s.typ()
                if s.i - st > 1:
                    s.args.append(p)
                params.append(p)
            if s.peek() == '@':
                s.i += 1
            elif s.peek() == 'Z':
                params.append('...')
                s.i += 1
        if s.peek() != 'Z':
            raise Fail
        return ret, params


def demangle(m):
    """-> (qualified name, signature) or (None, None)"""
    if not m.startswith('?') or m.startswith('??_C') or m.startswith('?$'):
        return None, None
    try:
        p = P(m)
        p.i = 1
        name = None
        special = None
        if p.peek() == '?':
            p.i += 1
            k = p.take()
            if k in '01':
                special = k
            else:
                raise Fail
        else:
            name = p.frag()
        scope = p.qname()
        if special is not None:
            cls = scope.split('::')[-1]
            full = scope + '::' + ('~' if special == '1' else '') + cls
        else:
            full = (scope + '::' if scope else '') + name
        if p.peek() == 'Y' or p.peek() in 'SKC':  # global / static member
            p.i += 1
            ret, params = p.func(False)
            static = 'static ' if m[p.t.find('@@') + 2:][:1] != 'Y' else ''
        elif p.peek() in 'AIQEUM':  # member (this qualifier next)
            p.i += 1
            p.take()
            ret, params = p.func(True)
            static = ''
        else:
            raise Fail
        sig = (ret + ' ' if ret else '') + full + '(' + ', '.join(params) + ')'
        return full, sig
    except (Fail, KeyError, IndexError):
        return None, None


def parse(path):
    rows, sec = [], None
    for l in open(path, errors='ignore'):
        if 'Publics by Value' in l:
            sec = 'pub'
        elif l.startswith(' Static symbols'):
            sec = 'static'
        elif sec:
            m = re.match(r'\s+[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+[0-9a-f]{8} f\s+(?:i\s+)?(\S+)', l)
            if m:
                rows.append((m.group(1), m.group(2)))
    return rows


def main():
    rows = parse(sys.argv[1])
    out = open(sys.argv[2], 'w') if len(sys.argv) > 2 else sys.stdout
    out.write('name\tsignature\tobj\tmangled\n')
    ok = 0
    for mg, obj in sorted(set(rows), key=lambda r: (r[1], r[0])):
        full, sig = demangle(mg)
        if sig:
            ok += 1
        out.write('%s\t%s\t%s\t%s\n' % (full or mg.lstrip('?').split('@')[0] if mg.startswith('?') else mg, sig or '', obj, mg))
    sys.stderr.write('%d symbols, %d demangled\n' % (len(rows), ok))


if __name__ == '__main__':
    main()
