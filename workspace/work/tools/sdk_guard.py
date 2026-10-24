"""Guard Mac opencod2 declarations that the real Windows/D3D9 SDK view already declares.

Usage: python3 sdk_guard.py <sdk.i> <headers_dir> [macros.txt]
sdk.i is `cl /EP` of a TU that includes r_local.h. Each colliding top-level
declaration in <headers_dir> gets wrapped in #ifndef COD2_SDK_TYPES, so TUs
that never define the macro preprocess to the same tokens as before.
"""
import re
import sys
from pathlib import Path

WORD = re.compile(r'[A-Za-z_]\w*')
KEYWORDS = set('''struct union enum class typedef extern static inline const volatile unsigned signed
int char short long float double void bool __int64 __int8 __int16 __int32 __stdcall __cdecl __fastcall
__declspec dllimport align __inline __forceinline register auto restrict''' .split())


def strip_comments(text):
    # keep newlines so line numbers survive
    def blank(m):
        return re.sub(r'[^\n]', ' ', m.group(0))
    return re.sub(r'//[^\n]*|/\*.*?\*/', blank, text, flags=re.S)


def decls(text):
    """Yield (start_offset, end_offset, decl_text) for top-level declarations."""
    clean = strip_comments(text)
    i, n, start, depth = 0, len(clean), None, 0
    head = None
    while i < n:
        c = clean[i]
        if start is None:
            if c.isspace():
                i += 1
                continue
            if c == '#':
                # preprocessor line (with continuations) stays outside any guard
                while i < n and clean[i] != '\n':
                    i += 2 if clean[i] == '\\' else 1
                continue
            if c == '}':
                # end of an extern "C" block
                i += 1
                continue
            start, depth, head = i, 0, None
        if c == '{':
            seg = clean[start:i]
            if depth == 0 and re.fullmatch(r'\s*extern\s+"C(\+\+)?"\s*|\s*namespace\s*\w*\s*', seg):
                start = None
                i += 1
                continue
            if depth == 0 and head is None:
                head = seg
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0 and head is not None and re.search(r'\)\s*(const\s*)?$', head) and 'typedef' not in head.split():
                yield start, i + 1, clean[start:i + 1]
                start = None
        elif c == ';' and depth == 0:
            yield start, i + 1, clean[start:i + 1]
            start = None
        i += 1


def outer(text):
    # text with brace bodies removed, plus the bodies
    out, bodies, depth, cur = [], [], 0, []
    for c in text:
        if c == '{':
            depth += 1
            if depth == 1:
                cur = []
                out.append('{}')
                continue
        elif c == '}':
            depth -= 1
            if depth == 0:
                bodies.append(''.join(cur))
                continue
        if depth == 0:
            out.append(c)
        else:
            cur.append(c)
    return ''.join(out), bodies


def names(decl):
    """Return dict kind -> set(names) for one declaration."""
    o, bodies = outer(decl)
    r = {'tag': set(), 'body': set(), 'typedef': set(), 'enum': set(), 'func': set(), 'var': set()}
    m = re.match(r'\s*(?:__declspec\s*\((?:[^()]|\([^()]*\))*\)\s*|#[^\n]*\n\s*)*(?:typedef\s+)?(?:(?:const|volatile)\s+)*(struct|union|enum|class)\s+(?:__declspec\s*\((?:[^()]|\([^()]*\))*\)\s*)*([A-Za-z_]\w*)', o)
    if m:
        r['tag'].add(m.group(2))
        if '{}' in o:
            r['body'].add(m.group(2))
    if re.match(r'\s*(?:typedef\s+)?(?:(?:const|volatile)\s+)*enum\b', o):
        for b in bodies:
            r['enum'].update(x.group(1) for x in re.finditer(r'([A-Za-z_]\w*)\s*(?:=[^,]*)?(?:,|$)', b.strip()))
    if re.match(r'\s*typedef\b', o):
        tail = o[o.rfind('}') + 1:] if '{}' in o else o
        for x in re.finditer(r'([A-Za-z_]\w*)\s*(?=[,;\[]|\)\s*[\(\[])', tail):
            if x.group(1) not in KEYWORDS:
                r['typedef'].add(x.group(1))
    elif '(' in o.split('{}')[0] and '=' not in o.split('(')[0]:
        x = re.search(r'([A-Za-z_]\w*)\s*\(', o)
        if x and x.group(1) not in KEYWORDS and not o.lstrip().startswith(('struct', 'union', 'enum', 'class')):
            r['func'].add(x.group(1))
    elif m and re.fullmatch(r'[^{]*?\b' + m.group(2) + r'\s*(?::[^{]*)?(\{\})?\s*;', o):
        pass  # tag declaration or definition, no declarator
    elif not m or o.rstrip(';').rstrip().endswith(tuple('abcdefghijklmnopqrstuvwxyz0123456789_]')):
        tail = o.split('{}')[-1]
        for x in re.finditer(r'([A-Za-z_]\w*)\s*(?=[,;\[=])', tail):
            if x.group(1) not in KEYWORDS:
                r['var'].add(x.group(1))
    return r


def main():
    sdk_text = Path(sys.argv[1]).read_text(errors='ignore')
    sdk_text = '\n'.join(l for l in sdk_text.splitlines() if not l.lstrip().startswith('#'))
    sdk = {k: set() for k in ('tag', 'body', 'typedef', 'enum', 'func', 'var')}
    for _, _, d in decls(sdk_text):
        for k, v in names(d).items():
            sdk[k] |= v
    macros = set(Path(sys.argv[3]).read_text().split()) if len(sys.argv) > 3 else set()
    ordinary = sdk['typedef'] | sdk['enum'] | sdk['func'] | sdk['var'] | macros
    root = Path(sys.argv[2])
    total = 0
    for path in sorted(root.rglob('*.h')):
        if path.name == 'common_types.h':
            continue  # only includes; its body is #if 0
        text = path.read_text(errors='ignore')
        spans = []
        for s, e, d in decls(text):
            r = names(d)
            hit = (r['tag'] & (ordinary | (sdk['body'] if r['body'] else set()))) | (r['body'] & sdk['body']) \
                | ((r['typedef'] | r['enum'] | r['func'] | r['var']) & ordinary) \
                | (r['enum'] & sdk['enum'])
            if hit:
                spans.append((s, e))
        if not spans:
            continue
        # extend each span to whole lines
        out, pos = [], 0
        for s, e in spans:
            s = text.rfind('\n', 0, s) + 1
            nl = text.find('\n', e)
            e = len(text) if nl < 0 else nl + 1
            # keep #if/#endif pairs inside one guard
            while True:
                lines = text[s:e].splitlines()
                depth = sum(1 for l in lines if re.match(r'\s*#\s*if', l)) - sum(1 for l in lines if re.match(r'\s*#\s*endif', l))
                if depth >= 0:
                    break
                s = text.rfind('\n', 0, s - 1) + 1
            if s < pos:
                continue
            out.append(text[pos:s])
            out.append('#ifndef COD2_SDK_TYPES\n' + text[s:e] + ('' if text[s:e].endswith('\n') else '\n') + '#endif\n')
            pos = e
        out.append(text[pos:])
        path.write_text(''.join(out))
        total += len(spans)
        print(f'{len(spans):5} {path.relative_to(root)}')
    print(total, 'guarded')


if __name__ == '__main__':
    main()
