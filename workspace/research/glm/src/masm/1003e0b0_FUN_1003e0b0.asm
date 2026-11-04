.686
.MODEL FLAT, C
EXTRN sub_100F6C97:PROC
EXTRN sub_100F6D53:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003e0b0 PROC
    sub esp, 64
    mov eax, dword ptr [esp + 68]
    push esi
    mov esi, dword ptr [g_1072DDC8]
    push edi
    add esi, 72
    mov ecx, 16
    lea edi, [esp + 8]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    pop edi
    mov dword ptr [esp + 64], eax
    pop esi
L0:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010199404h
    push 010193358h
    push eax
    call sub_100F6D53
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6C97
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    lea edx, [esp]
    push edx
    push 2
    push eax
    call dword ptr [ecx + 0xb0]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    add esp, 64
    ret
FUN_1003e0b0 ENDP
END
