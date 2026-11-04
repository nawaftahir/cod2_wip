.686
.MODEL FLAT, C
EXTRN g_1019BDB0:DWORD
EXTRN g_1019BDB4:DWORD
.CODE
FUN_1001ea80 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF0h
    sub esp, 72
    mov edx, dword ptr [eax + 12]
    movsx eax, word ptr [eax + 2]
    test eax, eax
    push esi
    push edi
    mov dword ptr [esp + 20], ecx
    jle L4
    mov dword ptr [esp + 24], eax
L0:
    movaps xmm1, xmmword ptr [edx + 48]
    movsx eax, word ptr [edx + 62]
    movaps xmm4, xmmword ptr [eax + ebx + 32]
    movaps xmm5, xmmword ptr [eax + ebx + 48]
    movaps xmm3, xmmword ptr [eax + ebx + 16]
    movaps xmm0, xmmword ptr [edx]
    movaps xmm2, xmmword ptr [eax + ebx]
    movzx ecx, byte ptr [edx + 60]
    add eax, ebx
    test ecx, ecx
    movaps xmm6, xmm1
    shufps xmm6, xmm1, 0000000AAh
    movaps xmm7, xmm4
    mulps xmm7, xmm6
    addps xmm7, xmm5
    movaps xmm5, xmm1
    shufps xmm5, xmm1, 85
    movaps xmm6, xmm3
    mulps xmm6, xmm5
    movaps xmm5, xmm1
    shufps xmm5, xmm1, 0
    movaps xmm1, xmm2
    mulps xmm1, xmm5
    movaps xmm5, xmm0
    shufps xmm5, xmm0, 0000000AAh
    mulps xmm4, xmm5
    movaps xmm5, xmm0
    shufps xmm5, xmm0, 85
    mulps xmm3, xmm5
    movaps xmm5, xmm0
    addps xmm1, xmm6
    shufps xmm5, xmm0, 0
    mulps xmm2, xmm5
    addps xmm2, xmm3
    movaps xmm6, xmm2
    addps xmm1, xmm7
    addps xmm6, xmm4
    mov esi, edx
    je L2
    movzx eax, byte ptr [edx + 61]
    mov dword ptr [esp + 28], eax
    add edx, 64
    fild dword ptr [esp + 28]
    fmul dword ptr [g_1019BDB4]
    fstp dword ptr [esp + 28]
    movss xmm0, dword ptr [esp + 28]
    shufps xmm0, xmm0, 0
    mulps xmm1, xmm0
    lea ecx, [ecx]
L1:
    movsx eax, word ptr [edx + 12]
    movaps xmm5, xmmword ptr [eax + ebx + 48]
    movaps xmm2, xmmword ptr [eax + ebx]
    movaps xmm3, xmmword ptr [eax + ebx + 16]
    movaps xmm4, xmmword ptr [eax + ebx + 32]
    movaps xmm0, xmmword ptr [edx]
    add eax, ebx
    movzx eax, word ptr [edx + 14]
    movaps xmm7, xmm0
    mov dword ptr [esp + 28], eax
    shufps xmm7, xmm0, 0000000AAh
    fild dword ptr [esp + 28]
    mulps xmm4, xmm7
    addps xmm4, xmm5
    movaps xmm5, xmm0
    fmul dword ptr [g_1019BDB0]
    shufps xmm5, xmm0, 85
    mulps xmm3, xmm5
    movaps xmm5, xmm0
    shufps xmm5, xmm0, 0
    fstp dword ptr [esp + 28]
    movss xmm0, dword ptr [esp + 28]
    mulps xmm2, xmm5
    addps xmm2, xmm3
    dec ecx
    addps xmm2, xmm4
    shufps xmm0, xmm0, 0
    add edx, 16
    test ecx, ecx
    mulps xmm0, xmm2
    addps xmm1, xmm0
    jne L1
    jmp L3
L2:
    add edx, 64
L3:
    mov edi, dword ptr [esp + 20]
    lea ecx, [esp + 32]
    movaps xmmword ptr [ecx], xmm1
    mov ecx, dword ptr [esi + 12]
    lea eax, [esp + 44]
    movups xmmword ptr [eax], xmm6
    mov eax, dword ptr [esi + 28]
    mov dword ptr [esp + 56], ecx
    mov ecx, dword ptr [esi + 44]
    mov dword ptr [esp + 64], ecx
    mov dword ptr [esp + 60], eax
    mov eax, dword ptr [esp + 24]
    mov ecx, 9
    lea esi, [esp + 32]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, dword ptr [esp + 20]
    add ecx, 36
    dec eax
    mov dword ptr [esp + 20], ecx
    mov dword ptr [esp + 24], eax
    jne L0
L4:
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_1001ea80 ENDP
END
