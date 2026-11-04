; FUN_100845a4 @ 0x100845a4 — auto-synthesized
    sub_10084120 PROTO C
    sub_100f787d PROTO C
    sub_100f78b3 PROTO C
.CODE
FUN_100845a4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 0xc]
    shl esi, 4
    push esi
    call sub_100f787d
    mov ebx, eax
    test ebx, ebx
    pop ecx
    jne L0
    mov esi, 0x8007000e
    jmp L1
    push edi
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    mov edi, ebx
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    push 6
    and ecx, 3
    push esi
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [ebp + 8]
    push ebx
    call sub_10084120
    mov esi, eax
    pop edi
    push ebx
    call sub_100f78b3
    pop ecx
    mov eax, esi
    pop esi
    pop ebx
    pop ebp
    ret 0xc
FUN_100845a4 ENDP
END