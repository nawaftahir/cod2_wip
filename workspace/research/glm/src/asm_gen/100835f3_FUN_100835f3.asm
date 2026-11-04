; FUN_100835f3 @ 0x100835f3 — auto-synthesized
    sub_100827ec PROTO C
    sub_100829be PROTO C
.CODE
FUN_100835f3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100827ec
    test eax, eax
    jne L0
    xor eax, eax
    jmp L1
    lea eax, [edi + 0x10]
    lea ecx, [esi + 0x10]
    call sub_100829be
    test eax, eax
    je L2
    mov eax, dword ptr [edi + 0x30]
    cmp eax, dword ptr [esi + 0x30]
    jne L2
    mov eax, dword ptr [edi + 0x34]
    sub eax, dword ptr [esi + 0x34]
    neg eax
    sbb eax, eax
    inc eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_100835f3 ENDP
END