.686
.MODEL FLAT, C
EXTRN sub_10035A5D:PROC
EXTRN sub_10035AD6:PROC
EXTRN sub_100361B6:PROC
EXTRN sub_100362BC:PROC
EXTRN sub_100366B8:PROC
EXTRN sub_100366F3:PROC
EXTRN sub_1003673E:PROC
EXTRN sub_1003674C:PROC
EXTRN sub_100367E5:PROC
EXTRN sub_100367EE:PROC
EXTRN sub_10036825:PROC
EXTRN sub_1003682E:PROC
EXTRN sub_10036865:PROC
EXTRN sub_1003686E:PROC
EXTRN sub_1003688D:PROC
EXTRN sub_1003689B:PROC
EXTRN sub_10036931:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD68:DWORD:DWORD
EXTRN EXTRN g_1019BDE0:DWORD:DWORD
EXTRN EXTRN g_1019BF10:DWORD:DWORD
EXTRN EXTRN g_1019BF14:DWORD:DWORD
EXTRN EXTRN g_1019BF18:DWORD:DWORD
EXTRN EXTRN g_101CE818:DWORD:DWORD
.CODE
FUN_100363a0 PROC
    sub sub esp, 64
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 80]
    fld fld dword ptr [ebp]
    push push esi
    fsub fsub dword ptr [g_1019BDE0]
    push push edi
    fstp fstp dword ptr [esp + 52]
    fld fld qword ptr [g_1019BD68]
    fstp fstp qword ptr [esp + 40]
    fld fld dword ptr [esp + 52]
    fsub fsub qword ptr [esp + 40]
    fistp fistp dword ptr [esp + 48]
    fld fld dword ptr [ebp]
    mov mov eax, dword ptr [esp + 48]
    fsub fsub dword ptr [g_1019BDE0]
    sar sar eax, 5
    mov mov dword ptr [esp + 40], eax
    fmul fmul dword ptr [g_1019BF18]
    fisub fisub dword ptr [esp + 40]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [ebp + 4]
    fsub fsub dword ptr [g_1019BDE0]
    fstp fstp dword ptr [esp + 52]
    fld fld qword ptr [g_1019BD68]
    fstp fstp qword ptr [esp + 32]
    fld fld dword ptr [esp + 52]
    fsub fsub qword ptr [esp + 32]
    fistp fistp dword ptr [esp + 48]
    fld fld dword ptr [ebp + 4]
    mov mov ecx, dword ptr [esp + 48]
    fsub fsub dword ptr [g_1019BDE0]
    sar sar ecx, 5
    mov mov dword ptr [esp + 48], ecx
    fmul fmul dword ptr [g_1019BF18]
    fisub fisub dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 68]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [ebp + 8]
    fsub fsub dword ptr [g_1019BDE0]
    fstp fstp dword ptr [esp + 52]
    fld fld qword ptr [g_1019BD68]
    fstp fstp qword ptr [esp + 24]
    fld fld dword ptr [esp + 52]
    fsub fsub qword ptr [esp + 24]
    fistp fistp dword ptr [esp + 32]
    fld fld dword ptr [ebp + 8]
    mov mov edx, dword ptr [esp + 32]
    fsub fsub dword ptr [g_1019BDE0]
    mov mov esi, dword ptr [g_101CE818]
    mov mov bl, byte ptr [esi + 8]
    sar sar edx, 6
    test test bl, bl
    fmul fmul dword ptr [g_1019BF14]
    mov mov dword ptr [esp + 52], edx
    fisub fisub dword ptr [esp + 52]
    fstp fstp dword ptr [esp + 76]
    fld fld dword ptr [g_1019BC78]
    fsub fsub dword ptr [esp + 76]
    fstp fstp dword ptr [esp + 72]
    je L2
    call sub_10035AD6
    mov mov eax, ebp
    call sub_10035A5D
    mov mov edi, dword ptr [esp + 92]
    xor xor eax, eax
    mov mov ecx, 24
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [esp + 20], eax
    xor xor ebx, ebx
    jmp L3
    mov mov ebp, dword ptr [esp + 88]
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [esp + 52]
    mov mov ecx, dword ptr [esp + 48]
    push push ebp
    mov mov ebp, dword ptr [esp + 44]
    mov mov edx, ebx
    and and edx, 1
    mov mov edi, ebx
    mov mov esi, ebx
    mov mov dword ptr [esp + 36], edx
    sar sar edi, 2
    sar sar esi, 1
    add add edx, ebp
    mov mov ebp, dword ptr [esp + 88]
    and and edi, 1
    and and esi, 1
    push push ebx
    add add eax, edi
    add add ecx, esi
    push push ebp
    call sub_100361B6
    mov mov ebp, eax
    add add esp, 12
    test test ebp, ebp
    je sub_100366F3
    fld fld dword ptr [esp + esi*4 + 64]
    mov mov edx, dword ptr [esp + 32]
    fmul fmul dword ptr [esp + edi*4 + 72]
    mov mov edi, dword ptr [esp + 92]
    fmul fmul dword ptr [esp + edx*4 + 56]
    mov mov edx, dword ptr [esp + 84]
    fst fst dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 32]
    fadd fadd dword ptr [esp + 24]
    push push eax
    movzx movzx eax, word ptr [ebp + 6]
    lea lea ecx, [eax + eax*2]
    mov mov eax, dword ptr [edx + 12]
    fstp fstp dword ptr [esp + 28]
    lea lea ecx, [eax + ecx*8]
    mov mov eax, edi
    call sub_100362BC
    mov mov al, byte ptr [ebp + 4]
    add add esp, 4
    test test al, 1
    je sub_1003673E
    fld fld dword ptr [esp + 32]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 20]
    jmp sub_1003674C
    mov mov edi, dword ptr [esp + 92]
    inc inc ebx
    cmp cmp ebx, 8
    jl sub_100366B8
    fld fld dword ptr [esp + 24]
    fcomp fcomp dword ptr [g_1019BF10]
    fnstsw fnstsw ax
    test test ah, 5
    jp sub_1003689B
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 24]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp sub_1003688D
    fld fld dword ptr [esp + 60]
    fcomp fcomp dword ptr [g_1019BCB0]
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_100367E5
    mov mov eax, 1
    jmp sub_100367EE
    xor xor eax, eax
    fld fld dword ptr [esp + 68]
    mov mov ecx, dword ptr [esp + 40]
    fcomp fcomp dword ptr [g_1019BCB0]
    add add ecx, eax
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10036825
    mov mov eax, 1
    jmp sub_1003682E
    xor xor eax, eax
    fld fld dword ptr [esp + 76]
    mov mov edx, dword ptr [esp + 48]
    fcomp fcomp dword ptr [g_1019BCB0]
    add add edx, eax
    fnstsw fnstsw ax
    test test ah, 65
    jne sub_10036865
    mov mov eax, 1
    jmp sub_1003686E
    xor xor eax, eax
    mov mov esi, dword ptr [esp + 52]
    add add eax, esi
    mov mov esi, dword ptr [esp + 84]
    push push edi
    push push eax
    push push ecx
    lea lea ebx, [esp + 32]
    call L1
    fld fld dword ptr [esp + 32]
    add add esp, 12
    test test al, al
    jne sub_10036931
    xor xor ecx, ecx
    mov mov dword ptr [edi], ecx
    mov mov dword ptr [edi + 8], ecx
    mov mov eax, 03F800000h
    mov mov dword ptr [edi + 4], eax
    mov mov dword ptr [edi + 12], eax
    mov mov dword ptr [edi + 16], ecx
    mov mov dword ptr [edi + 20], eax
    mov mov dword ptr [edi + 24], ecx
    mov mov dword ptr [edi + 28], eax
    mov mov dword ptr [edi + 32], ecx
    mov mov dword ptr [edi + 36], ecx
    mov mov dword ptr [edi + 40], eax
    mov mov dword ptr [edi + 44], eax
    mov mov dword ptr [edi + 48], ecx
    mov mov dword ptr [edi + 52], ecx
    mov mov dword ptr [edi + 56], eax
    mov mov dword ptr [edi + 60], eax
    mov mov dword ptr [edi + 64], ecx
    mov mov dword ptr [edi + 68], ecx
    mov mov dword ptr [edi + 72], ecx
    mov mov dword ptr [edi + 76], ecx
    mov mov dword ptr [edi + 80], eax
    mov mov dword ptr [edi + 84], eax
    mov mov dword ptr [edi + 88], eax
    mov mov dword ptr [edi + 92], eax
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 64
    ret ret
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 24]
    fst fst dword ptr [esp + 88]
    fmul fmul dword ptr [esp + 20]
    mov mov eax, dword ptr [esp + 88]
    push push eax
    mov mov eax, edi
    fstp fstp dword ptr [esp + 24]
    call L0
    add add esp, 4
    fld fld dword ptr [esp + 20]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 64
    ret ret
FUN_100363a0 ENDP
END
