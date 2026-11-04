.686
.MODEL FLAT, C
EXTRN sub_10006DAB:PROC
EXTRN sub_10006DDB:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
.CODE
FUN_10006be0 PROC
    mov mov ecx, dword ptr [esp + 8]
    sub sub esp, 0ACh
    push push ebx
    xor xor ebx, ebx
    test test ecx, ecx
    jle sub_10006DAB
    push push ebp
    lea lea ebp, [esp + 20]
    sub sub ebp, edx
    push push esi
    mov mov esi, dword ptr [esp + 0BCh]
    mov mov dword ptr [esp + 16], ebp
    push push edi
    lea lea edi, [esp + 32]
    lea lea ebp, [esp + 32]
    add add esi, 8
    sub sub ebp, edx
    mov mov dword ptr [esp + 16], edi
    mov mov dword ptr [esp + 24], ebp
    mov mov ebp, dword ptr [esp + 16]
    lea lea ecx, [edx + 4]
    lea lea edi, [edx + 8]
    test test bl, 1
    je L0
    fld fld dword ptr [g_1019BC78]
    jmp L1
    fld fld dword ptr [g_1019BDA0]
    fld fld st(0)
    mov mov edx, ebx
    shr shr edx, 1
    and and edx, 1
    fmul fmul dword ptr [eax + edx*4]
    fadd fadd dword ptr [eax + 12]
    fstp fstp dword ptr [ebp - 4]
    fld fld dword ptr [esi - 4]
    fmul fmul dword ptr [eax + 4]
    fld fld dword ptr [eax + 12]
    fmul fmul dword ptr [esi + 4]
    faddp faddp st(1)
    fld fld dword ptr [eax]
    fmul fmul dword ptr [esi - 8]
    faddp faddp st(1)
    fld fld dword ptr [esi]
    fmul fmul dword ptr [eax + 8]
    faddp faddp st(1)
    fstp fstp dword ptr [edi - 8]
    fld fld st(0)
    fmul fmul dword ptr [eax + edx*4 + 16]
    fadd fadd dword ptr [eax + 28]
    fstp fstp dword ptr [ebp]
    mov mov ebp, dword ptr [esp + 20]
    fld fld dword ptr [eax + 28]
    fmul fmul dword ptr [esi + 4]
L0:
    fld fld dword ptr [eax + 20]
    fmul fmul dword ptr [esi - 4]
    faddp faddp st(1)
    fld fld dword ptr [eax + 24]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fld fld dword ptr [eax + 16]
    fmul fmul dword ptr [esi - 8]
    faddp faddp st(1)
    fstp fstp dword ptr [edi - 4]
    fld fld st(0)
    fmul fmul dword ptr [eax + edx*4 + 32]
    fadd fadd dword ptr [eax + 44]
    fstp fstp dword ptr [edi + ebp]
    fld fld dword ptr [eax + 44]
    fmul fmul dword ptr [esi + 4]
    fld fld dword ptr [eax + 36]
    fmul fmul dword ptr [esi - 4]
    faddp faddp st(1)
    fld fld dword ptr [eax + 40]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fld fld dword ptr [eax + 32]
    fmul fmul dword ptr [esi - 8]
    faddp faddp st(1)
    fstp fstp dword ptr [edi]
    fmul fmul dword ptr [eax + edx*4 + 48]
    mov mov edx, dword ptr [esp + 24]
    fadd fadd dword ptr [eax + 60]
    fstp fstp dword ptr [edx + edi]
    fld fld dword ptr [eax + 60]
    fmul fmul dword ptr [esi + 4]
    fld fld dword ptr [eax + 52]
    fmul fmul dword ptr [esi - 4]
    faddp faddp st(1)
    fld fld dword ptr [eax + 56]
    fmul fmul dword ptr [esi]
    faddp faddp st(1)
    fld fld dword ptr [eax + 48]
    fmul fmul dword ptr [esi - 8]
    faddp faddp st(1)
    fstp fstp dword ptr [edi + 4]
    fld fld dword ptr [ecx + 4]
    fld fld dword ptr [ecx]
    fld fld dword ptr [ecx - 4]
    fld fld st(1)
    fmul fmul st(2)
    fld fld st(1)
    fmul fmul st(2)
    faddp faddp st(1)
    fld fld st(3)
    fmul fmul st(4)
    faddp faddp st(1)
    fsqrt fsqrt
    fstp fstp st(3)
    mov mov ebp, dword ptr [esp + 16]
    fstp fstp st(0)
    fstp fstp st(0)
    fdivr fdivr dword ptr [g_1019BC78]
    fld fld st(0)
    fmul fmul dword ptr [ecx - 4]
    fstp fstp dword ptr [ecx - 4]
    fld fld st(0)
    fmul fmul dword ptr [ecx]
    fstp fstp dword ptr [ecx]
    fld fld st(0)
    fmul fmul dword ptr [ecx + 4]
    fstp fstp dword ptr [ecx + 4]
    fmul fmul dword ptr [ecx + 8]
    fstp fstp dword ptr [ecx + 8]
    mov mov edx, dword ptr [ecx - 4]
    test test edx, edx
    setle setle dl
    dec dec dl
    and and edx, 12
    mov mov byte ptr [ecx + 12], dl
    cmp cmp dword ptr [ecx], 0
    setle setle dl
    dec dec dl
    and and dl, 12
    add add dl, 4
    mov mov byte ptr [ecx + 13], dl
    mov mov edx, dword ptr [ecx + 4]
    test test edx, edx
    setle setle dl
    dec dec dl
    and and dl, 12
    add add dl, 8
    mov mov byte ptr [ecx + 14], dl
    mov mov edx, dword ptr [esp + 0C4h]
    mov mov byte ptr [ecx + 15], 0FFh
    inc inc ebx
    add add ebp, 20
    add add esi, 16
    add add edi, 20
    add add ecx, 20
    cmp cmp ebx, edx
    mov mov dword ptr [esp + 16], ebp
    jl sub_10006DDB
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0ACh
    ret ret
FUN_10006be0 ENDP
END
