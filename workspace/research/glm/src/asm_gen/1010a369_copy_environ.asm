; copy_environ @ 0x1010a369 — auto-synthesized
    sub_100f786e PROTO C
    sub_100f79e8 PROTO C
    sub_100fc48f PROTO C
.CODE
copy_environ PROC
    push ebp
    mov ebp, esp
    push ecx
    xor ecx, ecx
    test edi, edi
    mov eax, edi
    jne L0
    leave
    ret
    cmp dword ptr [edi], 0
    je L1
    add eax, 4
    inc ecx
    cmp dword ptr [eax], 0
    jne L2
    push ebx
    lea eax, [ecx*4 + 4]
    push esi
    push eax
    call sub_100fc48f
    mov esi, eax
    test esi, esi
    pop ecx
    mov dword ptr [ebp - 4], esi
    jne L3
    push 9
    call sub_100f786e
    pop ecx
    mov eax, dword ptr [edi]
    mov ebx, edi
    jmp L4
    push eax
    call sub_100f79e8
    mov dword ptr [esi], eax
    add esi, 4
    add ebx, 4
    mov eax, dword ptr [ebx]
    pop ecx
    test eax, eax
    jne L5
    and dword ptr [esi], eax
    mov eax, dword ptr [ebp - 4]
    pop esi
    pop ebx
    leave
    ret
copy_environ ENDP
END