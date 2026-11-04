.686
.MODEL FLAT, C
EXTRN sub_100F6C93:PROC
EXTRN sub_100F6D50:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1002b920 PROC
    mov ecx, dword ptr [g_101CE708]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    cmp edx, 2
    setne al
    push esi
    dec eax
    and eax, 0FFFFFFE4h
    add eax, 64
    shl eax, 16
    mov esi, eax
    mov edi, edi
L0:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010197480h
    push 010193358h
    push eax
    call sub_100F6D50
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6C93
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 0
    push 0101D49B4h
    push 0
    push 0
    push 000000208h
    push esi
    push eax
    call dword ptr [ecx + 0x68]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    pop esi
    ret
FUN_1002b920 ENDP
END
