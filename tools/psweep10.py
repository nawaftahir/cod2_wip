# psweep10.py FILE OBJ FN ADDR SIZE START END: for each line START..END of the form "lhs = rhs;" try "lhs = ((rhs));",
# lab-build it (real fn) and print fdiff lines + same-offset bytes of the fn. Restores the file.
import sys, subprocess, re, shutil
import os; W=os.path.dirname(os.path.dirname(os.path.abspath(__file__))); A='/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.0/CoD2MP_s.exe'
F, OBJ, FN, AD, SZ, S, E = sys.argv[1:8]; S, E = int(S), int(E); p = f'{W}/{F}'
orig = open(p, encoding='latin-1').read().split('\n')
def run(lines, tag):
    open(p, 'w', encoding='latin-1').write('\n'.join(lines))
    subprocess.run(f'cd {W} && bash tools/lab10.sh {OBJ} >/dev/null 2>&1', shell=True)
    d = subprocess.run(f'cd {W} && python3 tools/fdiff.py build/ra/ox.exe build/ra/ox.map {A} "{FN}" {AD}', shell=True, capture_output=True, text=True).stdout
    n = sum(1 for l in d.split('\n') if re.match(r'^[-+][^-+]', l))
    b = subprocess.run(f'cd {W} && python3 tools/fb10.py build/ra/ox.exe {AD[2:]} {SZ}', shell=True, capture_output=True, text=True).stdout.strip()
    print(f'{tag}: {d.split(chr(10))[0].split(" ",1)[-1]} diff {n} bytes {b}', flush=True)
try:
    run(orig, 'base')
    for i in range(S - 1, E):
        m = re.match(r'^(\s*)([^=;]+?) = (.+);\s*$', orig[i])
        if not m or '==' in orig[i]: continue
        l = orig[:]; l[i] = f'{m[1]}{m[2]} = (({m[3]}));'; run(l, f'L{i+1}')
finally:
    open(p, 'w', encoding='latin-1').write('\n'.join(orig))
