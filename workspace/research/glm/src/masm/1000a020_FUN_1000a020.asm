.686
.MODEL FLAT, C
EXTRN sub_10005735:PROC
EXTRN sub_10007743:PROC
EXTRN sub_100098BB:PROC
EXTRN sub_10009B85:PROC
EXTRN sub_10009E74:PROC
EXTRN sub_1000A11C:PROC
EXTRN sub_10057AEF:PROC
EXTRN sub_10057FCF:PROC
EXTRN fp_101D4A10:DWORD
EXTRN fp_101D4A14:DWORD
EXTRN fp_101D4A18:DWORD
EXTRN g_101CE5E0:DWORD
EXTRN g_101CE5E4:DWORD
EXTRN g_101CE5E8:DWORD
EXTRN g_101CE68C:DWORD
EXTRN g_101CE6E0:DWORD
EXTRN g_101CE80C:DWORD
EXTRN g_101DA9C8:DWORD
.CODE
FUN_1000a020 PROC
    sub esp, 000000E5Ch
    push ebx
    push ebp
    push esi
    push edi
    push 000020000h
    call dword ptr [fp_101D4A10]
    mov edi, eax
    add esp, 4
    push edi
    mov dword ptr [esp + 32], edi
    call dword ptr [fp_101D4A18]
    add esp, 4
    mov ecx, eax
    mov esi, 0000000FFh
    nop
L0:
    dec esi
    lea edx, [ecx + 000000200h]
    mov dword ptr [ecx], edx
    mov ecx, edx
    jne L0
    mov ecx, dword ptr [esp + 000000E7Ch]
    mov edx, dword ptr [esp + 000000E78h]
    xor ebx, ebx
    mov dword ptr [eax + 00001FE00h], ebx
    push 1
    push ecx
    mov ecx, dword ptr [esp + 000000E78h]
    mov dword ptr [g_101CE5E8], eax
    lea eax, [esp + 000000670h]
    push edx
    mov dword ptr [g_101CE5E4], eax
    mov eax, dword ptr [esp + 000000E80h]
    push eax
    push ebx
    push ecx
    mov dword ptr [g_101CE5E0], ebx
    call sub_10009E74
    mov eax, dword ptr [g_101CE5E0]
    add esp, 24
    xor ebp, ebp
    cmp eax, ebx
    je L8
L1:
    call sub_100098BB
    mov esi, eax
    movzx edi, byte ptr [esi + 37]
    mov ecx, dword ptr [esi + 40]
    lea edx, [esp + 40]
    push edx
    push edi
    call sub_10057AEF
    lea eax, [esp + 48]
    push eax
    add edi, -2
    push edi
    mov eax, ecx
    call sub_10057FCF
    mov ecx, dword ptr [g_101CE5E8]
    mov edi, eax
    mov eax, dword ptr [esi + 40]
    mov dword ptr [eax], ecx
    add esp, 16
    cmp edi, ebx
    mov dword ptr [g_101CE5E8], eax
    mov dword ptr [esi + 40], ebx
    je L7
    mov edx, dword ptr [g_101CE68C]
    mov eax, dword ptr [edx + 8]
    inc ebp
    cmp ebp, eax
    mov dword ptr [esp + 32], ebp
    je L9
    fld dword ptr [esi + 20]
    lea ebp, [esi + 8]
    fchs
    xor ecx, ecx
    cmp edi, 4
    fld st(0)
    fmul dword ptr [ebp]
    fstp dword ptr [esp + 16]
    fld st(0)
    fmul dword ptr [ebp + 4]
    fstp dword ptr [esp + 20]
    fmul dword ptr [ebp + 8]
    fstp dword ptr [esp + 24]
    jl L3
    lea edx, [edi - 3]
    lea eax, [esp + 000000370h]
    jmp L2
    lea ecx, [ecx]
