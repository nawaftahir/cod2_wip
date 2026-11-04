; FUN_10067b01 @ 0x10067b01 — auto-synthesized
    sub_100f75cd PROTO C
.CODE
FUN_10067b01 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    cmp esi, dword ptr [ecx + 4]
    push edi
    push 5
    mov edi, esi
    pop ebx
    jb L0
    xor eax, eax
    jmp L1
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f75cd
    sub eax, 0x66
    pop ecx
    je L2
    dec eax
    dec eax
    jne L3
    push 6
    jmp L4
    push 7
    pop ebx
    lea edi, [esi + 1]
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L5
    mov dword ptr [eax], ebx
    mov eax, edi
    sub eax, esi
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 8
FUN_10067b01 ENDP
END