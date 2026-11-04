#!/usr/bin/env python3
"""ed7.py: batch 1 of server-text edits (run from lab13/w7/target/src)"""
def sub(p, a, b):
    s = open(p, newline='', errors='surrogateescape').read()
    assert s.count(a) == 1, (p, a, s.count(a))
    open(p, 'w', newline='', errors='surrogateescape').write(s.replace(a, b))
sub('qcommon/cm_trace.cpp', 'tw.isPoint = 0.0f == tw.size', 'tw.isPoint = 0.0 == tw.size')
sub('universal/com_math.cpp', 'invDet = 1.0f / det;', 'invDet = 1.0 / det;')
sub('qcommon/cm_world.cpp', '(unsigned int)i < AREA_NODES - 1; i++', '(unsigned int)i <= AREA_NODES - 2; i++')
sub('game/g_client_mp.cpp', 'origin[2] = (origin[2] + deltaVert);', 'origin[2] = origin[2] + deltaVert;')
sub('game/g_scr_main_mp.cpp', '\tint l;\n\n\tn = 0;\n\n\tmemset(g_scr_data.gametype.list', '\tint l;\n\n\tmemset(buffer, 0, sizeof(buffer));\n\tn = 0;\n\n\tmemset(g_scr_data.gametype.list')
