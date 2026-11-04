.686
.MODEL FLAT, C
EXTRN sub_1002E3A1:PROC
EXTRN sub_100317F3:PROC
EXTRN sub_10031842:PROC
EXTRN sub_100340A8:PROC
EXTRN fp_101D49DC:DWORD
EXTRN fp_101D49E0:DWORD
EXTRN g_1072DEBD:DWORD
.CODE
FUN_10034500 PROC
    sub esp, 12
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    test edi, edi
    mov esi, ecx
    je L7
    mov al, byte ptr [g_1072DEBD]
    test al, al
    je L0
    call sub_1002E3A1
L0:
    push 00000AA50h
    call dword ptr [fp_101D49DC]
    mov edx, dword ptr [esi + 40]
    add esp, 4
    test edx, edx
    setne byte ptr [esp + 20]
    mov ebp, eax
    xor eax, eax
    test edi, edi
    jle L4
    mov dword ptr [esp + 24], edi
    mov edi, dword ptr [esp + 20]
    add esi, 24
    lea esp, [esp]
L1:
    mov edx, dword ptr [esi + 16]
    mov cl, byte ptr [esp + 20]
    test edx, edx
    setne bl
    cmp cl, bl
    je L3
    cdq
    sub eax, edx
    sar eax, 1
    test eax, eax
    je L2
    push edi
    push ebp
    push 1
    push eax
    call sub_100317F3
    add esp, 16
L2:
    mov byte ptr [esp + 20], bl
    mov edi, dword ptr [esp + 20]
    xor eax, eax
L3:
    push eax
    push edi
    lea eax, [esi - 12]
    push eax
    lea ecx, [esi - 24]
    push ecx
    mov eax, ebp
    mov ecx, 000000AA5h
    mov ebx, esi
    call sub_100340A8
    mov ecx, dword ptr [esp + 40]
    add esp, 16
    add esi, 44
    dec ecx
    mov dword ptr [esp + 24], ecx
    jne L1
    jmp L5
L4:
    mov edi, dword ptr [esp + 20]
L5:
    cdq
    sub eax, edx
    sar eax, 1
    test eax, eax
    je L6
    push edi
    push ebp
    push 1
    push eax
    call sub_10031842
    add esp, 16
L6:
    push ebp
    call dword ptr [fp_101D49E0]
    add esp, 4
L7:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
FUN_10034500 ENDP
END
