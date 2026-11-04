.686
.MODEL FLAT, C
EXTRN sub_1000706C:PROC
EXTRN sub_10007158:PROC
EXTRN sub_1000715E:PROC
EXTRN sub_100071B6:PROC
EXTRN sub_10007204:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BDAC:DWORD:DWORD
EXTRN EXTRN g_1019BDC8:DWORD:DWORD
EXTRN EXTRN g_101CE5B8:DWORD:DWORD
EXTRN EXTRN g_101CE788:DWORD:DWORD
.CODE
FUN_10006da0 PROC
    sub sub esp, 0420h
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 042Ch]
    mov mov dword ptr [esi], 03F800000h
    mov mov dword ptr [esi + 4], 03F800000h
    xor xor ebx, ebx
    test test ebp, ebp
    mov mov dword ptr [edi], 0BF800000h
    mov mov dword ptr [edi + 4], 0BF800000h
    jle L0
    mov mov ecx, dword ptr [g_101CE5B8]
    add add edx, 4
    lea lea esp, [esp]
    fld fld dword ptr [ecx + 12]
    fmul fmul dword ptr [edx - 4]
    fld fld dword ptr [ecx + 44]
    fmul fmul dword ptr [edx + 4]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 28]
    fmul fmul dword ptr [edx]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 60]
    fcom fcom dword ptr [g_1019BDAC]
    fnstsw fnstsw ax
    test test ah, 5
    jnp L4
    fdivr fdivr dword ptr [g_1019BC78]
    fld fld dword ptr [ecx + 32]
    fmul fmul dword ptr [edx + 4]
    fld fld dword ptr [ecx + 16]
    fmul fmul dword ptr [edx]
    faddp faddp st(1)
    fld fld dword ptr [edx - 4]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 48]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + ebx*8 + 8]
    fld fld dword ptr [ecx + 4]
    fmul fmul dword ptr [edx - 4]
    fld fld dword ptr [ecx + 36]
    fmul fmul dword ptr [edx + 4]
    faddp faddp st(1)
    fld fld dword ptr [ecx + 20]
    fmul fmul dword ptr [edx]
    faddp faddp st(1)
    fadd fadd dword ptr [ecx + 52]
    fmul fmul st(1)
    fstp fstp dword ptr [esp + ebx*8 + 12]
    fstp fstp st(0)
    fld fld dword ptr [esi]
    fcomp fcomp dword ptr [esp + ebx*8 + 8]
    fnstsw fnstsw ax
    test test ah, 65
    jne L2
    mov mov eax, dword ptr [esp + ebx*8 + 8]
    mov mov dword ptr [esi], eax
    mov mov ecx, dword ptr [g_101CE5B8]
    fld fld dword ptr [edi]
    fcomp fcomp dword ptr [esp + ebx*8 + 8]
    fnstsw fnstsw ax
    test test ah, 5
    jp L3
    mov mov ecx, dword ptr [esp + ebx*8 + 8]
    mov mov dword ptr [edi], ecx
    mov mov ecx, dword ptr [g_101CE5B8]
    fld fld dword ptr [esi + 4]
    fcomp fcomp dword ptr [esp + ebx*8 + 12]
    fnstsw fnstsw ax
    test test ah, 65
    jne L5
    mov mov eax, dword ptr [esp + ebx*8 + 12]
    mov mov dword ptr [esi + 4], eax
    mov mov ecx, dword ptr [g_101CE5B8]
    fld fld dword ptr [edi + 4]
    fcomp fcomp dword ptr [esp + ebx*8 + 12]
    fnstsw fnstsw ax
    test test ah, 5
    jp L6
    mov mov ecx, dword ptr [esp + ebx*8 + 12]
    mov mov dword ptr [edi + 4], ecx
    mov mov ecx, dword ptr [g_101CE5B8]
    inc inc ebx
    add add edx, 12
    cmp cmp ebx, ebp
    jl L1
    fld fld dword ptr [edi + 4]
    mov mov edx, dword ptr [g_101CE788]
    fsub fsub dword ptr [esi + 4]
    fld fld dword ptr [edi]
    fsub fsub dword ptr [esi]
    fmulp fmulp st(1)
    fmul fmul dword ptr [g_1019BDC8]
    fcomp fcomp dword ptr [edx + 8]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1000706C
    mov mov eax, dword ptr [esp + 0430h]
    pop pop ebp
    mov mov dword ptr [eax], 0
    pop pop ebx
    add add esp, 0420h
    ret ret
    mov mov edx, dword ptr [esp + 0430h]
    fstp fstp st(0)
    mov mov dword ptr [esi], 0BF800000h
    mov mov dword ptr [esi + 4], 0BF800000h
    pop pop ebp
    mov mov dword ptr [edi], 03F800000h
    mov mov dword ptr [edi + 4], 03F800000h
    mov mov dword ptr [edx], 1
    pop pop ebx
    add add esp, 0420h
    ret ret
    cmp cmp ebp, 4
    fld fld dword ptr [g_1019BC84]
    mov mov ecx, dword ptr [esp + 8]
    mov mov dword ptr [esp + ebp*8 + 8], ecx
    mov mov eax, dword ptr [esp + 12]
    mov mov dword ptr [esp + ebp*8 + 12], eax
    mov mov ecx, dword ptr [esp + 16]
    mov mov dword ptr [esp + ebp*8 + 16], ecx
    mov mov eax, dword ptr [esp + 20]
    mov mov dword ptr [esp + ebp*8 + 20], eax
    mov mov eax, 1
    jl sub_10007158
    lea lea ecx, [ebp - 3]
    lea lea ecx, [ecx]
    fld fld dword ptr [esp + eax*8 + 20]
    add add eax, 4
    cmp cmp eax, ecx
    fsub fsub dword ptr [esp + eax*8 - 28]
    fmul fmul dword ptr [esp + eax*8 - 24]
    faddp faddp st(1)
    fld fld dword ptr [esp + eax*8 - 4]
    fsub fsub dword ptr [esp + eax*8 - 20]
    fmul fmul dword ptr [esp + eax*8 - 16]
    faddp faddp st(1)
    fld fld dword ptr [esp + eax*8 + 4]
L5:
    fsub fsub dword ptr [esp + eax*8 - 12]
    fmul fmul dword ptr [esp + eax*8 - 8]
    faddp faddp st(1)
    fld fld dword ptr [esp + eax*8 + 12]
    fsub fsub dword ptr [esp + eax*8 - 4]
    fmul fmul dword ptr [esp + eax*8]
    faddp faddp st(1)
    jle sub_1000715E
    cmp cmp eax, ebp
    jg sub_100071B6
    fld fld dword ptr [esp + eax*8 + 20]
    inc inc eax
    cmp cmp eax, ebp
    fsub fsub dword ptr [esp + eax*8 - 4]
    fmul fmul dword ptr [esp + eax*8]
    faddp faddp st(1)
    jle sub_100071B6
    fld fld dword ptr [g_1019BDAC]
    fmul fmul st(1)
    fcomp fcomp dword ptr [edx + 8]
    fnstsw fnstsw ax
    fstp fstp st(0)
    test test ah, 5
    jp sub_10007204
    mov mov ecx, dword ptr [esp + 0430h]
    xor xor eax, eax
    pop pop ebp
    mov mov dword ptr [ecx], eax
    pop pop ebx
    add add esp, 0420h
    ret ret
    mov mov ecx, dword ptr [esp + 0430h]
    mov mov eax, 1
    pop pop ebp
    mov mov dword ptr [ecx], eax
    pop pop ebx
    add add esp, 0420h
    ret ret
FUN_10006da0 ENDP
END
