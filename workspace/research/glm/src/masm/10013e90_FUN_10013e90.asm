.686
.MODEL FLAT, C
EXTRN sub_100144C0:PROC
EXTRN sub_100144F6:PROC
.CODE
FUN_10013e90 PROC
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 8]
    cmp edi, eax
    je L6
    push esi
    lea esi, [edi + 16]
    cmp esi, eax
    je L5
    push ebx
    push ebp
    lea ebp, [esi + 16]
    mov edi, edi
L0:
    mov ebx, dword ptr [esp + 28]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L1
    cmp edi, esi
    je L4
    cmp esi, ebp
    je L4
    push ebp
    push edi
    mov eax, esi
    call sub_100144C0
    add esp, 8
    jmp L4
L1:
    lea edi, [ebp - 32]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L3
L2:
    mov ebx, edi
    sub edi, 16
    push edi
    push esi
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    jne L2
    cmp ebx, esi
    je L3
    cmp esi, ebp
    je L3
    push ebp
    push ebx
    mov eax, esi
    call sub_100144F6
    add esp, 8
L3:
    mov edi, dword ptr [esp + 20]
L4:
    mov eax, dword ptr [esp + 24]
    add esi, 16
    add ebp, 16
    cmp esi, eax
    jne L0
    pop ebp
    pop ebx
L5:
    pop esi
L6:
    pop edi
    ret
FUN_10013e90 ENDP
END
