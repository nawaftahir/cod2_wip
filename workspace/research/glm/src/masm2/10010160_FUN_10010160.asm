.686
.MODEL FLAT, C
EXTRN sub_1000FED4:PROC
EXTRN sub_100104FA:PROC
EXTRN sub_1001057D:PROC
EXTRN sub_100105ED:PROC
EXTRN sub_10010633:PROC
EXTRN sub_1001063D:PROC
EXTRN sub_10010682:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BDA0:DWORD:DWORD
EXTRN EXTRN g_1019BE68:DWORD:DWORD
.CODE
FUN_10010160 PROC
    sub sub esp, 09Ch
    fild fild dword ptr [esp + 0A8h]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 0B0h]
    fdivr fdivr dword ptr [g_1019BC78]
    mov mov edx, 4
    push push esi
    mov mov eax, 3
    mov mov esi, 1
    mov mov ecx, 5
    push push edi
    xor xor edi, edi
    mov mov dword ptr [esp + 116], edx
    mov mov dword ptr [esp + 084h], edx
    mov mov dword ptr [esp + 094h], edx
    lea lea edx, [esp + 104]
    mov mov dword ptr [esp + 112], esi
    mov mov dword ptr [esp + 0A4h], esi
    mov mov dword ptr [esp + 100], edi
    mov mov dword ptr [esp + 104], ecx
    mov mov dword ptr [esp + 108], eax
    mov mov dword ptr [esp + 120], eax
    mov mov dword ptr [esp + 124], 2
    mov mov dword ptr [esp + 080h], edi
    mov mov dword ptr [esp + 088h], eax
    mov mov dword ptr [esp + 08Ch], edi
    mov mov dword ptr [esp + 090h], ecx
    mov mov dword ptr [esp + 098h], edi
    mov mov dword ptr [esp + 09Ch], eax
    mov mov dword ptr [esp + 0A0h], ecx
    mov mov dword ptr [esp + 0A8h], eax
    xor xor esi, esi
    mov mov dword ptr [esp + 76], edx
    mov mov dword ptr [esp + 80], 6
    fstp fstp dword ptr [esp + 16]
    mov mov ecx, dword ptr [edx - 4]
    mov mov eax, ecx
    sar sar eax, 1
    test test cl, 1
    mov mov dword ptr [esp + 20], 0
    mov mov dword ptr [esp + 24], 0
    mov mov dword ptr [esp + 28], 0
    je L0
    fld fld dword ptr [g_1019BDA0]
    jmp L1
    fld fld dword ptr [g_1019BC78]
    mov mov ecx, dword ptr [edx]
    fstp fstp dword ptr [esp + eax*4 + 20]
    mov mov eax, ecx
    sar sar eax, 1
    test test cl, 1
    mov mov dword ptr [esp + 32], 0
    mov mov dword ptr [esp + 36], 0
    mov mov dword ptr [esp + 40], 0
    je L2
    fld fld dword ptr [g_1019BC78]
    jmp L3
    fld fld dword ptr [g_1019BDA0]
    mov mov ecx, dword ptr [edx + 4]
    fst fst dword ptr [esp + eax*4 + 20]
    fmul fmul dword ptr [g_1019BE68]
    fstp fstp dword ptr [esp + eax*4 + 32]
    mov mov eax, ecx
    sar sar eax, 1
    test test cl, 1
    mov mov dword ptr [esp + 44], 0
    mov mov dword ptr [esp + 48], 0
    mov mov dword ptr [esp + 52], 0
    je L4
    fld fld dword ptr [g_1019BC78]
    jmp L5
    fld fld dword ptr [g_1019BDA0]
    cmp cmp ebp, edi
    fst fst dword ptr [esp + eax*4 + 20]
    fmul fmul dword ptr [g_1019BE68]
    mov mov dword ptr [esp + 56], edi
    fstp fstp dword ptr [esp + eax*4 + 44]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 52]
    jle sub_100105ED
    fld fld dword ptr [esp + 32]
    mov mov eax, dword ptr [esp + 0B4h]
    fmul fmul dword ptr [g_1019BCB0]
    mov mov ecx, ebp
    imul imul ecx, ebp
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 84]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [g_1019BCB0]
    lea lea ebx, [eax + esi*4]
    add add esi, ecx
    fadd fadd dword ptr [esp + 24]
    mov mov dword ptr [esp + 96], esi
    fstp fstp dword ptr [esp + 88]
    fld fld dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BCB0]
    fadd fadd dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 92]
    jmp sub_1001057D
    lea lea ecx, [ecx]
    fld fld dword ptr [esp + 84]
    mov mov edx, dword ptr [esp + 92]
    fld fld dword ptr [esp + 88]
    mov mov dword ptr [esp + 72], edx
    fild fild dword ptr [esp + 56]
    lea lea eax, [ebp*4]
    mov mov esi, ebx
    mov mov edi, ebp
    fadd fadd dword ptr [g_1019BCB0]
    add add ebx, eax
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 44]
    fmul fmul dword ptr [esp + 60]
    fadd fadd st(2)
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 60]
    fadd fadd st(1)
    fstp fstp dword ptr [esp + 68]
    fstp fstp st(0)
    fstp fstp st(0)
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 60]
    fadd fadd dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 72]
    jmp sub_1001063D
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 0BCh]
    push push esi
    push push eax
    lea lea ecx, [esp + 72]
    push push ecx
    call call dword ptr [esp + 0CCh]
    fld fld dword ptr [esp + 44]
    fadd fadd dword ptr [esp + 76]
    add add esp, 12
    add add esi, 4
    dec dec edi
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 36]
    fadd fadd dword ptr [esp + 68]
    fstp fstp dword ptr [esp + 68]
    fld fld dword ptr [esp + 40]
L4:
    fadd fadd dword ptr [esp + 72]
    fstp fstp dword ptr [esp + 72]
    jne sub_10010682
    mov mov eax, dword ptr [esp + 56]
L5:
    inc inc eax
    cmp cmp eax, ebp
    mov mov dword ptr [esp + 56], eax
    jl sub_10010633
    mov mov esi, dword ptr [esp + 96]
    mov mov edx, dword ptr [esp + 76]
    xor xor edi, edi
    mov mov eax, dword ptr [esp + 80]
    add add edx, 12
    dec dec eax
    mov mov dword ptr [esp + 76], edx
    mov mov dword ptr [esp + 80], eax
    jne sub_100104FA
    mov mov eax, dword ptr [esp + 0B4h]
    mov mov ecx, dword ptr [esp + 0B0h]
    mov mov edx, ebp
    imul imul edx, ebp
    push push 21
    shl shl edx, 2
    push push edx
    push push eax
    mov mov eax, ebp
    call sub_1000FED4
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_10010160 ENDP
END
