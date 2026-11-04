.686
.MODEL FLAT, C
EXTRN sub_1003E13D:PROC
EXTRN sub_1003E14B:PROC
EXTRN sub_1003E14D:PROC
EXTRN sub_100F6C97:PROC
EXTRN sub_100F6D53:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003e0b0 PROC
    sub sub esp, 64
    mov mov eax, dword ptr [esp + 68]
    push push esi
    mov mov esi, dword ptr [g_1072DDC8]
    push push edi
    add add esi, 72
    mov mov ecx, 16
    lea lea edi, [esp + 8]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    pop pop edi
    mov mov dword ptr [esp + 64], eax
    pop pop esi
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_1003E13D
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003E14B
    push push 010199404h
    push push 010193358h
    push push eax
    call sub_100F6D53
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6C97
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    lea lea edx, [esp]
    push push edx
    push push 2
    push push eax
    call call dword ptr [ecx + 0B0h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003E14D
    add add esp, 64
    ret ret
FUN_1003e0b0 ENDP
END
