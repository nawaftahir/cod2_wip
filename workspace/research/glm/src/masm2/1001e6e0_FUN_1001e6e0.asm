.686
.MODEL FLAT, C
EXTRN sub_1001E930:PROC
EXTRN sub_1001E9D9:PROC
EXTRN sub_1001EA28:PROC
EXTRN sub_1001EA50:PROC
EXTRN sub_1001EAD1:PROC
EXTRN EXTRN g_1019BDB0:DWORD:DWORD
EXTRN EXTRN g_1019BDB4:DWORD:DWORD
.CODE
FUN_1001e6e0 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -16
    sub sub esp, 088h
    mov mov eax, dword ptr [ecx + 12]
    movsx movsx ecx, word ptr [ecx + 2]
    push push ebx
    push push edi
    emms emms
    test test ecx, ecx
    jle sub_1001E930
    mov mov edi, edx
    add add edi, 32
    mov mov ebx, ecx
    jmp L0
    lea lea esp, [esp]
    nop nop
    movaps movaps xmm2, xmmword ptr [eax + 48]
    movsx movsx ecx, word ptr [eax + 62]
    movaps movaps xmm5, xmmword ptr [ecx + esi + 32]
    movaps movaps xmm4, xmmword ptr [ecx + esi + 16]
    movaps movaps xmm6, xmmword ptr [ecx + esi + 48]
    movaps movaps xmm3, xmmword ptr [ecx + esi]
    movaps movaps xmm0, xmmword ptr [eax]
    movaps movaps xmmword ptr [esp + 112], xmm5
    movaps movaps xmm7, xmm2
    shufps shufps xmm7, xmm2, 0AAh
    mulps mulps xmm5, xmm7
    addps addps xmm5, xmm6
    movaps movaps xmm6, xmm2
    shufps shufps xmm6, xmm2, 85
    add add ecx, esi
    movaps movaps xmm1, xmmword ptr [eax + 32]
    movaps movaps xmm7, xmm4
    mulps mulps xmm7, xmm6
    movaps movaps xmm6, xmm2
    shufps shufps xmm6, xmm2, 0
    movaps movaps xmm2, xmm3
    mulps mulps xmm2, xmm6
    movaps movaps xmm6, xmmword ptr [esp + 112]
    addps addps xmm2, xmm7
    addps addps xmm2, xmm5
    movaps movaps xmmword ptr [esp + 32], xmm2
    movaps movaps xmmword ptr [esp + 16], xmm0
    movaps movaps xmm2, xmmword ptr [esp + 16]
    movaps movaps xmm0, xmmword ptr [eax + 16]
    movaps movaps xmm5, xmm2
    shufps shufps xmm5, xmm2, 0AAh
    mulps mulps xmm6, xmm5
    movaps movaps xmm5, xmm2
    shufps shufps xmm5, xmm2, 85
    movzx movzx edx, byte ptr [eax + 60]
    test test edx, edx
    movaps movaps xmm7, xmm4
    mulps mulps xmm7, xmm5
    movaps movaps xmm5, xmm2
    shufps shufps xmm5, xmm2, 0
    movaps movaps xmm2, xmm3
    mulps mulps xmm2, xmm5
    movaps movaps xmm5, xmmword ptr [esp + 112]
    addps addps xmm2, xmm7
    addps addps xmm2, xmm6
    movaps movaps xmmword ptr [esp + 64], xmm2
    prefetchnta prefetchnta byte ptr [eax + 080h]
    movaps movaps xmm2, xmm0
    shufps shufps xmm2, xmm0, 0AAh
    mulps mulps xmm5, xmm2
    movaps movaps xmm2, xmm5
    movaps movaps xmm5, xmm0
    shufps shufps xmm5, xmm0, 85
    movaps movaps xmm6, xmm4
    mulps mulps xmm6, xmm5
    movaps movaps xmm5, xmm0
    shufps shufps xmm5, xmm0, 0
    movaps movaps xmm7, xmm3
    mulps mulps xmm7, xmm5
    movaps movaps xmm5, xmm7
    movaps movaps xmm7, xmmword ptr [esp + 32]
    addps addps xmm5, xmm6
    addps addps xmm5, xmm2
    movaps movaps xmm2, xmm1
    shufps shufps xmm2, xmm1, 0AAh
    movaps movaps xmm6, xmm2
    movaps movaps xmm2, xmmword ptr [esp + 112]
    mulps mulps xmm2, xmm6
    movaps movaps xmm6, xmm1
    shufps shufps xmm6, xmm1, 85
    mulps mulps xmm4, xmm6
    movaps movaps xmm6, xmm1
    shufps shufps xmm6, xmm1, 0
    mulps mulps xmm3, xmm6
    addps addps xmm3, xmm4
    movaps movaps xmm6, xmm3
    unpckhps unpckhps xmm0, xmm1
    addps addps xmm6, xmm2
    movaps movaps xmmword ptr [esp + 48], xmm0
    je sub_1001EA28
    movzx movzx ecx, byte ptr [eax + 61]
    mov mov dword ptr [esp + 12], ecx
    add add eax, 64
    fild fild dword ptr [esp + 12]
    fmul fmul dword ptr [g_1019BDB4]
    fstp fstp dword ptr [esp + 12]
    movss movss xmm0, dword ptr [esp + 12]
    shufps shufps xmm0, xmm0, 0
    mulps mulps xmm7, xmm0
    jmp sub_1001E9D9
    lea lea esp, [esp]
    movaps movaps xmm1, xmmword ptr [eax]
    movsx movsx ecx, word ptr [eax + 12]
    movaps movaps xmm4, xmmword ptr [ecx + esi + 32]
    movaps movaps xmm2, xmmword ptr [ecx + esi]
    movaps movaps xmm3, xmmword ptr [ecx + esi + 16]
    add add ecx, esi
    movaps movaps xmm0, xmm1
    shufps shufps xmm0, xmm1, 0AAh
    mulps mulps xmm4, xmm0
    movaps movaps xmm0, xmmword ptr [ecx + 48]
    movzx movzx ecx, word ptr [eax + 14]
    mov mov dword ptr [esp + 12], ecx
    addps addps xmm4, xmm0
    movaps movaps xmm0, xmm1
    fild fild dword ptr [esp + 12]
    shufps shufps xmm0, xmm1, 85
    mulps mulps xmm3, xmm0
    movaps movaps xmm0, xmm1
    fmul fmul dword ptr [g_1019BDB0]
    shufps shufps xmm0, xmm1, 0
    mulps mulps xmm2, xmm0
    addps addps xmm2, xmm3
    fstp fstp dword ptr [esp + 12]
    dec dec edx
    movss movss xmm1, dword ptr [esp + 12]
    addps addps xmm2, xmm4
    shufps shufps xmm1, xmm1, 0
    add add eax, 16
    test test edx, edx
    mulps mulps xmm1, xmm2
    addps addps xmm7, xmm1
    jne sub_1001EA50
    movaps movaps xmm0, xmmword ptr [esp + 48]
    jmp sub_1001EAD1
    add add eax, 64
    movaps movaps xmm1, xmmword ptr [esp + 64]
    movntps movntps xmmword ptr [edi - 32], xmm7
    movaps movaps xmm2, xmm1
    shufps shufps xmm2, xmmword ptr [esp + 16], 0FAh
    shufps shufps xmm0, xmm5, 78
    shufps shufps xmm1, xmm2, 0D4h
    movntps movntps xmmword ptr [edi - 16], xmm1
    movntps movntps xmmword ptr [edi], xmm0
    shufps shufps xmm5, xmm6, 34
    shufps shufps xmm5, xmm6, 09Ch
    movntps movntps xmmword ptr [edi + 16], xmm5
FUN_1001e6e0 ENDP
END
