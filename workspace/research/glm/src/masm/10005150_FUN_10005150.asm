.686
.MODEL FLAT, C
EXTRN sub_10013940:PROC
EXTRN fp_101D49C8:DWORD
.CODE
FUN_10005150 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, eax
    cmp edi, 1
    je L0
    cmp edi, 3
    je L0
    xor esi, esi
    jmp L1
L0:
    mov esi, 2
L1:
    push ebx
    push 010191BDCh
    push esi
    call dword ptr [fp_101D49C8]
    mov eax, edi
    add esp, 12
    sub eax, 0
    je L3
    sub eax, 3
    je L2
    dec eax
    jne L4
    mov edi, dword ptr [ebp]
    push 010191B74h
    and edi, 0FFFFFFFDh
    push esi
    mov dword ptr [ebp], edi
    call dword ptr [fp_101D49C8]
    add esp, 8
    pop edi
    pop esi
    pop ebp
    ret
L2:
    mov edi, dword ptr [ebp]
    push 010191BA8h
    and edi, 0FFFFFFFBh
    push esi
    mov dword ptr [ebp], edi
    call dword ptr [fp_101D49C8]
    add esp, 8
    pop edi
    pop esi
    pop ebp
    ret
L3:
    push ebx
    push 010191BDCh
    push 0
    call sub_10013940
    add esp, 12
L4:
    pop edi
    pop esi
    pop ebp
    ret
FUN_10005150 ENDP
END