L2:
    fld dword ptr [esp + ecx*8 + 40]
    fld st(0)
    fmul dword ptr [esi + 44]
    fadd dword ptr [esp + 16]
    fstp dword ptr [eax - 8]
    fld st(0)
    fmul dword ptr [esi + 48]
    fadd dword ptr [esp + 20]
    fstp dword ptr [eax - 4]
    fmul dword ptr [esi + 52]
    fadd dword ptr [esp + 24]
    fstp dword ptr [eax]
    fld dword ptr [esp + ecx*8 + 44]
    fld st(0)
    fmul dword ptr [esi + 56]
    fadd dword ptr [eax - 8]
    fstp dword ptr [eax - 8]
    fld st(0)
    fmul dword ptr [esi + 60]
    fadd dword ptr [eax - 4]
    fstp dword ptr [eax - 4]
    fmul dword ptr [esi + 64]
    fadd dword ptr [eax]
    fstp dword ptr [eax]
    fld dword ptr [esp + ecx*8 + 48]
    fld st(0)
    fmul dword ptr [esi + 44]
    fadd dword ptr [esp + 16]
    fstp dword ptr [eax + 4]
    fld st(0)
    fmul dword ptr [esi + 48]
    fadd dword ptr [esp + 20]
    fstp dword ptr [eax + 8]
    fmul dword ptr [esi + 52]
    fadd dword ptr [esp + 24]
    fstp dword ptr [eax + 12]
    fld dword ptr [esp + ecx*8 + 52]
    fld st(0)
    fmul dword ptr [esi + 56]
    fadd dword ptr [eax + 4]
    fstp dword ptr [eax + 4]
    fld st(0)
    fmul dword ptr [esi + 60]
    fadd dword ptr [eax + 8]
    fstp dword ptr [eax + 8]
    fmul dword ptr [esi + 64]
    fadd dword ptr [eax + 12]
    fstp dword ptr [eax + 12]
    fld dword ptr [esp + ecx*8 + 56]
    fld st(0)
    fmul dword ptr [esi + 44]
    fadd dword ptr [esp + 16]
    fstp dword ptr [eax + 16]
    fld st(0)
    fmul dword ptr [esi + 48]
    fadd dword ptr [esp + 20]
    fstp dword ptr [eax + 20]
    fmul dword ptr [esi + 52]
    fadd dword ptr [esp + 24]
    fstp dword ptr [eax + 24]
    fld dword ptr [esp + ecx*8 + 60]
    fld st(0)
    fmul dword ptr [esi + 56]
    fadd dword ptr [eax + 16]
    fstp dword ptr [eax + 16]
    fld st(0)
    fmul dword ptr [esi + 60]
    fadd dword ptr [eax + 20]
    fstp dword ptr [eax + 20]
    fmul dword ptr [esi + 64]
    fadd dword ptr [eax + 24]
    fstp dword ptr [eax + 24]
    fld dword ptr [esp + ecx*8 + 64]
    fld st(0)
    fmul dword ptr [esi + 44]
    fadd dword ptr [esp + 16]
    fstp dword ptr [eax + 28]
    fld st(0)
    fmul dword ptr [esi + 48]
    fadd dword ptr [esp + 20]
    fstp dword ptr [eax + 32]
    fmul dword ptr [esi + 52]
    add ecx, 4
    add eax, 48
    cmp ecx, edx
    fadd dword ptr [esp + 24]
    fstp dword ptr [eax - 12]
    fld dword ptr [esp + ecx*8 + 36]
    fld st(0)
    fmul dword ptr [esi + 56]
    fadd dword ptr [eax - 20]
    fstp dword ptr [eax - 20]
    fld st(0)
    fmul dword ptr [esi + 60]
    fadd dword ptr [eax - 16]
    fstp dword ptr [eax - 16]
    fmul dword ptr [esi + 64]
    fadd dword ptr [eax - 12]
    fstp dword ptr [eax - 12]
    jl L2
L3:
    cmp ecx, edi
    jge L5
    lea eax, [ecx + ecx*2]
    lea eax, [esp + eax*4 + 000000370h]
    lea ecx, [ecx]
L4:
    fld dword ptr [esp + ecx*8 + 40]
    inc ecx
    fld st(0)
    add eax, 12
    cmp ecx, edi
    fmul dword ptr [esi + 44]
    fadd dword ptr [esp + 16]
    fstp dword ptr [eax - 20]
    fld st(0)
    fmul dword ptr [esi + 48]
    fadd dword ptr [esp + 20]
    fstp dword ptr [eax - 16]
    fmul dword ptr [esi + 52]
    fadd dword ptr [esp + 24]
    fstp dword ptr [eax - 12]
    fld dword ptr [esp + ecx*8 + 36]
    fld st(0)
    fmul dword ptr [esi + 56]
    fadd dword ptr [eax - 20]
    fstp dword ptr [eax - 20]
    fld st(0)
    fmul dword ptr [esi + 60]
    fadd dword ptr [eax - 16]
    fstp dword ptr [eax - 16]
    fmul dword ptr [esi + 64]
    fadd dword ptr [eax - 12]
    fstp dword ptr [eax - 12]
    jl L4
L5:
    mov eax, dword ptr [g_101CE6E0]
    cmp dword ptr [eax + 8], ebx
    je L6
    mov ecx, dword ptr [g_101CE80C]
    cmp byte ptr [ecx + 8], bl
    jne L6
    mov ebx, dword ptr [g_101DA9C8]
    lea edx, [esp + 000000368h]
    push edx
    push edi
    add ebx, 000249D18h
    mov eax, 010192528h
    call sub_10005735
    add esp, 8
    xor ebx, ebx
L6:
    lea eax, [esp + 000000228h]
    push edi
    push eax
    lea eax, [esp + 44]
    lea ecx, [esp + 000000370h]
    call sub_10007743
    mov ecx, dword ptr [esp + 44]
    push ecx
    push eax
    mov eax, dword ptr [esi + 28]
    lea edx, [esp + 000000238h]
    push edx
    push ebp
    push esi
    push eax
    call sub_1000A11C
    mov ebp, dword ptr [esp + 64]
    add esp, 32
L7:
    cmp dword ptr [g_101CE5E0], ebx
    jne L1
    mov edi, dword ptr [esp + 28]
L8:
    push edi
    call dword ptr [fp_101D4A14]
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000E5Ch
    ret
L9:
    cmp dword ptr [g_101CE5E0], ebx
    je L11
L10:
    call sub_10009B85
    mov ecx, dword ptr [eax + 40]
    mov edx, dword ptr [g_101CE5E8]
    mov dword ptr [ecx], edx
    mov dword ptr [g_101CE5E8], ecx
    mov dword ptr [eax + 40], ebx
    cmp dword ptr [g_101CE5E0], ebx
    jne L10
L11:
    mov eax, dword ptr [esp + 28]
    push eax
    call dword ptr [fp_101D4A14]
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
FUN_1000a020 ENDP
END
