.686
.MODEL FLAT, C
EXTRN sub_1001D590:PROC
EXTRN sub_1001D5C6:PROC
.CODE
FUN_1001cfd0 PROC
    mov eax, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 8]
    cmp edi, eax
    je L6
    push esi
    lea esi, [edi + 12]
    cmp esi, eax
    je L5
    push ebx
    push ebp
    lea ebp, [esi + 12]
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
    call sub_1001D590
    add esp, 8
    jmp L4
L1:
    lea edi, [ebp - 24]
    push edi
    push esi
    call ebx
    add esp, 8
    test al, al
    je L3
L2:
    mov ebx, edi
    sub edi, 12
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
    call sub_1001D5C6
    add esp, 8
L3:
    mov edi, dword ptr [esp + 20]
L4:
    mov eax, dword ptr [esp + 24]
    add esi, 12
    add ebp, 12
    cmp esi, eax
    jne L0
    pop ebp
    pop ebx
L5:
    pop esi
L6:
    pop edi
    ret
FUN_1001cfd0 ENDP
END
