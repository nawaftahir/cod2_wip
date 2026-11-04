.686
.MODEL FLAT, C
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D60:PROC
EXTRN g_101CE67C:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003c3a0 PROC
    test ah, 15
    push esi
    je L0
    xor esi, esi
    jmp L1
L0:
    mov ecx, dword ptr [g_101CE67C]
    mov edx, dword ptr [ecx + 8]
    xor eax, eax
    cmp edx, 2
    setne al
    dec eax
    and eax, 0FDF1FF12h
    add eax, 0434F5441h
    mov esi, eax
    jmp L1
    lea ebx, [ebx]
L1:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 01019A370h
    push 010193358h
    push eax
    call sub_100F6D60
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CA3
    add esp, 16
L2:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 0000000B5h
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
FUN_1003c3a0 ENDP
END
