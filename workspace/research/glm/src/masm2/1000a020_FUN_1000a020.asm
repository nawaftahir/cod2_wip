.686
.MODEL FLAT, C
EXTRN sub_10005735:PROC
EXTRN sub_10007743:PROC
EXTRN sub_100098BB:PROC
EXTRN sub_10009B85:PROC
EXTRN sub_10009E74:PROC
EXTRN sub_1000A3F5:PROC
EXTRN sub_1000A3F9:PROC
EXTRN sub_1000A432:PROC
EXTRN sub_1000A46D:PROC
EXTRN sub_1000A544:PROC
EXTRN sub_1000A551:PROC
EXTRN sub_1000A5E5:PROC
EXTRN sub_1000A5F0:PROC
EXTRN sub_1000A701:PROC
EXTRN sub_10057AEF:PROC
EXTRN sub_10057FCF:PROC
EXTRN EXTRN fp_101D4A10:DWORD:DWORD
EXTRN EXTRN fp_101D4A14:DWORD:DWORD
EXTRN EXTRN fp_101D4A18:DWORD:DWORD
EXTRN EXTRN g_101CE5E0:DWORD:DWORD
EXTRN EXTRN g_101CE5E4:DWORD:DWORD
EXTRN EXTRN g_101CE5E8:DWORD:DWORD
EXTRN EXTRN g_101CE68C:DWORD:DWORD
EXTRN EXTRN g_101CE6E0:DWORD:DWORD
EXTRN EXTRN g_101CE80C:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
.CODE
FUN_1000a020 PROC
    sub sub esp, 0E5Ch
    push push ebx
    push push ebp
    push push esi
    push push edi
    push push 020000h
    call dword ptr [fp_101D4A10]
    mov mov edi, eax
    add add esp, 4
    push push edi
    mov mov dword ptr [esp + 32], edi
    call dword ptr [fp_101D4A18]
    add add esp, 4
    mov mov ecx, eax
    mov mov esi, 0FFh
    nop nop
    dec dec esi
    lea lea edx, [ecx + 0200h]
    mov mov dword ptr [ecx], edx
    mov mov ecx, edx
    jne L0
    mov mov ecx, dword ptr [esp + 0E7Ch]
    mov mov edx, dword ptr [esp + 0E78h]
    xor xor ebx, ebx
    mov mov dword ptr [eax + 01FE00h], ebx
    push push 1
    push push ecx
    mov mov ecx, dword ptr [esp + 0E78h]
    mov mov dword ptr [g_101CE5E8], eax
    lea lea eax, [esp + 0670h]
    push push edx
    mov mov dword ptr [g_101CE5E4], eax
    mov mov eax, dword ptr [esp + 0E80h]
    push push eax
    push push ebx
    push push ecx
    mov mov dword ptr [g_101CE5E0], ebx
    call sub_10009E74
    mov mov eax, dword ptr [g_101CE5E0]
    add add esp, 24
    xor xor ebp, ebp
    cmp cmp eax, ebx
    je sub_1000A3F9
    call sub_100098BB
    mov mov esi, eax
    movzx movzx edi, byte ptr [esi + 37]
    mov mov ecx, dword ptr [esi + 40]
    lea lea edx, [esp + 40]
    push push edx
    push push edi
    call sub_10057AEF
    lea lea eax, [esp + 48]
    push push eax
    add add edi, -2
    push push edi
    mov mov eax, ecx
    call sub_10057FCF
    mov mov ecx, dword ptr [g_101CE5E8]
    mov mov edi, eax
    mov mov eax, dword ptr [esi + 40]
    mov mov dword ptr [eax], ecx
    add add esp, 16
    cmp cmp edi, ebx
    mov mov dword ptr [g_101CE5E8], eax
    mov mov dword ptr [esi + 40], ebx
    je sub_1000A432
    mov mov edx, dword ptr [g_101CE68C]
    mov mov eax, dword ptr [edx + 8]
    inc inc ebp
    cmp cmp ebp, eax
    mov mov dword ptr [esp + 32], ebp
    je sub_1000A46D
    fld fld dword ptr [esi + 20]
    lea lea ebp, [esi + 8]
    fchs fchs
    xor xor ecx, ecx
    cmp cmp edi, 4
    fld fld st(0)
    fmul fmul dword ptr [ebp]
    fstp fstp dword ptr [esp + 16]
    fld fld st(0)
    fmul fmul dword ptr [ebp + 4]
    fstp fstp dword ptr [esp + 20]
    fmul fmul dword ptr [ebp + 8]
    fstp fstp dword ptr [esp + 24]
    jl L3
    lea lea edx, [edi - 3]
    lea lea eax, [esp + 0370h]
    jmp L2
    lea lea ecx, [ecx]
    fld fld dword ptr [esp + ecx*8 + 40]
    fld fld st(0)
    fmul fmul dword ptr [esi + 44]
    fadd fadd dword ptr [esp + 16]
    fstp fstp dword ptr [eax - 8]
    fld fld st(0)
    fmul fmul dword ptr [esi + 48]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [eax - 4]
    fmul fmul dword ptr [esi + 52]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [eax]
    fld fld dword ptr [esp + ecx*8 + 44]
    fld fld st(0)
    fmul fmul dword ptr [esi + 56]
    fadd fadd dword ptr [eax - 8]
    fstp fstp dword ptr [eax - 8]
    fld fld st(0)
    fmul fmul dword ptr [esi + 60]
    fadd fadd dword ptr [eax - 4]
    fstp fstp dword ptr [eax - 4]
    fmul fmul dword ptr [esi + 64]
    fadd fadd dword ptr [eax]
    fstp fstp dword ptr [eax]
    fld fld dword ptr [esp + ecx*8 + 48]
    fld fld st(0)
    fmul fmul dword ptr [esi + 44]
    fadd fadd dword ptr [esp + 16]
    fstp fstp dword ptr [eax + 4]
    fld fld st(0)
    fmul fmul dword ptr [esi + 48]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [eax + 8]
    fmul fmul dword ptr [esi + 52]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [eax + 12]
    fld fld dword ptr [esp + ecx*8 + 52]
    fld fld st(0)
    fmul fmul dword ptr [esi + 56]
    fadd fadd dword ptr [eax + 4]
    fstp fstp dword ptr [eax + 4]
    fld fld st(0)
    fmul fmul dword ptr [esi + 60]
    fadd fadd dword ptr [eax + 8]
    fstp fstp dword ptr [eax + 8]
    fmul fmul dword ptr [esi + 64]
    fadd fadd dword ptr [eax + 12]
    fstp fstp dword ptr [eax + 12]
    fld fld dword ptr [esp + ecx*8 + 56]
    fld fld st(0)
    fmul fmul dword ptr [esi + 44]
    fadd fadd dword ptr [esp + 16]
    fstp fstp dword ptr [eax + 16]
    fld fld st(0)
    fmul fmul dword ptr [esi + 48]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [eax + 20]
    fmul fmul dword ptr [esi + 52]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [eax + 24]
    fld fld dword ptr [esp + ecx*8 + 60]
    fld fld st(0)
    fmul fmul dword ptr [esi + 56]
    fadd fadd dword ptr [eax + 16]
    fstp fstp dword ptr [eax + 16]
    fld fld st(0)
    fmul fmul dword ptr [esi + 60]
    fadd fadd dword ptr [eax + 20]
    fstp fstp dword ptr [eax + 20]
    fmul fmul dword ptr [esi + 64]
    fadd fadd dword ptr [eax + 24]
    fstp fstp dword ptr [eax + 24]
    fld fld dword ptr [esp + ecx*8 + 64]
    fld fld st(0)
    fmul fmul dword ptr [esi + 44]
    fadd fadd dword ptr [esp + 16]
    fstp fstp dword ptr [eax + 28]
    fld fld st(0)
    fmul fmul dword ptr [esi + 48]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [eax + 32]
    fmul fmul dword ptr [esi + 52]
    add add ecx, 4
    add add eax, 48
    cmp cmp ecx, edx
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [eax - 12]
    fld fld dword ptr [esp + ecx*8 + 36]
    fld fld st(0)
    fmul fmul dword ptr [esi + 56]
    fadd fadd dword ptr [eax - 20]
    fstp fstp dword ptr [eax - 20]
    fld fld st(0)
    fmul fmul dword ptr [esi + 60]
    fadd fadd dword ptr [eax - 16]
    fstp fstp dword ptr [eax - 16]
    fmul fmul dword ptr [esi + 64]
    fadd fadd dword ptr [eax - 12]
    fstp fstp dword ptr [eax - 12]
    jl L4
    cmp cmp ecx, edi
    jge sub_1000A544
    lea lea eax, [ecx + ecx*2]
    lea lea eax, [esp + eax*4 + 0370h]
    lea lea ecx, [ecx]
    fld fld dword ptr [esp + ecx*8 + 40]
    inc inc ecx
    fld fld st(0)
    add add eax, 12
    cmp cmp ecx, edi
    fmul fmul dword ptr [esi + 44]
    fadd fadd dword ptr [esp + 16]
    fstp fstp dword ptr [eax - 20]
    fld fld st(0)
    fmul fmul dword ptr [esi + 48]
    fadd fadd dword ptr [esp + 20]
    fstp fstp dword ptr [eax - 16]
    fmul fmul dword ptr [esi + 52]
    fadd fadd dword ptr [esp + 24]
    fstp fstp dword ptr [eax - 12]
    fld fld dword ptr [esp + ecx*8 + 36]
    fld fld st(0)
    fmul fmul dword ptr [esi + 56]
    fadd fadd dword ptr [eax - 20]
    fstp fstp dword ptr [eax - 20]
    fld fld st(0)
    fmul fmul dword ptr [esi + 60]
    fadd fadd dword ptr [eax - 16]
    fstp fstp dword ptr [eax - 16]
    fmul fmul dword ptr [esi + 64]
    fadd fadd dword ptr [eax - 12]
    fstp fstp dword ptr [eax - 12]
    jl sub_1000A551
    mov mov eax, dword ptr [g_101CE6E0]
    cmp cmp dword ptr [eax + 8], ebx
    je sub_1000A5E5
    mov mov ecx, dword ptr [g_101CE80C]
    cmp cmp byte ptr [ecx + 8], bl
    jne sub_1000A5F0
    mov mov ebx, dword ptr [g_101DA9C8]
    lea lea edx, [esp + 0368h]
    push push edx
    push push edi
    add add ebx, 0249D18h
    mov mov eax, 010192528h
    call sub_10005735
    add add esp, 8
    xor xor ebx, ebx
    lea lea eax, [esp + 0228h]
    push push edi
    push push eax
    lea lea eax, [esp + 44]
    lea lea ecx, [esp + 0370h]
    call sub_10007743
    mov mov ecx, dword ptr [esp + 44]
    push push ecx
    push push eax
    mov mov eax, dword ptr [esi + 28]
    lea lea edx, [esp + 0238h]
    push push edx
    push push ebp
    push push esi
    push push eax
    call L1
    mov mov ebp, dword ptr [esp + 64]
    add add esp, 32
    cmp cmp dword ptr [g_101CE5E0], ebx
    jne sub_1000A3F5
    mov mov edi, dword ptr [esp + 28]
    push push edi
    call dword ptr [fp_101D4A14]
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0E5Ch
    ret ret
    cmp cmp dword ptr [g_101CE5E0], ebx
    je sub_1000A701
    call sub_10009B85
    mov mov ecx, dword ptr [eax + 40]
    mov mov edx, dword ptr [g_101CE5E8]
    mov mov dword ptr [ecx], edx
    mov mov dword ptr [g_101CE5E8], ecx
    mov mov dword ptr [eax + 40], ebx
    cmp cmp dword ptr [g_101CE5E0], ebx
    jne sub_1000A701
    mov mov eax, dword ptr [esp + 28]
    push push eax
    call dword ptr [fp_101D4A14]
    add add esp, 4
L4:
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_1000a020 ENDP
END
