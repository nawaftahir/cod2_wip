.686
.MODEL FLAT, C
EXTRN sub_10046A62:PROC
EXTRN sub_10046A73:PROC
.CODE
FUN_10046c70 PROC
    test eax, eax
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov edi, ecx
    mov ecx, eax
    jg L0
    mov eax, 000001388h
    cdq
    mov ecx, 1
    idiv ecx
    mov esi, eax
    jmp L2
L0:
    cmp eax, 100
    jle L3
    mov ecx, 100
L1:
    mov esi, 100
    sub esi, ecx
    shl esi, 1
L2:
    push ebp
    push esi
    push 010190970h
    xor ebx, ebx
    call sub_10046A62
    push ebp
    push esi
    push 010190A70h
    mov ebx, 1
    call sub_10046A73
    add esp, 24
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
L3:
    cmp eax, 50
    jge L1
    mov eax, 000001388h
    cdq
    idiv ecx
    mov esi, eax
    jmp L2
FUN_10046c70 ENDP
END
