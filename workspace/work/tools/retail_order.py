"""Move a TU's function definitions into retail address order (definition order = emission order).

Usage: retail_order.py <build dir> <src.cpp>... [--across] [--write]
Only top-level function definitions move; every other top-level item keeps its place. Functions
are permuted within runs not crossed by a preprocessor line. An unbound function stays glued to
the function before it. Prints the planned order; --write rewrites the file.
"""
import json
import re
import sys
from pathlib import Path


def items(text):
    """Split text into top-level chunks: (kind, text). kind is 'fn', 'pp' or 'other'."""
    out, i, start, depth, n = [], 0, 0, 0, len(text)
    while i < n:
        c = text[i]
        if text.startswith('//', i):
            i = text.find('\n', i)
            i = n if i < 0 else i
            continue
        if text.startswith('/*', i):
            j = text.find('*/', i + 2)
            i = n if j < 0 else j + 2
            continue
        if c in '"\'':
            j = i + 1
            while j < n and text[j] != c:
                j += 2 if text[j] == '\\' else 1
            i = j + 1
            continue
        if depth == 0 and c == '#' and text[text.rfind('\n', 0, i) + 1:i].strip() == '':
            end = i
            while True:
                end = text.find('\n', end)
                if end < 0 or text[end - 1] != '\\':
                    break
                end += 1
            end = n if end < 0 else end + 1
            if text[start:i]:
                out.append(('other', text[start:i]))
            out.append(('pp', text[i:end]))
            start = i = end
            continue
        if c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                end = text.find('\n', i)
                end = n if end < 0 else end + 1
                if text[i + 1:end].strip() in ('', ';') or text[i + 1:end].lstrip().startswith('//'):
                    chunk = text[start:end]
                    head = chunk[:chunk.find('{')]
                    kind = 'fn' if fn_name(head) and not re.search(r'\b(struct|class|union|enum|namespace)\b|=\s*$', head.split('(')[0]) else 'other'
                    out.append((kind, chunk))
                    start = i = end
                    continue
        elif c == ';' and depth == 0:
            end = text.find('\n', i)
            end = n if end < 0 else end + 1
            out.append(('other', text[start:end]))
            start = i = end
            continue
        i += 1
    if text[start:]:
        out.append(('other', text[start:]))
    return out


def fn_name(head):
    """Name of the function a definition header declares, or None."""
    code = re.sub(r'//[^\n]*|/\*.*?\*/', '', head, flags=re.S)
    m = re.search(r'([A-Za-z_]\w*(?:::\w+)*)\s*\([^;{]*\)\s*(?:const\s*)?$', code.strip())
    return m.group(1).split('::')[-1] if m else None


def sort_fns(fns, retail):
    """Sort definitions by retail address; an unbound one stays glued to the one before it."""
    groups = []
    for c in fns:
        if retail.get(fn_name(c[1][:c[1].find('{')])) is not None or not groups:
            groups.append([c])
        else:
            groups[-1].append(c)
    # a leading unbound group keeps its place, the rest sort by retail address
    key = lambda g: retail.get(fn_name(g[0][1][:g[0][1].find('{')]), -1)
    return [c for g in sorted(groups, key=key) for c in g]


def protos(fns):
    """Prototypes for moved definitions; they emit no code."""
    heads = [re.sub(r'//[^\n]*|/\*.*?\*/', '', c[1][:c[1].find('{')], flags=re.S).strip() for c in fns]
    return ('other', ''.join(h + ';\n' for h in heads if not h.startswith('template')))


def plan(chunks, retail, across=False):
    """Reorder definitions. Default: within runs of adjacent definitions. across: within
    preprocessor-free spans, definitions permute among their own slots while declarations
    and data keep theirs, so data order does not change."""
    out, span = [], []
    for c in chunks + [('pp', '')]:
        if c[0] == 'pp' or (not across and c[0] != 'fn'):
            fns = [x for x in span if x[0] == 'fn']
            new = sort_fns(fns, retail)
            if new != fns:
                it = iter(new)
                body = [next(it) if x[0] == 'fn' else x for x in span]
                first = next(k for k, x in enumerate(body) if x[0] == 'fn')
                body.insert(first, protos(fns))
                out.extend(body)
            else:
                out.extend(span)
            if c[1]:
                out.append(c)
            span = []
        else:
            span.append(c)
    return out


def retail_map(build, layout=None):
    """Plain function name -> retail address: bind.json (bound exactly once), plus pinned
    addresses from layout/file_layout.tsv when given."""
    bind = json.load(open(Path(build) / 'bind.json'))
    seen = {}
    for mangled, row in bind.items():
        if row.get('why'):
            continue
        seen.setdefault(plain(mangled), set()).add(int(row['t'], 16))
    if layout:
        for line in open(layout):
            f = line.rstrip('\n').split('\t')
            if len(f) > 3 and f[3] in ('bind', 'pinned') and f[2] not in ('-', ''):
                seen.setdefault(plain(f[1]), set()).add(int(f[2], 16))
    return {k: min(v) for k, v in seen.items() if len(v) == 1}


def plain(mangled):
    return mangled[1:].split('@')[0] if mangled.startswith('?') else mangled.lstrip('_')


if __name__ == '__main__':
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    across = '--across' in sys.argv
    retail = retail_map(args[0], Path(__file__).resolve().parents[1] / 'layout/file_layout.tsv' if across else None)
    for path in args[1:]:
        raw = open(path, newline='').read()
        chunks = items(raw)
        assert ''.join(c[1] for c in chunks) == raw, path
        new = plan(chunks, retail, across)
        moved = [fn_name(c[1][:c[1].find('{')]) for a, c in zip([x for x in chunks if x[0] == 'fn'], [x for x in new if x[0] == 'fn']) if a is not c]
        print(f'{path}: {len(moved)} moved')
        if moved and '--write' in sys.argv:
            open(path, 'w', newline='').write(''.join(c[1] for c in new))
