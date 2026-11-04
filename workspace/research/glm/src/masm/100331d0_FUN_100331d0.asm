.686
.MODEL FLAT, C
EXTRN sub_1002E3F5:PROC
EXTRN sub_1002E71D:PROC
EXTRN sub_1002E783:PROC
EXTRN sub_1002E7BF:PROC
EXTRN sub_1002E80D:PROC
EXTRN sub_10033303:PROC
EXTRN sub_10033395:PROC
EXTRN sub_1003A74F:PROC
EXTRN sub_1003AC4B:PROC
EXTRN sub_1003DEEE:PROC
EXTRN sub_1003E05E:PROC
EXTRN sub_1003E223:PROC
EXTRN sub_1003E83D:PROC
EXTRN sub_1005BC4D:PROC
EXTRN sub_1005BD05:PROC
EXTRN fp_1010C02C:DWORD
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BF30:DWORD
EXTRN g_101CE75C:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072DA30:DWORD
EXTRN g_1072DA34:DWORD
EXTRN g_1072DA38:DWORD
EXTRN g_1072DA3C:DWORD
EXTRN g_1072DA50:DWORD
EXTRN g_1072DA54:DWORD
EXTRN g_1072DA58:DWORD
EXTRN g_1072DA5C:DWORD
EXTRN g_1072DAB0:DWORD
EXTRN g_1072DAB4:DWORD
EXTRN g_1072DAB8:DWORD
EXTRN g_1072DABC:DWORD
EXTRN g_1072DE40:DWORD
EXTRN g_1072DE44:DWORD
EXTRN g_10730550:DWORD
.CODE
FUN_100331d0 PROC
    sub esp, 0000000BCh
    push ebx
    xor ebx, ebx
    push ebp
    mov ebp, 03F800000h
    push esi
    push edi
    lea ecx, [esp + 72]
    lea edx, [esp + 24]
    lea eax, [esp + 000000088h]
    mov dword ptr [esp + 24], ebx
    mov dword ptr [esp + 28], ebx
    mov dword ptr [esp + 32], ebx
    mov dword ptr [esp + 72], ebp
    mov dword ptr [esp + 76], ebx
    mov dword ptr [esp + 80], ebx
    mov dword ptr [esp + 84], ebx
    mov dword ptr [esp + 88], ebp
    mov dword ptr [esp + 92], ebx
    mov dword ptr [esp + 96], ebx
    mov dword ptr [esp + 100], ebx
    mov dword ptr [esp + 104], ebp
    call sub_1005BD05
    push 03F666666h
    push 042B40000h
    push 042B40000h
    lea esi, [esp + 84]
    call sub_1005BC4D
    add esp, 12
    call sub_1002E3F5
    mov eax, dword ptr [g_10730550]
    imul eax, eax, 000000CD0h
    lea esi, [eax + 01072DEE0h]
    lea edi, [eax + 01072EBB0h]
    mov ecx, 000000334h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [g_10730550]
    inc edi
    mov dword ptr [g_10730550], edi
    imul edi, edi, 000000CD0h
    add edi, 01072DEF0h
    mov ecx, 16
    mov esi, 010191368h
    push ebp
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003DEEE
    lea eax, [esp + 00000008Ch]
    add esp, 4
    push eax
    call sub_1003E05E
    mov edi, dword ptr [g_10730550]
    imul edi, edi, 000000CD0h
    add edi, 01072E220h
    mov ecx, 16
    lea esi, [esp + 76]
    add esp, 4
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003E223
    mov esi, dword ptr [esp + 0000000D4h]
    mov edi, dword ptr [esp + 0000000D0h]
    push ebx
    mov dword ptr [g_1072DE40], 01072DE48h
    mov dword ptr [g_1072DE44], ebx
    mov dword ptr [g_1072DA50], ebp
    mov dword ptr [g_1072DA54], ebp
    mov dword ptr [g_1072DA58], ebp
    mov dword ptr [g_1072DA5C], ebp
    mov dword ptr [g_1072DA30], ebx
    mov dword ptr [g_1072DA34], ebx
    mov dword ptr [g_1072DA38], ebx
    mov dword ptr [g_1072DA3C], ebp
    mov dword ptr [g_1072DAB0], ebx
    mov dword ptr [g_1072DAB4], ebx
    mov dword ptr [g_1072DAB8], ebx
    mov dword ptr [g_1072DABC], ebp
    call sub_1003A74F
    fld dword ptr [g_1019BC78]
    add esp, 4
    fadd dword ptr [g_1019BC84]
    fstp dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 20]
    mov dword ptr [esp + 24], ecx
    fld dword ptr [g_1019BC84]
    push ebx
    fadd st(0), st(0)
    push ebx
    sub esp, 12
    lea ecx, [esp + 56]
    fstp dword ptr [esp + 68]
    mov eax, dword ptr [esp + 68]
    fld dword ptr [esp + 40]
    mov dword ptr [esp + 52], eax
    fadd dword ptr [esp + 52]
    mov dword ptr [esp + 48], eax
    xor eax, eax
    mov dword ptr [esp + 56], 0FFFFFFFFh
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 40]
    fadd dword ptr [esp + 48]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 68]
    fadd dword ptr [esp + 44]
    fstp dword ptr [esp]
    call sub_1002E71D
    fld dword ptr [esp + 52]
    add esp, 20
    fsub dword ptr [g_1019BC84]
    push ebx
    push ebp
    sub esp, 12
    fstp dword ptr [esp + 68]
    lea ecx, [esp + 56]
    fld dword ptr [esp + 48]
    xor eax, eax
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 44]
    fsub dword ptr [g_1019BC84]
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 68]
    fadd dword ptr [g_1019BC78]
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 40]
    fadd dword ptr [g_1019BC84]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 60]
    fadd dword ptr [g_1019BC84]
    fstp dword ptr [esp]
    call sub_1002E783
    fld dword ptr [esp + 68]
    add esp, 20
    fsub dword ptr [g_1019BC78]
    push ebp
    push ebp
    sub esp, 12
    fstp dword ptr [esp + 8]
    lea ecx, [esp + 56]
    fld dword ptr [esp + 40]
    xor eax, eax
    fsub dword ptr [g_1019BC84]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 60]
    fsub dword ptr [g_1019BC84]
    fstp dword ptr [esp]
    call sub_1002E7BF
    fld dword ptr [esp + 52]
    add esp, 20
    fadd dword ptr [g_1019BC84]
    push ebp
    push ebx
    sub esp, 12
    fsub dword ptr [g_1019BC78]
    lea ecx, [esp + 56]
    xor eax, eax
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 48]
    fadd dword ptr [g_1019BC78]
    fsub dword ptr [g_1019BC84]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 44]
    fadd dword ptr [g_1019BC84]
    fsub dword ptr [g_1019BC84]
    fstp dword ptr [esp]
    call sub_1002E80D
    mov edx, dword ptr [g_101CE75C]
    mov dword ptr [g_1072D9D4], 4
    mov eax, dword ptr [edx + 8]
    add esp, 20
    cmp eax, ebx
    mov dword ptr [esp + 40], eax
    jle L1
    mov ecx, 2
    mov edx, 1
    lea esp, [esp]
