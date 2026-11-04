; FUN_1001acb0 @ 0x1001acb0 — auto-synthesized
    sub_1001abb8 PROTO C
.CODE
FUN_1001acb0 PROC
    push ecx
    push ebx
    mov ebx, eax
    xor ecx, ecx
    xor eax, eax
    jmp L0
    lea ebx, [ebx]
    mov edx, dword ptr [eax + 0x10190254]
    add eax, 8
    cmp eax, 0x28
    mov byte ptr [esi + edx], cl
    jne L0
    mov byte ptr [esp + 7], cl
    mov byte ptr [esp + 6], cl
    lea esp, [esp]
    mov al, byte ptr [esp + 6]
    test al, al
    jne L1
    lea eax, [esp + 6]
    push eax
    lea ecx, [esp + 0xb]
    push ecx
    push esi
    call sub_1001abb8
    mov al, byte ptr [esp + 0x13]
    add esp, 0xc
    test al, al
    je L2
    mov cl, byte ptr [esp + 6]
    xor eax, eax
    test cl, cl
FUN_1001acb0 ENDP
END