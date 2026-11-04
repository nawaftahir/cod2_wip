.686
.MODEL FLAT, C
EXTRN g_10730550:DWORD
.CODE
FUN_1003e2a0 PROC
    mov eax, dword ptr [g_10730550]
    push esi
    imul eax, eax, 000000CD0h
    push edi
    add eax, 01072DEE0h
    lea esi, [edx + 72]
    lea edi, [eax + 000000230h]
    mov ecx, 16
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea esi, [edx + 000000088h]
    lea edi, [eax + 000000340h]
    mov ecx, 16
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea esi, [edx + 0000000C8h]
    lea edi, [eax + 000000670h]
    mov ecx, 16
    rep movsd dword ptr es:[edi], dword ptr [esi]
    lea esi, [edx + 000000108h]
    lea edi, [eax + 0000006B0h]
    mov ecx, 16
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    pop esi
    ret
FUN_1003e2a0 ENDP
END
