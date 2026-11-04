.686
.MODEL FLAT, C
EXTRN g_1019BC78:DWORD
EXTRN g_1019BDA0:DWORD
.CODE
FUN_10006be0 PROC
    mov ecx, dword ptr [esp + 8]
    sub esp, 0000000ACh
    push ebx
    xor ebx, ebx
    test ecx, ecx
    jle L3
    push ebp
    lea ebp, [esp + 20]
    sub ebp, edx
    push esi
    mov esi, dword ptr [esp + 0000000BCh]
    mov dword ptr [esp + 16], ebp
    push edi
    lea edi, [esp + 32]
    lea ebp, [esp + 32]
    add esi, 8
    sub ebp, edx
    mov dword ptr [esp + 16], edi
    mov dword ptr [esp + 24], ebp
    mov ebp, dword ptr [esp + 16]
    lea ecx, [edx + 4]
    lea edi, [edx + 8]
L0:
    test bl, 1
    je L1
    fld dword ptr [g_1019BC78]
    jmp L2
L1:
    fld dword ptr [g_1019BDA0]
L2:
    fld st(0)
    mov edx, ebx
    shr edx, 1
    and edx, 1
    fmul dword ptr [eax + edx*4]
    fadd dword ptr [eax + 12]
    fstp dword ptr [ebp - 4]
    fld dword ptr [esi - 4]
    fmul dword ptr [eax + 4]
    fld dword ptr [eax + 12]
    fmul dword ptr [esi + 4]
    faddp st(1)
    fld dword ptr [eax]
    fmul dword ptr [esi - 8]
    faddp st(1)
    fld dword ptr [esi]
    fmul dword ptr [eax + 8]
    faddp st(1)
    fstp dword ptr [edi - 8]
    fld st(0)
    fmul dword ptr [eax + edx*4 + 16]
    fadd dword ptr [eax + 28]
    fstp dword ptr [ebp]
    mov ebp, dword ptr [esp + 20]
    fld dword ptr [eax + 28]
    fmul dword ptr [esi + 4]
    fld dword ptr [eax + 20]
    fmul dword ptr [esi - 4]
    faddp st(1)
    fld dword ptr [eax + 24]
    fmul dword ptr [esi]
    faddp st(1)
    fld dword ptr [eax + 16]
    fmul dword ptr [esi - 8]
    faddp st(1)
    fstp dword ptr [edi - 4]
    fld st(0)
    fmul dword ptr [eax + edx*4 + 32]
    fadd dword ptr [eax + 44]
    fstp dword ptr [edi + ebp]
    fld dword ptr [eax + 44]
    fmul dword ptr [esi + 4]
    fld dword ptr [eax + 36]
    fmul dword ptr [esi - 4]
    faddp st(1)
    fld dword ptr [eax + 40]
    fmul dword ptr [esi]
    faddp st(1)
    fld dword ptr [eax + 32]
    fmul dword ptr [esi - 8]
    faddp st(1)
    fstp dword ptr [edi]
    fmul dword ptr [eax + edx*4 + 48]
    mov edx, dword ptr [esp + 24]
    fadd dword ptr [eax + 60]
    fstp dword ptr [edx + edi]
    fld dword ptr [eax + 60]
    fmul dword ptr [esi + 4]
    fld dword ptr [eax + 52]
    fmul dword ptr [esi - 4]
    faddp st(1)
    fld dword ptr [eax + 56]
    fmul dword ptr [esi]
    faddp st(1)
    fld dword ptr [eax + 48]
    fmul dword ptr [esi - 8]
    faddp st(1)
    fstp dword ptr [edi + 4]
    fld dword ptr [ecx + 4]
    fld dword ptr [ecx]
    fld dword ptr [ecx - 4]
    fld st(1)
    fmul st(2)
    fld st(1)
    fmul st(2)
    faddp st(1)
    fld st(3)
    fmul st(4)
    faddp st(1)
    fsqrt
    fstp st(3)
    mov ebp, dword ptr [esp + 16]
    fstp st(0)
    fstp st(0)
    fdivr dword ptr [g_1019BC78]
    fld st(0)
    fmul dword ptr [ecx - 4]
    fstp dword ptr [ecx - 4]
    fld st(0)
    fmul dword ptr [ecx]
    fstp dword ptr [ecx]
    fld st(0)
    fmul dword ptr [ecx + 4]
    fstp dword ptr [ecx + 4]
    fmul dword ptr [ecx + 8]
    fstp dword ptr [ecx + 8]
    mov edx, dword ptr [ecx - 4]
    test edx, edx
    setle dl
    dec dl
    and edx, 12
    mov byte ptr [ecx + 12], dl
    cmp dword ptr [ecx], 0
    setle dl
    dec dl
    and dl, 12
    add dl, 4
    mov byte ptr [ecx + 13], dl
    mov edx, dword ptr [ecx + 4]
    test edx, edx
    setle dl
    dec dl
    and dl, 12
    add dl, 8
    mov byte ptr [ecx + 14], dl
    mov edx, dword ptr [esp + 0000000C4h]
    mov byte ptr [ecx + 15], 0000000FFh
    inc ebx
    add ebp, 20
    add esi, 16
    add edi, 20
    add ecx, 20
    cmp ebx, edx
    mov dword ptr [esp + 16], ebp
    jl L0
    pop edi
    pop esi
    pop ebp
L3:
    pop ebx
    add esp, 0000000ACh
    ret
FUN_10006be0 ENDP
END
