; FUN_1000cb40 @ 0x1000cb40 — auto-synthesized
    sub_1000cbc5 PROTO C
.CODE
FUN_1000cb40 PROC
    mov cl, byte ptr [esi]
    xor edx, edx
    test cl, cl
    mov eax, 0x77
    je L0
    lea ecx, [ecx]
    movsx ecx, cl
    imul ecx, eax
    add edx, ecx
    mov cl, byte ptr [esi + eax - 0x76]
    inc eax
    test cl, cl
    jne L1
    and edx, 0x7ff
    mov eax, edx
    mov ecx, dword ptr [eax*4 + 0x101cea68]
    test ecx, ecx
    je sub_1000cbc5
    jmp L2
    lea esp, [esp]
    lea ecx, [ecx]
    inc eax
    and eax, 0x7ff
FUN_1000cb40 ENDP
END