; FUN_1008c825 @ 0x1008c825 — auto-synthesized
    sub_100f787f PROTO C
.CODE
FUN_1008c825 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    test byte ptr [ebp + 8], 1
    push esi
    mov esi, ecx
    mov dword ptr [esi], 0x10110440
    je L0
    push esi
    call sub_100f787f
    pop ecx
    mov eax, esi
    pop esi
    pop ebp
    ret 4
FUN_1008c825 ENDP
END