.686
.MODEL FLAT, C
.CODE
FUN_1007d7ee PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    xor edi, edi
    cmp edi, dword ptr [ebp + 8]
    jae L1
    mov esi, ebx
    sub esi, eax
L0:
    mov cl, byte ptr [esi + eax]
    mov dl, byte ptr [eax]
    cmp cl, dl
    jl L3
    jg L2
    inc edi
    inc eax
    cmp edi, dword ptr [ebp + 8]
    jb L0
    cmp edi, dword ptr [ebp + 8]
L1:
    jne L4
    cmp byte ptr [edi + ebx], 0
    je L4
L2:
    xor eax, eax
    inc eax
    jmp L5
L3:
    or eax, 0FFFFFFFFh
    jmp L5
L4:
    xor eax, eax
L5:
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_1007d7ee ENDP
END