L0:
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    mov word ptr [esi + edi*2], 3
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    mov word ptr [esi + edi*2 + 2], bx
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    mov word ptr [esi + edi*2 + 4], cx
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    mov word ptr [esi + edi*2 + 6], cx
    mov edi, dword ptr [g_1072D9D0]
    mov esi, dword ptr [g_1072D9B0]
    mov word ptr [esi + edi*2 + 8], bx
    mov esi, dword ptr [g_1072D9D0]
    mov edi, dword ptr [g_1072D9B0]
    mov word ptr [edi + esi*2 + 10], dx
    mov edi, dword ptr [g_1072D9D0]
    add edi, 6
    dec eax
    mov dword ptr [g_1072D9D0], edi
    jne L0
L1:
    lea eax, [esp + 56]
    push eax
    call sub_10033303
    add esp, 4
    call sub_1003AC4B
    lea ecx, [esp + 64]
    push ecx
    call sub_10033395
    add esp, 4
    call sub_1003E83D
    lea edx, [esp + 48]
    push edx
    call dword ptr [fp_1010C02C]
    fild dword ptr [esp + 40]
    mov esi, dword ptr [esp + 56]
    mov eax, dword ptr [esp + 64]
    mov edx, dword ptr [esp + 60]
    fstp qword ptr [esp + 40]
    mov ecx, dword ptr [esp + 68]
    sub eax, esi
    sbb ecx, edx
    mov dword ptr [esp + 56], eax
    mov dword ptr [esp + 60], ecx
    fild qword ptr [esp + 56]
    pop edi
    pop esi
    fstp qword ptr [esp + 48]
    pop ebp
    fild qword ptr [esp + 36]
    pop ebx
    fstp qword ptr [esp + 48]
    fld qword ptr [esp + 40]
    fdiv qword ptr [esp + 48]
    fdivr qword ptr [esp + 24]
    fdiv qword ptr [g_1019BF30]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 24]
    add esp, 0000000BCh
    ret
FUN_100331d0 ENDP
END
