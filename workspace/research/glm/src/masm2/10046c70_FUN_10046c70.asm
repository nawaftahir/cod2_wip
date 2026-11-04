.686
.MODEL FLAT, C
EXTRN sub_10046A62:PROC
EXTRN sub_10046A73:PROC
EXTRN sub_10046CF1:PROC
EXTRN sub_10046CFB:PROC
EXTRN sub_10046D10:PROC
.CODE
FUN_10046c70 PROC
    test test eax, eax
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov ecx, eax
    jg L0
    mov mov eax, 01388h
    cdq cdq
    mov mov ecx, 1
    idiv idiv ecx
    mov mov esi, eax
    jmp L1
    cmp cmp eax, 100
    jle sub_10046CF1
    mov mov ecx, 100
    mov mov esi, 100
    sub sub esi, ecx
    shl shl esi, 1
    push push ebp
    push push esi
    push push 010190970h
    xor xor ebx, ebx
    call sub_10046A62
    push push ebp
    push push esi
    push push 010190A70h
    mov mov ebx, 1
    call sub_10046A73
    add add esp, 24
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
    cmp cmp eax, 50
    jge sub_10046CFB
    mov mov eax, 01388h
    cdq cdq
    idiv idiv ecx
    mov mov esi, eax
    jmp sub_10046D10
FUN_10046c70 ENDP
END
