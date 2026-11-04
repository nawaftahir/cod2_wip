.686
.MODEL FLAT, C
EXTRN sub_1001EC30:PROC
EXTRN sub_1001EC34:PROC
EXTRN sub_1001EC6A:PROC
EXTRN sub_1001EC91:PROC
EXTRN sub_1001ED09:PROC
EXTRN EXTRN g_1019BDB0:DWORD:DWORD
EXTRN EXTRN g_1019BDB4:DWORD:DWORD
.CODE
FUN_1001ea80 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -16
    sub sub esp, 72
    mov mov edx, dword ptr [eax + 12]
    movsx movsx eax, word ptr [eax + 2]
    test test eax, eax
    push push esi
    push push edi
    mov mov dword ptr [esp + 20], ecx
    jle sub_1001EC30
    mov mov dword ptr [esp + 24], eax
    movaps movaps xmm1, xmmword ptr [edx + 48]
    movsx movsx eax, word ptr [edx + 62]
    movaps movaps xmm4, xmmword ptr [eax + ebx + 32]
    movaps movaps xmm5, xmmword ptr [eax + ebx + 48]
    movaps movaps xmm3, xmmword ptr [eax + ebx + 16]
    movaps movaps xmm0, xmmword ptr [edx]
    movaps movaps xmm2, xmmword ptr [eax + ebx]
    movzx movzx ecx, byte ptr [edx + 60]
    add add eax, ebx
    test test ecx, ecx
    movaps movaps xmm6, xmm1
    shufps shufps xmm6, xmm1, 0AAh
    movaps movaps xmm7, xmm4
    mulps mulps xmm7, xmm6
    addps addps xmm7, xmm5
    movaps movaps xmm5, xmm1
    shufps shufps xmm5, xmm1, 85
    movaps movaps xmm6, xmm3
    mulps mulps xmm6, xmm5
    movaps movaps xmm5, xmm1
    shufps shufps xmm5, xmm1, 0
    movaps movaps xmm1, xmm2
    mulps mulps xmm1, xmm5
    movaps movaps xmm5, xmm0
    shufps shufps xmm5, xmm0, 0AAh
    mulps mulps xmm4, xmm5
    movaps movaps xmm5, xmm0
    shufps shufps xmm5, xmm0, 85
    mulps mulps xmm3, xmm5
    movaps movaps xmm5, xmm0
    addps addps xmm1, xmm6
    shufps shufps xmm5, xmm0, 0
    mulps mulps xmm2, xmm5
    addps addps xmm2, xmm3
    movaps movaps xmm6, xmm2
    addps addps xmm1, xmm7
    addps addps xmm6, xmm4
    mov mov esi, edx
    je sub_1001EC6A
    movzx movzx eax, byte ptr [edx + 61]
    mov mov dword ptr [esp + 28], eax
    add add edx, 64
    fild fild dword ptr [esp + 28]
    fmul fmul dword ptr [g_1019BDB4]
    fstp fstp dword ptr [esp + 28]
    movss movss xmm0, dword ptr [esp + 28]
    shufps shufps xmm0, xmm0, 0
    mulps mulps xmm1, xmm0
    lea lea ecx, [ecx]
    movsx movsx eax, word ptr [edx + 12]
    movaps movaps xmm5, xmmword ptr [eax + ebx + 48]
    movaps movaps xmm2, xmmword ptr [eax + ebx]
    movaps movaps xmm3, xmmword ptr [eax + ebx + 16]
    movaps movaps xmm4, xmmword ptr [eax + ebx + 32]
    movaps movaps xmm0, xmmword ptr [edx]
    add add eax, ebx
    movzx movzx eax, word ptr [edx + 14]
    movaps movaps xmm7, xmm0
    mov mov dword ptr [esp + 28], eax
    shufps shufps xmm7, xmm0, 0AAh
    fild fild dword ptr [esp + 28]
    mulps mulps xmm4, xmm7
    addps addps xmm4, xmm5
    movaps movaps xmm5, xmm0
    fmul fmul dword ptr [g_1019BDB0]
    shufps shufps xmm5, xmm0, 85
    mulps mulps xmm3, xmm5
    movaps movaps xmm5, xmm0
    shufps shufps xmm5, xmm0, 0
    fstp fstp dword ptr [esp + 28]
    movss movss xmm0, dword ptr [esp + 28]
    mulps mulps xmm2, xmm5
    addps addps xmm2, xmm3
    dec dec ecx
    addps addps xmm2, xmm4
    shufps shufps xmm0, xmm0, 0
    add add edx, 16
    test test ecx, ecx
    mulps mulps xmm0, xmm2
    addps addps xmm1, xmm0
    jne sub_1001EC91
    jmp sub_1001ED09
    add add edx, 64
    mov mov edi, dword ptr [esp + 20]
    lea lea ecx, [esp + 32]
    movaps movaps xmmword ptr [ecx], xmm1
    mov mov ecx, dword ptr [esi + 12]
    lea lea eax, [esp + 44]
    movups movups xmmword ptr [eax], xmm6
    mov mov eax, dword ptr [esi + 28]
    mov mov dword ptr [esp + 56], ecx
    mov mov ecx, dword ptr [esi + 44]
    mov mov dword ptr [esp + 64], ecx
    mov mov dword ptr [esp + 60], eax
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, 9
    lea lea esi, [esp + 32]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, dword ptr [esp + 20]
    add add ecx, 36
    dec dec eax
    mov mov dword ptr [esp + 20], ecx
    mov mov dword ptr [esp + 24], eax
    jne sub_1001EC34
    pop pop edi
    pop pop esi
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1001ea80 ENDP
END
