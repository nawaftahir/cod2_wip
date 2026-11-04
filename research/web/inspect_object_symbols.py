"""Read-only MSVC 7.1 /GL object symbol census; no ledger or source mutations."""
import subprocess
from pathlib import Path
import shutil

sources = (
    "src/universal/dvar.cpp", "src/universal/com_math.cpp",
    "src/universal/com_files.cpp", "src/radiant/Pmesh.cpp"
)
for source in sources:
    obj = Path('build/obj') / Path(source).with_suffix('.obj')
    print('OBJECT', source, 'exists', obj.exists(), 'bytes', obj.stat().st_size if obj.exists() else 0, flush=True)
    if not obj.exists():
        continue
    commands = [
        ['wine', '/opt/msvc710/Vc7/bin/dumpbin.exe', '/SYMBOLS', str(obj)],
        ['wine', '/opt/msvc710/Vc7/bin/link.exe', '/DUMP', '/SYMBOLS', str(obj)],
        ['objdump', '-t', str(obj)],
    ]
    for cmd in commands:
        if not Path(cmd[0]).exists() and shutil.which(cmd[0]) is None:
            continue
        if cmd[0] == 'wine' and not Path(cmd[1]).exists():
            continue
        try:
            p = subprocess.run(cmd, capture_output=True, text=True, timeout=35)
        except Exception as e:
            print('CMD-ERROR', str(e), flush=True)
            continue
        txt = p.stdout + '\n' + p.stderr
        rows = [s for s in txt.splitlines() if 'Dvar_' in s or 'FS_' in s or
                'Vec3' in s or 'Angle' in s or 'Patch_' in s or
                'warning' in s.lower() or 'error' in s.lower()]
        print('CMD', ' '.join(cmd), 'status', p.returncode, 'total', len(txt), 'rows', len(rows), flush=True)
        for line in rows[:70]:
            print('SYM', line[:240], flush=True)
        if p.returncode == 0 and rows:
            break
