.686
.MODEL FLAT, C
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1003e2a0 PROC
    mov mov eax, dword ptr [g_10730550]
    push push esi
    imul imul eax, eax, 0CD0h
    push push edi
    add add eax, 01072DEE0h
    lea lea esi, [edx + 72]
    lea lea edi, [eax + 0230h]
    mov mov ecx, 16
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea esi, [edx + 088h]
    lea lea edi, [eax + 0340h]
    mov mov ecx, 16
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea esi, [edx + 0C8h]
    lea lea edi, [eax + 0670h]
    mov mov ecx, 16
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    lea lea esi, [edx + 0108h]
    lea lea edi, [eax + 06B0h]
    mov mov ecx, 16
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    pop pop edi
    pop pop esi
    ret ret
FUN_1003e2a0 ENDP
END
