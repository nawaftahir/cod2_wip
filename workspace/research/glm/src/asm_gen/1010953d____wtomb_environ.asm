; ___wtomb_environ @ 0x1010953d — auto-synthesized
    EXTRN g_1010c044:DWORD
    EXTRN g_101ae034:DWORD
    sub_100f853e PROTO C
    sub_100f855a PROTO C
    sub_100fc49b PROTO C
    sub_1010a425 PROTO C
.CODE
___wtomb_environ PROC
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    xor esi, esi
    push edi
    mov edi, dword ptr [g_101ae034]
    mov dword ptr [ebp - 4], esi
    mov eax, dword ptr [edi]
    cmp eax, esi
    je L0
    mov ebx, dword ptr [g_1010c044]
    push esi
    push esi
    push esi
    push esi
    push -1
    push eax
    push esi
    push esi
    call ebx
    cmp eax, esi
    mov dword ptr [ebp - 8], eax
    je L1
    push eax
    call sub_100fc49b
    cmp eax, esi
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L1
    push esi
    push esi
    push dword ptr [ebp - 8]
    push eax
    push -1
    push dword ptr [edi]
    push esi
    push esi
    call ebx
    test eax, eax
    je L2
    lea eax, [ebp - 4]
    push esi
    push eax
    call sub_1010a425
    test eax, eax
    pop ecx
    pop ecx
    jge L3
    cmp dword ptr [ebp - 4], esi
    je L3
    push dword ptr [ebp - 4]
    call sub_100f853e
    pop ecx
    mov dword ptr [ebp - 4], esi
    add edi, 4
    mov eax, dword ptr [edi]
    cmp eax, esi
    jne L4
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
    push dword ptr [ebp - 4]
    call sub_100f855a
    pop ecx
    or eax, 0xffffffff
    jmp L5
___wtomb_environ ENDP
END