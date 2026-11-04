.686
.MODEL FLAT, C
EXTRN sub_1002E3F5:PROC
EXTRN sub_1002E71D:PROC
EXTRN sub_1002E783:PROC
EXTRN sub_1002E7BF:PROC
EXTRN sub_1002E80D:PROC
EXTRN sub_10033818:PROC
EXTRN sub_10033829:PROC
EXTRN sub_1003A74F:PROC
EXTRN sub_1003AC4B:PROC
EXTRN sub_1003DEEE:PROC
EXTRN sub_1003E05E:PROC
EXTRN sub_1003E223:PROC
EXTRN sub_1003E83D:PROC
EXTRN sub_1005BC4D:PROC
EXTRN sub_1005BD05:PROC
EXTRN EXTRN fp_1010C02C:DWORD:DWORD
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BF30:DWORD:DWORD
EXTRN EXTRN g_101CE75C:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072DA30:DWORD:DWORD
EXTRN EXTRN g_1072DA34:DWORD:DWORD
EXTRN EXTRN g_1072DA38:DWORD:DWORD
EXTRN EXTRN g_1072DA3C:DWORD:DWORD
EXTRN EXTRN g_1072DA50:DWORD:DWORD
EXTRN EXTRN g_1072DA54:DWORD:DWORD
EXTRN EXTRN g_1072DA58:DWORD:DWORD
EXTRN EXTRN g_1072DA5C:DWORD:DWORD
EXTRN EXTRN g_1072DAB0:DWORD:DWORD
EXTRN EXTRN g_1072DAB4:DWORD:DWORD
EXTRN EXTRN g_1072DAB8:DWORD:DWORD
EXTRN EXTRN g_1072DABC:DWORD:DWORD
EXTRN EXTRN g_1072DE40:DWORD:DWORD
EXTRN EXTRN g_1072DE44:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_100331d0 PROC
    sub sub esp, 0BCh
    push push ebx
    xor xor ebx, ebx
    push push ebp
    mov mov ebp, 03F800000h
    push push esi
    push push edi
    lea lea ecx, [esp + 72]
    lea lea edx, [esp + 24]
    lea lea eax, [esp + 088h]
    mov mov dword ptr [esp + 24], ebx
    mov mov dword ptr [esp + 28], ebx
    mov mov dword ptr [esp + 32], ebx
    mov mov dword ptr [esp + 72], ebp
    mov mov dword ptr [esp + 76], ebx
    mov mov dword ptr [esp + 80], ebx
    mov mov dword ptr [esp + 84], ebx
    mov mov dword ptr [esp + 88], ebp
    mov mov dword ptr [esp + 92], ebx
    mov mov dword ptr [esp + 96], ebx
    mov mov dword ptr [esp + 100], ebx
    mov mov dword ptr [esp + 104], ebp
    call sub_1005BD05
    push push 03F666666h
    push push 042B40000h
    push push 042B40000h
    lea lea esi, [esp + 84]
    call sub_1005BC4D
    add add esp, 12
    call sub_1002E3F5
    mov mov eax, dword ptr [g_10730550]
    imul imul eax, eax, 0CD0h
    lea lea esi, [eax + 01072DEE0h]
    lea lea edi, [eax + 01072EBB0h]
    mov mov ecx, 0334h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edi, dword ptr [g_10730550]
    inc inc edi
    mov mov dword ptr [g_10730550], edi
    imul imul edi, edi, 0CD0h
    add add edi, 01072DEF0h
    mov mov ecx, 16
    mov mov esi, 010191368h
    push push ebp
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003DEEE
    lea lea eax, [esp + 08Ch]
    add add esp, 4
    push push eax
    call sub_1003E05E
    mov mov edi, dword ptr [g_10730550]
    imul imul edi, edi, 0CD0h
    add add edi, 01072E220h
    mov mov ecx, 16
    lea lea esi, [esp + 76]
    add add esp, 4
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003E223
    mov mov esi, dword ptr [esp + 0D4h]
    mov mov edi, dword ptr [esp + 0D0h]
    push push ebx
    mov mov dword ptr [g_1072DE40], 01072DE48h
    mov mov dword ptr [g_1072DE44], ebx
    mov mov dword ptr [g_1072DA50], ebp
    mov mov dword ptr [g_1072DA54], ebp
    mov mov dword ptr [g_1072DA58], ebp
    mov mov dword ptr [g_1072DA5C], ebp
    mov mov dword ptr [g_1072DA30], ebx
    mov mov dword ptr [g_1072DA34], ebx
    mov mov dword ptr [g_1072DA38], ebx
    mov mov dword ptr [g_1072DA3C], ebp
    mov mov dword ptr [g_1072DAB0], ebx
    mov mov dword ptr [g_1072DAB4], ebx
    mov mov dword ptr [g_1072DAB8], ebx
    mov mov dword ptr [g_1072DABC], ebp
    call sub_1003A74F
    fld fld dword ptr [g_1019BC78]
    add add esp, 4
    fadd fadd dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 20]
    mov mov dword ptr [esp + 24], ecx
    fld fld dword ptr [g_1019BC84]
    push push ebx
    fadd fadd st(0), st(0)
    push push ebx
    sub sub esp, 12
    lea lea ecx, [esp + 56]
    fstp fstp dword ptr [esp + 68]
    mov mov eax, dword ptr [esp + 68]
    fld fld dword ptr [esp + 40]
    mov mov dword ptr [esp + 52], eax
    fadd fadd dword ptr [esp + 52]
    mov mov dword ptr [esp + 48], eax
    xor xor eax, eax
    mov mov dword ptr [esp + 56], -1
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 40]
    fadd fadd dword ptr [esp + 48]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 68]
    fadd fadd dword ptr [esp + 44]
