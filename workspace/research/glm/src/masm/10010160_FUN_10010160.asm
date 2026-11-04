.686
.MODEL FLAT, C
EXTRN sub_1000FED4:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BDA0:DWORD
EXTRN g_1019BE68:DWORD
.CODE
FUN_10010160 PROC
    sub esp, 00000009Ch
    fild dword ptr [esp + 0000000A8h]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0000000B0h]
    fdivr dword ptr [g_1019BC78]
    mov edx, 4
    push esi
    mov eax, 3
    mov esi, 1
    mov ecx, 5
    push edi
    xor edi, edi
    mov dword ptr [esp + 116], edx
    mov dword ptr [esp + 000000084h], edx
    mov dword ptr [esp + 000000094h], edx
    lea edx, [esp + 104]
    mov dword ptr [esp + 112], esi
    mov dword ptr [esp + 0000000A4h], esi
    mov dword ptr [esp + 100], edi
    mov dword ptr [esp + 104], ecx
    mov dword ptr [esp + 108], eax
    mov dword ptr [esp + 120], eax
    mov dword ptr [esp + 124], 2
    mov dword ptr [esp + 000000080h], edi
    mov dword ptr [esp + 000000088h], eax
    mov dword ptr [esp + 00000008Ch], edi
    mov dword ptr [esp + 000000090h], ecx
    mov dword ptr [esp + 000000098h], edi
    mov dword ptr [esp + 00000009Ch], eax
    mov dword ptr [esp + 0000000A0h], ecx
    mov dword ptr [esp + 0000000A8h], eax
    xor esi, esi
    mov dword ptr [esp + 76], edx
    mov dword ptr [esp + 80], 6
    fstp dword ptr [esp + 16]
L0:
    mov ecx, dword ptr [edx - 4]
    mov eax, ecx
    sar eax, 1
    test cl, 1
    mov dword ptr [esp + 20], 0
    mov dword ptr [esp + 24], 0
    mov dword ptr [esp + 28], 0
    je L1
    fld dword ptr [g_1019BDA0]
    jmp L2
L1:
    fld dword ptr [g_1019BC78]
L2:
    mov ecx, dword ptr [edx]
    fstp dword ptr [esp + eax*4 + 20]
    mov eax, ecx
    sar eax, 1
    test cl, 1
    mov dword ptr [esp + 32], 0
    mov dword ptr [esp + 36], 0
    mov dword ptr [esp + 40], 0
    je L3
    fld dword ptr [g_1019BC78]
    jmp L4
L3:
    fld dword ptr [g_1019BDA0]
L4:
    mov ecx, dword ptr [edx + 4]
    fst dword ptr [esp + eax*4 + 20]
    fmul dword ptr [g_1019BE68]
    fstp dword ptr [esp + eax*4 + 32]
    mov eax, ecx
    sar eax, 1
    test cl, 1
    mov dword ptr [esp + 44], 0
    mov dword ptr [esp + 48], 0
    mov dword ptr [esp + 52], 0
    je L5
    fld dword ptr [g_1019BC78]
    jmp L6
L5:
    fld dword ptr [g_1019BDA0]
L6:
    cmp ebp, edi
    fst dword ptr [esp + eax*4 + 20]
    fmul dword ptr [g_1019BE68]
    mov dword ptr [esp + 56], edi
    fstp dword ptr [esp + eax*4 + 44]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 16]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 16]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 40]
    fmul dword ptr [esp + 16]
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 16]
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 16]
    fstp dword ptr [esp + 48]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 16]
    fstp dword ptr [esp + 52]
    jle L9
    fld dword ptr [esp + 32]
    mov eax, dword ptr [esp + 0000000B4h]
    fmul dword ptr [g_1019BCB0]
    mov ecx, ebp
    imul ecx, ebp
    fadd dword ptr [esp + 20]
    fstp dword ptr [esp + 84]
    fld dword ptr [esp + 36]
    fmul dword ptr [g_1019BCB0]
    lea ebx, [eax + esi*4]
    add esi, ecx
    fadd dword ptr [esp + 24]
    mov dword ptr [esp + 96], esi
    fstp dword ptr [esp + 88]
    fld dword ptr [esp + 40]
    fmul dword ptr [g_1019BCB0]
    fadd dword ptr [esp + 28]
    fstp dword ptr [esp + 92]
    jmp L7
    lea ecx, [ecx]
L7:
    fld dword ptr [esp + 84]
    mov edx, dword ptr [esp + 92]
    fld dword ptr [esp + 88]
    mov dword ptr [esp + 72], edx
    fild dword ptr [esp + 56]
    lea eax, [ebp*4]
    mov esi, ebx
    mov edi, ebp
    fadd dword ptr [g_1019BCB0]
    add ebx, eax
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 60]
    fadd st(2)
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 60]
    fadd st(1)
    fstp dword ptr [esp + 68]
    fstp st(0)
    fstp st(0)
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 60]
    fadd dword ptr [esp + 72]
    fstp dword ptr [esp + 72]
    jmp L8
    lea ecx, [ecx]
L8:
    mov eax, dword ptr [esp + 0000000BCh]
    push esi
    push eax
    lea ecx, [esp + 72]
    push ecx
    call dword ptr [esp + 0xcc]
    fld dword ptr [esp + 44]
    fadd dword ptr [esp + 76]
    add esp, 12
    add esi, 4
    dec edi
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 36]
    fadd dword ptr [esp + 68]
    fstp dword ptr [esp + 68]
    fld dword ptr [esp + 40]
    fadd dword ptr [esp + 72]
    fstp dword ptr [esp + 72]
    jne L8
    mov eax, dword ptr [esp + 56]
    inc eax
    cmp eax, ebp
    mov dword ptr [esp + 56], eax
    jl L7
    mov esi, dword ptr [esp + 96]
    mov edx, dword ptr [esp + 76]
    xor edi, edi
L9:
    mov eax, dword ptr [esp + 80]
    add edx, 12
    dec eax
    mov dword ptr [esp + 76], edx
    mov dword ptr [esp + 80], eax
    jne L0
    mov eax, dword ptr [esp + 0000000B4h]
    mov ecx, dword ptr [esp + 0000000B0h]
    mov edx, ebp
    imul edx, ebp
    push 21
    shl edx, 2
    push edx
    push eax
    mov eax, ebp
    call sub_1000FED4
    add esp, 12
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_10010160 ENDP
END
