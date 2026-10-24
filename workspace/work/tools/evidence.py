"""Evidence class of every compiled game function: layout/evidence.tsv.

Usage: python3 tools/evidence.py <build_dir>  (after file_layout.py)
"""
import collections, json, re, sys
from pathlib import Path

work = Path(__file__).resolve().parents[1]
build = Path(sys.argv[1])
starts = {p.name[:8] for p in (work / '../../../glm/data/decomp').resolve().glob('10*_*.c')}
hits = {}
for e in json.load(open(build / 'cmp.json')):
    if e['hits']:
        hits.setdefault(e['name'], e['hits'])
LIB = re.compile(r'@std@@|^\?(acos|asin|atan2?|cos|sin|tan|exp|log|pow|sqrt|floor|ceil|fabs|fmod)@@'
                 r'|^_(acos|atan2|cos|sin|tan|exp|log|pow|sqrt|floor|fabs)f$')
ADDR = re.compile(r'(?<![0-9a-fA-F])(10[0-9a-f]{6})(?![0-9a-fA-F])')
DOUBT = re.compile(r'HYPOTHESIS|unconfirmed|guess', re.I)
src = {}


def above(tu, name):
    # comment block right above the definition of name
    lines = src.setdefault(tu, (work / 'src' / tu).read_text(errors='ignore').splitlines())
    for i, l in enumerate(lines):
        if re.search(r'\b' + re.escape(name) + r'\s*\(', l) and not l.lstrip().startswith(('//', '*')) \
                and not l.rstrip().endswith(';') and re.match(r'^[A-Za-z_]', l):
            j = i
            while j > 0 and (lines[j - 1].lstrip().startswith(('//', '/*', '*', '#pragma', 'template'))
                             or lines[j - 1].startswith('static __declspec')):
                j -= 1
            return ' '.join(lines[j:i + 1])
    return ''


out, count = [], collections.Counter()
for line in open(work / 'layout/file_layout.tsv'):
    if line.startswith('#'):
        continue
    tu, sym, addr, how, mac, placed, _ = line.rstrip('\n').split('\t')
    m = re.match(r'\?([A-Za-z_]\w*)@', sym) or re.match(r'_?([A-Za-z_]\w*)', sym)
    name = m.group(1) if m else sym
    note = above(tu, name)
    a = addr if addr != '-' else next((x for x in ADDR.findall(note) if x in starts), '-')
    if tu.startswith('jpeg-6b/'):
        cls = 'library-jpeg'
    elif LIB.search(sym):
        cls = 'library-compiler'
    elif how == 'bind':
        cls = 'accepted'
    elif sym in hits or a != '-':
        cls = 'draft-addressed'
    elif mac != '-':
        cls = 'draft-mac-name'
    else:
        cls = 'unverified'
    name_ok = 'doubt' if DOUBT.search(note) else ('mac' if mac != '-' else ('-' if cls != 'accepted' else 'bind'))
    count[cls] += 1
    out.append('\t'.join((cls, tu, name, a, name_ok)))
hdr = '# class\ttu\tfunction\tretail_addr\tname_evidence\n'
(work / 'layout/evidence.tsv').write_text(hdr + '\n'.join(sorted(out)) + '\n')
for k, v in count.most_common():
    print(f'{v:5} {k}')