L1:
    fstp fstp dword ptr [esp]
    call sub_1002E71D
    fld fld dword ptr [esp + 52]
    add add esp, 20
    fsub fsub dword ptr [g_1019BC84]
    push push ebx
    push push ebp
    sub sub esp, 12
    fstp fstp dword ptr [esp + 68]
    lea lea ecx, [esp + 56]
    fld fld dword ptr [esp + 48]
    xor xor eax, eax
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 44]
    fsub fsub dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 68]
    fadd fadd dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 40]
    fadd fadd dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 60]
    fadd fadd dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp]
    call sub_1002E783
    fld fld dword ptr [esp + 68]
    add add esp, 20
    fsub fsub dword ptr [g_1019BC78]
    push push ebp
    push push ebp
    sub sub esp, 12
    fstp fstp dword ptr [esp + 8]
    lea lea ecx, [esp + 56]
    fld fld dword ptr [esp + 40]
    xor xor eax, eax
    fsub fsub dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 60]
    fsub fsub dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp]
    call sub_1002E7BF
    fld fld dword ptr [esp + 52]
    add add esp, 20
    fadd fadd dword ptr [g_1019BC84]
    push push ebp
    push push ebx
    sub sub esp, 12
    fsub fsub dword ptr [g_1019BC78]
    lea lea ecx, [esp + 56]
    xor xor eax, eax
    fstp fstp dword ptr [esp + 8]
    fld fld dword ptr [esp + 48]
    fadd fadd dword ptr [g_1019BC78]
    fsub fsub dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 44]
    fadd fadd dword ptr [g_1019BC84]
    fsub fsub dword ptr [g_1019BC84]
    fstp fstp dword ptr [esp]
    call sub_1002E80D
    mov mov edx, dword ptr [g_101CE75C]
    mov mov dword ptr [g_1072D9D4], 4
    mov mov eax, dword ptr [edx + 8]
    add add esp, 20
    cmp cmp eax, ebx
    mov mov dword ptr [esp + 40], eax
    jle sub_10033818
    mov mov ecx, 2
    mov mov edx, 1
    lea lea esp, [esp]
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    mov mov word ptr [esi + edi*2], 3
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    mov mov word ptr [esi + edi*2 + 2], bx
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    mov mov word ptr [esi + edi*2 + 4], cx
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    mov mov word ptr [esi + edi*2 + 6], cx
    mov mov edi, dword ptr [g_1072D9D0]
    mov mov esi, dword ptr [g_1072D9B0]
    mov mov word ptr [esi + edi*2 + 8], bx
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov edi, dword ptr [g_1072D9B0]
    mov mov word ptr [edi + esi*2 + 10], dx
    mov mov edi, dword ptr [g_1072D9D0]
    add add edi, 6
    dec dec eax
    mov mov dword ptr [g_1072D9D0], edi
    jne sub_10033829
    lea lea eax, [esp + 56]
    push push eax
    call L0
    add add esp, 4
    call sub_1003AC4B
    lea lea ecx, [esp + 64]
    push push ecx
    call L1
    add add esp, 4
    call sub_1003E83D
    lea lea edx, [esp + 48]
    push push edx
    call dword ptr [fp_1010C02C]
    fild fild dword ptr [esp + 40]
    mov mov esi, dword ptr [esp + 56]
    mov mov eax, dword ptr [esp + 64]
    mov mov edx, dword ptr [esp + 60]
    fstp fstp qword ptr [esp + 40]
    mov mov ecx, dword ptr [esp + 68]
    sub sub eax, esi
    sbb sbb ecx, edx
    mov mov dword ptr [esp + 56], eax
    mov mov dword ptr [esp + 60], ecx
    fild fild qword ptr [esp + 56]
    pop pop edi
    pop pop esi
    fstp fstp qword ptr [esp + 48]
    pop pop ebp
    fild fild qword ptr [esp + 36]
    pop pop ebx
    fstp fstp qword ptr [esp + 48]
    fld fld qword ptr [esp + 40]
    fdiv fdiv qword ptr [esp + 48]
    fdivr fdivr qword ptr [esp + 24]
    fdiv fdiv qword ptr [g_1019BF30]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 24]
    add add esp, 0BCh
    ret ret
FUN_100331d0 ENDP
END
