; FUN_10068b85 @ 0x10068b85 — auto-synthesized
    sub_100f731d PROTO C
.CODE
FUN_10068b85 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    test esi, esi
    je L0
    mov al, byte ptr [esi]
    test al, al
    je L0
    movsx eax, al
    push eax
    call sub_100f731d
    imul edi, edi, 0x13
    add edi, eax
    inc esi
    mov al, byte ptr [esi]
    test al, al
    pop ecx
    jne L1
    push 7
    mov eax, edi
    xor edx, edx
    pop ecx
    div ecx
    mov eax, edx
    jmp L2
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10068b85 ENDP
END