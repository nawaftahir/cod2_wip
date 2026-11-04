.686
.MODEL FLAT, C
EXTRN sub_1003C446:PROC
EXTRN sub_1003C454:PROC
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D60:PROC
EXTRN EXTRN g_101CE67C:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003c3a0 PROC
    test test ah, 15
    push push esi
    je L0
    xor xor esi, esi
    jmp L1
    mov mov ecx, dword ptr [g_101CE67C]
L0:
    mov mov edx, dword ptr [ecx + 8]
    xor xor eax, eax
    cmp cmp edx, 2
    setne setne al
    dec dec eax
    and and eax, 0FDF1FF12h
    add add eax, 0434F5441h
    mov mov esi, eax
    jmp L2
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003C446
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1003C454
    push push 01019A370h
    push push 010193358h
    push push eax
    call sub_100F6D60
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CA3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 0B5h
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
FUN_1003c3a0 ENDP
END
