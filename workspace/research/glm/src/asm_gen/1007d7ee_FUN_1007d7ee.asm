; FUN_1007d7ee @ 0x1007d7ee — auto-synthesized
.CODE
FUN_1007d7ee PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    xor edi, edi
    cmp edi, dword ptr [ebp + 8]
    jae L0
    mov esi, ebx
    sub esi, eax
    mov cl, byte ptr [esi + eax]
    mov dl, byte ptr [eax]
    cmp cl, dl
    jl L1
    jg L2
    inc edi
    inc eax
    cmp edi, dword ptr [ebp + 8]
    jb L3
    cmp edi, dword ptr [ebp + 8]
    jne L4
    cmp byte ptr [edi + ebx], 0
    je L4
    xor eax, eax
    inc eax
    jmp L5
    or eax, 0xffffffff
    jmp L5
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_1007d7ee ENDP
END