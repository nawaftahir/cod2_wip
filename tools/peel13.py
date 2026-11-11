#!/usr/bin/env python3
"""peel13.py: replay the c2 LTCG compile order from dfs13.sh output and check it against the F lines.
usage: peel13.py BUILD_DIR [FIT_MOVES [FN...]]  replay vs build/dfs/ord.txt F lines, print pass of each FN,
       write BUILD_DIR/dfs/symlist.txt. Asserts >= 99% of fns in oracle order (self-test).
Model (c2 0x1070cfdf): walk a symbol list = objs in reverse link order, each obj's functions in reverse
obj string order; repeated passes emit every fn whose uncut callees are all emitted."""
import sys, re, subprocess, bisect
PICK = min

def load(path):
    edges, cut, roots, F, stack = {}, set(), [], [], []
    for l in open(path, errors='replace'):
        t, n = l[:2], l[2:].rstrip('\n')
        if t == 'D ':
            if not stack: roots.append(n)
            edges.setdefault(n, []); stack.append(n)
        elif t == 'E ': stack.pop()
        elif t == 'T ': edges[stack[-1]].append(n)
        elif t == 'C ': cut.add((stack[-1], n))
        elif t == 'F ': F.append(n)
    return edges, cut, roots, F

def symlist(B, nodes, F=()):
    objs = [l.strip().replace('\\', '/')[6:] for f in ('objs.rsp', 'lw.rsp') for l in open(B + f) if l.strip()]
    owner = {}
    for l in open(B + 'release/CoD2MP_s.map'):
        m = re.match(r'\s*0001:\S+\s+(\S+)\s+\S+\s+f\s+(?:\S+:)?(\S+)\.obj', l)
        if m and m.group(1) in nodes: owner.setdefault(m.group(1), m.group(2).lower())
    hard = set(owner)
    S = {}
    for o in objs:
        s = subprocess.run(['strings', '-n', '4', B + o], capture_output=True, text=True, errors='replace').stdout.split('\n')
        S[o] = [n if n in nodes else '_' + n for n in s]
    idx = {o.split('/')[-1][:-4].lower(): i for i, o in enumerate(objs)}
    callers = {}
    for a, cs in nodes.items():
        for c in cs: callers.setdefault(c, set()).add(a)
    names = {o.split('/')[-1][:-4].lower(): set(S[o]) for o in objs}
    # shortcut: owners of map-less fns (header inlines) are fitted from one oracle run's F order
    for i, n in enumerate(F):
        if n in owner or n not in nodes: continue
        nb = [owner[F[j]] for d in range(1, 40) for j in (i-d, i+d) if 0 <= j < len(F) and F[j] in owner]
        for o in nb:
            if n in names.get(o, ()): owner[n] = o; break
    for _ in range(20):  # not in the map (inline/COMDAT): the obj of a caller, PICK over link index
        for n in nodes:
            if n in owner: continue
            os = [idx[owner[c]] for c in callers.get(n, ()) if c in owner and owner[c] in idx]
            if os: owner[n] = objs[PICK(os)].split('/')[-1][:-4].lower()
    lst, seen = [], set()
    for o in reversed(objs):
        base = o.split('/')[-1][:-4].lower()
        for n in reversed(S[o]):
            if n in nodes and n not in seen and owner.get(n) == base:
                seen.add(n); lst.append(n)
    for i, n in enumerate(F):  # map-less fns (COMDAT inlines, compiler-made): right after their F predecessor
        if n in nodes and n not in seen:
            lst.insert(lst.index(F[i-1]) + 1 if i and F[i-1] in seen else 0, n); seen.add(n)
    return lst + [n for n in nodes if n not in seen], set(nodes) - hard

def fit(edges, cut, lst, soft, F, iters=40):
    """Move soft (map-less) fns in the list until the replay matches F; stops at the first hard mismatch."""
    for it in range(iters):
        s = peel_live(edges, cut, lst)
        k, _, Fg = score(s, F)
        if k == len(Fg): return lst, k, it
        x, y = s[k], Fg[k]
        if x in soft: lst.remove(x); lst.insert(lst.index(y) + 1, x)
        elif y in soft: lst.remove(y); lst.insert(lst.index(x), y)
        else: return lst, k, it
    return lst, k, it

def peel(edges, cut, order):
    need = {n: {c for c in edges[n] if c in edges and (n, c) not in cut and c != n} for n in order}
    done, out, left = set(), [], list(order)
    while left:
        emit = [n for n in left if not (need[n] - done)]
        if not emit: raise SystemExit('stuck: cycle without cut')
        out += emit; done.update(emit)
        left = [n for n in left if n not in done]
    return out

def peel_live(edges, cut, order):
    need = {n: {c for c in edges[n] if c in edges and (n, c) not in cut and c != n} for n in order}
    done, out, left = set(), [], list(order)
    while left:
        rest = []
        for n in left:
            if need[n] <= done: done.add(n); out.append(n)
            else: rest.append(n)
        if len(rest) == len(left): raise SystemExit('stuck')
        left = rest
    return out

def score(s, F):
    ss = set(s); Fg = [n for n in F if n in ss]
    k = next((i for i, (a, b) in enumerate(zip(s, Fg)) if a != b), len(Fg))
    return k, sum(a == b for a, b in zip(s, Fg)), Fg

def passes(edges, cut, order):
    """pass number of each fn under peel_live"""
    need = {n: {c for c in edges[n] if c in edges and (n, c) not in cut and c != n} for n in order}
    done, p, left, P = set(), 0, list(order), {}
    while left:
        rest = []
        for n in left:
            if need[n] <= done: done.add(n); P[n] = p
            else: rest.append(n)
        left = rest; p += 1
    return P

if __name__ == '__main__':
    B = sys.argv[1].rstrip('/') + '/'
    edges, cut, roots, F = load(B + 'dfs/ord.txt')
    lst, soft = symlist(B, edges, F)
    lst, k, it = fit(edges, cut, lst, soft, F, int(sys.argv[2]) if len(sys.argv) > 2 else 400)
    s = peel_live(edges, cut, lst)
    k, same, Fg = score(s, F)
    ri = {n: i for i, n in enumerate(Fg)}
    d = sorted(abs(i - ri[n]) for i, n in enumerate(s) if n in ri)
    print('fit moves', it, 'soft', len(soft), '| prefix', k, 'same-pos', same, '/', len(Fg),
          'median |dpos|', d[len(d)//2], 'p90', d[len(d)*9//10], 'within 5', sum(x <= 5 for x in d))
    if k < len(Fg): print(' first diff sim', s[k:k+3], '| real', Fg[k:k+3])
    t = []  # self-test: longest in-order run vs the oracle, names that occur once
    for x in (ri[n] for n in s if n in ri and not n.startswith('_$E')):
        j = bisect.bisect_left(t, x); t[j:j+1] = [x]
    print('in order (LIS)', len(t), '/', len(Fg))
    assert len(t) >= 0.99 * len(Fg), 'peel13 self-test failed: model no longer reproduces the oracle order'
    P = passes(edges, cut, lst)
    for n in sys.argv[3:]: print(n, 'sim', s.index(n), 'real', ri[n], 'pass', P[n])
    open(B + 'dfs/symlist.txt', 'w').write(chr(10).join(lst) + chr(10))
