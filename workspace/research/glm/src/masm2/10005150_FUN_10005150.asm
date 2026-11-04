.686
.MODEL FLAT, C
EXTRN sub_100051DF:PROC
EXTRN sub_100051F6:PROC
EXTRN sub_1000520E:PROC
EXTRN sub_10013940:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
.CODE
FUN_10005150 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    mov mov edi, eax
    cmp cmp edi, 1
    je L0
    cmp cmp edi, 3
    je L1
    xor xor esi, esi
    jmp L2
    mov mov esi, 2
    push push ebx
    push push 010191BDCh
    push push esi
    call dword ptr [fp_101D49C8]
    mov mov eax, edi
    add add esp, 12
    sub sub eax, 0
    je sub_100051F6
L2:
    sub sub eax, 3
    je sub_100051DF
    dec dec eax
    jne sub_1000520E
    mov mov edi, dword ptr [ebp]
    push push 010191B74h
    and and edi, -3
    push push esi
    mov mov dword ptr [ebp], edi
    call dword ptr [fp_101D49C8]
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    mov mov edi, dword ptr [ebp]
    push push 010191BA8h
    and and edi, -5
    push push esi
    mov mov dword ptr [ebp], edi
    call dword ptr [fp_101D49C8]
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    push push ebx
    push push 010191BDCh
    push push 0
    call sub_10013940
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_10005150 ENDP
END
