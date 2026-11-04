; FUN_1005ed70 @ 0x1005ed70 — auto-synthesized
    sub_1005edb6 PROTO C
    sub_1005edd1 PROTO C
.CODE
FUN_1005ed70 PROC
    push ebp
    mov ebp, esp
    sub eax, 0
    je L0
    sub eax, 2
    jne sub_1005edb6
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 0xc]
    cmp ecx, 0x1000
    jle L1
    mov ecx, 0x1000
    add ecx, 0x1f
    shr ecx, 5
    je sub_1005edd1
    jmp L2
    jmp L2
    lea ecx, [ecx]
    test byte ptr [ebx], al
    add ebx, 0x20
    dec ecx
FUN_1005ed70 ENDP
END