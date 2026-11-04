#!/usr/bin/env python3
"""ed7.py: w7-hard edits (run from lab13/w7/target/src); line count of the file stays the same"""
def sub(p, a, b):
    s = open(p, newline='', errors='surrogateescape').read()
    assert s.count(a) == 1, (p, a, s.count(a))
    open(p, 'w', newline='', errors='surrogateescape').write(s.replace(a, b))
sub('server/sv_main_mp.cpp',
    '\t\t}\n\n\t\treturn;\n\t}\n\n\ts = MSG_ReadStringLine',
    '\t\t}\n\t\t/* the client side PunkBuster also sees pb_ packets except the server query ones */\n'
    '\t\tif ( msg->data[7] != \'S\' && msg->data[7] != \'2\' && msg->data[7] != \'G\' && msg->data[7] != \'I\' && msg->data[7] != \'Y\' && msg->data[7] != \'B\' && msg->data[7] != \'L\' ) { if ( !com_dedicated || !com_dedicated->current.integer ) PbClAddEvent( 13, msg->cursize - 4, (char *)msg->data + 4 ); }\n'
    '\t\treturn;\n\t}\n\n\ts = MSG_ReadStringLine')
sub('server/sv_main_mp.cpp', 'void PbPassConnectString( char *fromAddr, char *connectString );\n',
    'void PbPassConnectString( char *fromAddr, char *connectString ); void PbClAddEvent( int type, int datalen, char *data );\n')
