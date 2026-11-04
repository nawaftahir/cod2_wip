; FUN_1006c449 @ 0x1006c449 — auto-synthesized
    sub_100f789e PROTO C
    sub_100f78af PROTO C
.CODE
FUN_1006c449 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 0x94]
    cmp dword ptr [ebp + 8], eax
    push esi
    jbe L0
    test eax, eax
    je L1
    lea esi, [eax + eax]
    jmp L2
    push 0x10
    pop esi
    jmp L2
    add esi, esi
    cmp esi, dword ptr [ebp + 8]
    jb L3
    mov eax, esi
    shl eax, 2
    push eax
    call sub_100f789e
    test eax, eax
    pop ecx
    mov dword ptr [ebp + 8], eax
    je L4
    push edi
    lea edi, [ebx + 0x90]
    push dword ptr [edi]
    call sub_100f78af
    mov eax, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [edi], eax
    mov dword ptr [ebx + 0x94], esi
    pop edi
    mov eax, dword ptr [ebx + 0x90]
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_1006c449 ENDP
END