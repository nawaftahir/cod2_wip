; FUN_10081a12 @ 0x10081a12 — auto-synthesized
    sub_100f787c PROTO C
.CODE
FUN_10081a12 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100f787c
    test eax, eax
    pop ecx
    mov dword ptr [esi + 0xc], eax
    jne L0
    mov eax, 0x8007000e
    jmp L1
    mov dword ptr [esi + 8], edi
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10081a12 ENDP
END