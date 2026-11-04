.686
.MODEL FLAT, C
EXTRN sub_1002899C:PROC
.CODE
FUN_100284e0 PROC
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 8]
    cmp edi, eax
    je L7
    push esi
    lea esi, [edi + 8]
    cmp esi, eax
    je L6
    push ebx
    push ebp
    lea ebp, [esi + 8]
    jmp L1
L0:
    mov edi, dword ptr [esp + 20]
L1:
    mov ebx, dword ptr [esp + 28]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L2
    cmp edi, esi
    je L5
    cmp esi, ebp
    je L5
    push edi
    jmp L4
L2:
    lea edi, [ebp - 16]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L5
L3:
    mov ebx, edi
    sub edi, 8
    push edi
    push esi
    call dword ptr [esp + 0x24]
    add esp, 8
    test al, al
    jne L3
    cmp ebx, esi
    je L5
    cmp esi, ebp
    je L5
    push ebx
L4:
    mov eax, esi
    mov ebx, ebp
    call sub_1002899C
    add esp, 4
L5:
    mov eax, dword ptr [esp + 24]
    add esi, 8
    add ebp, 8
    cmp esi, eax
    jne L0
    pop ebp
    pop ebx
L6:
    pop esi
L7:
    pop edi
    ret
FUN_100284e0 ENDP
END
