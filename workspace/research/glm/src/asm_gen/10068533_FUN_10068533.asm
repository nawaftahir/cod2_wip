; FUN_10068533 @ 0x10068533 — auto-synthesized
    sub_100682b8 PROTO C
.CODE
FUN_10068533 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, ecx
    cmp edi, dword ptr [ebx + 4]
    jae L0
    cmp byte ptr [edi], 0x27
    jne L0
    push dword ptr [ebp + 0xc]
    lea esi, [edi + 1]
    push esi
    call sub_100682b8
    test eax, eax
    je L0
    add esi, eax
    cmp esi, dword ptr [ebx + 4]
    jae L0
    cmp byte ptr [esi], 0x27
    jne L0
    mov eax, esi
    sub eax, edi
    inc eax
    jmp L1
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_10068533 ENDP
END