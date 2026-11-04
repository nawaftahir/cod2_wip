#!/usr/bin/env python3
"""ed7.py: w7-pb edits (run from lab13/w7/target/src/punkbuster)"""
def rd(p): return open(p, newline='', errors='surrogateescape').read()
def wr(p, s): open(p, 'w', newline='', errors='surrogateescape').write(s)
s = rd('pbsv.cpp')
i = s.index('inline char *itoa(int val, char *str, int radix)')
j = s.index('// name unknown (no Mac symbol)\ninline void pbChmod_813cbd4')
s = s[:i] + s[j:]
s = s.replace('itoa(Pb_Q_maxclients(), Data, 10);', '_itoa(Pb_Q_maxclients(), Data, 10);')
s = s.replace('#include <direct.h>', '#include <direct.h>\n#include <io.h>', 1)
s = s.replace('\tchmod(path, 0777);', '\t_chmod(path, 0x180);')
a = '''		// *"/" (not '/'): retail compares the promoted int
		if ( *m_cwd && m_cwd[strlen(m_cwd) - 1] != *"/" )
			strcat(m_cwd, "/");
		strcat(m_cwd, "pb/");'''
assert a in s
s = s.replace(a, '''		if ( *m_cwd && m_cwd[strlen(m_cwd) - 1] != *"\\\\" )
			strcat(m_cwd, "\\\\");
		strcat(m_cwd, "pb\\\\");''')
wr('pbsv.cpp', s)
c = rd('pbcl.cpp')
assert 'chmod(path, 0777);' in c
c = c.replace('\tchmod(path, 0777);', '\t_chmod(path, 0x180);')
if '#include <io.h>' not in c:
    c = c.replace('#include <direct.h>', '#include <direct.h>\n#include <io.h>', 1)
wr('pbcl.cpp', c)
