.686
.MODEL FLAT, C
EXTRN sub_1001E930:PROC
EXTRN g_1019BDB0:DWORD
EXTRN g_1019BDB4:DWORD
.CODE
FUN_1001e6e0 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF0h
    sub esp, 000000088h
    mov eax, dword ptr [ecx + 12]
    movsx ecx, word ptr [ecx + 2]
    push ebx
    push edi
    emms
    test ecx, ecx
    jle sub_1001E930
    mov edi, edx
    add edi, 32
    mov ebx, ecx
    jmp L0
    lea esp, [esp]
    nop
L0:
    movaps xmm2, xmmword ptr [eax + 48]
    movsx ecx, word ptr [eax + 62]
    movaps xmm5, xmmword ptr [ecx + esi + 32]
    movaps xmm4, xmmword ptr [ecx + esi + 16]
    movaps xmm6, xmmword ptr [ecx + esi + 48]
    movaps xmm3, xmmword ptr [ecx + esi]
    movaps xmm0, xmmword ptr [eax]
    movaps xmmword ptr [esp + 112], xmm5
    movaps xmm7, xmm2
    shufps xmm7, xmm2, 0000000AAh
    mulps xmm5, xmm7
    addps xmm5, xmm6
    movaps xmm6, xmm2
    shufps xmm6, xmm2, 85
    add ecx, esi
    movaps xmm1, xmmword ptr [eax + 32]
    movaps xmm7, xmm4
    mulps xmm7, xmm6
    movaps xmm6, xmm2
    shufps xmm6, xmm2, 0
    movaps xmm2, xmm3
    mulps xmm2, xmm6
    movaps xmm6, xmmword ptr [esp + 112]
    addps xmm2, xmm7
    addps xmm2, xmm5
    movaps xmmword ptr [esp + 32], xmm2
    movaps xmmword ptr [esp + 16], xmm0
    movaps xmm2, xmmword ptr [esp + 16]
    movaps xmm0, xmmword ptr [eax + 16]
    movaps xmm5, xmm2
    shufps xmm5, xmm2, 0000000AAh
    mulps xmm6, xmm5
    movaps xmm5, xmm2
    shufps xmm5, xmm2, 85
    movzx edx, byte ptr [eax + 60]
    test edx, edx
    movaps xmm7, xmm4
    mulps xmm7, xmm5
    movaps xmm5, xmm2
    shufps xmm5, xmm2, 0
    movaps xmm2, xmm3
    mulps xmm2, xmm5
    movaps xmm5, xmmword ptr [esp + 112]
    addps xmm2, xmm7
    addps xmm2, xmm6
    movaps xmmword ptr [esp + 64], xmm2
    prefetchnta byte ptr [eax + 000000080h]
    movaps xmm2, xmm0
    shufps xmm2, xmm0, 0000000AAh
    mulps xmm5, xmm2
    movaps xmm2, xmm5
    movaps xmm5, xmm0
    shufps xmm5, xmm0, 85
    movaps xmm6, xmm4
    mulps xmm6, xmm5
    movaps xmm5, xmm0
    shufps xmm5, xmm0, 0
    movaps xmm7, xmm3
    mulps xmm7, xmm5
    movaps xmm5, xmm7
    movaps xmm7, xmmword ptr [esp + 32]
    addps xmm5, xmm6
    addps xmm5, xmm2
    movaps xmm2, xmm1
    shufps xmm2, xmm1, 0000000AAh
    movaps xmm6, xmm2
    movaps xmm2, xmmword ptr [esp + 112]
    mulps xmm2, xmm6
    movaps xmm6, xmm1
    shufps xmm6, xmm1, 85
    mulps xmm4, xmm6
    movaps xmm6, xmm1
    shufps xmm6, xmm1, 0
    mulps xmm3, xmm6
    addps xmm3, xmm4
    movaps xmm6, xmm3
    unpckhps xmm0, xmm1
    addps xmm6, xmm2
    movaps xmmword ptr [esp + 48], xmm0
    je L2
    movzx ecx, byte ptr [eax + 61]
    mov dword ptr [esp + 12], ecx
    add eax, 64
    fild dword ptr [esp + 12]
    fmul dword ptr [g_1019BDB4]
    fstp dword ptr [esp + 12]
    movss xmm0, dword ptr [esp + 12]
    shufps xmm0, xmm0, 0
    mulps xmm7, xmm0
    jmp L1
    lea esp, [esp]
L1:
    movaps xmm1, xmmword ptr [eax]
    movsx ecx, word ptr [eax + 12]
    movaps xmm4, xmmword ptr [ecx + esi + 32]
    movaps xmm2, xmmword ptr [ecx + esi]
    movaps xmm3, xmmword ptr [ecx + esi + 16]
    add ecx, esi
    movaps xmm0, xmm1
    shufps xmm0, xmm1, 0000000AAh
    mulps xmm4, xmm0
    movaps xmm0, xmmword ptr [ecx + 48]
    movzx ecx, word ptr [eax + 14]
    mov dword ptr [esp + 12], ecx
    addps xmm4, xmm0
    movaps xmm0, xmm1
    fild dword ptr [esp + 12]
    shufps xmm0, xmm1, 85
    mulps xmm3, xmm0
    movaps xmm0, xmm1
    fmul dword ptr [g_1019BDB0]
    shufps xmm0, xmm1, 0
    mulps xmm2, xmm0
    addps xmm2, xmm3
    fstp dword ptr [esp + 12]
    dec edx
    movss xmm1, dword ptr [esp + 12]
    addps xmm2, xmm4
    shufps xmm1, xmm1, 0
    add eax, 16
    test edx, edx
    mulps xmm1, xmm2
    addps xmm7, xmm1
    jne L1
    movaps xmm0, xmmword ptr [esp + 48]
    jmp L3
L2:
    add eax, 64
L3:
    movaps xmm1, xmmword ptr [esp + 64]
    movntps xmmword ptr [edi - 32], xmm7
    movaps xmm2, xmm1
    shufps xmm2, xmmword ptr [esp + 16], 0000000FAh
    shufps xmm0, xmm5, 78
    shufps xmm1, xmm2, 0000000D4h
    movntps xmmword ptr [edi - 16], xmm1
    movntps xmmword ptr [edi], xmm0
    shufps xmm5, xmm6, 34
    shufps xmm5, xmm6, 00000009Ch
    movntps xmmword ptr [edi + 16], xmm5
FUN_1001e6e0 ENDP
END
