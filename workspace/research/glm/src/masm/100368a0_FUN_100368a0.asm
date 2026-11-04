.686
.MODEL FLAT, C
EXTRN sub_10059388:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD50:DWORD
EXTRN g_1019BDA0:DWORD
EXTRN g_1019BDAC:DWORD
EXTRN g_1019BDE8:DWORD
EXTRN g_1019BE6C:DWORD
EXTRN g_1019BE70:DWORD
EXTRN g_1019BE74:DWORD
EXTRN g_1019BE78:DWORD
EXTRN g_1019BE7C:DWORD
EXTRN g_1019BE80:DWORD
EXTRN g_1019BE84:DWORD
EXTRN g_1019BE88:DWORD
EXTRN g_1019BE8C:DWORD
EXTRN g_1019BE90:DWORD
EXTRN g_1019BE94:DWORD
.CODE
FUN_100368a0 PROC
    sub esp, 76
    fld dword ptr [edi + 8]
    push ebx
    fmul dword ptr [g_1019BE94]
    mov ebx, eax
    fld dword ptr [edi]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld dword ptr [edi + 4]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld st(0)
    fabs
    fld dword ptr [g_1019BC84]
    fmul st(1)
    fst dword ptr [esp + 44]
    fstp dword ptr [esp + 48]
    fmul dword ptr [g_1019BDA0]
    fld st(1)
    fmul st(2)
    fstp dword ptr [esp + 12]
    fld dword ptr [edi + 20]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 16]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 12]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fst dword ptr [esp + 8]
    fabs
    fld dword ptr [g_1019BE88]
    fmul st(1)
    fadd dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [g_1019BC84]
    fmul st(1)
    fadd dword ptr [esp + 48]
    fstp dword ptr [esp + 48]
    fmul dword ptr [g_1019BE84]
    fadd st(1)
    fstp st(2)
    fstp st(0)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    fadd dword ptr [esp + 12]
    fld dword ptr [edi + 32]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 28]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 24]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fabs
    fld dword ptr [g_1019BE80]
    fmul st(1)
    fsubr dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [g_1019BE7C]
    fmul st(1)
    fadd dword ptr [esp + 48]
    fstp dword ptr [esp + 48]
    fmul dword ptr [g_1019BE84]
    fadd st(3)
    fstp dword ptr [esp + 52]
    fld st(0)
    fmul st(1)
    fadd st(2)
    fstp st(3)
    fstp st(0)
    fstp st(0)
    fld dword ptr [edi + 44]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 40]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 36]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fabs
    fld dword ptr [g_1019BE80]
    fmul st(1)
    fadd dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [g_1019BE7C]
    fmul st(1)
    fadd dword ptr [esp + 48]
    fstp dword ptr [esp + 48]
    fmul dword ptr [g_1019BE84]
    fadd dword ptr [esp + 52]
    fstp dword ptr [esp + 52]
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 56]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 52]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 48]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fabs
    fld dword ptr [g_1019BE80]
    fmul st(1)
    fsubr dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [g_1019BE7C]
    fmul st(1)
    fsubr dword ptr [esp + 48]
    fstp dword ptr [esp + 48]
    fmul dword ptr [g_1019BE84]
    fsubr dword ptr [esp + 52]
    fstp dword ptr [esp + 52]
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 68]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 64]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 60]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fabs
    fld dword ptr [g_1019BE80]
    fmul st(1)
    fadd dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [g_1019BE7C]
    fmul st(1)
    fsubr dword ptr [esp + 48]
    fstp dword ptr [esp + 48]
    fmul dword ptr [g_1019BE84]
    fsubr dword ptr [esp + 52]
    fstp dword ptr [esp + 52]
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 80]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 76]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 72]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fabs
    fld dword ptr [g_1019BE88]
    fmul st(1)
    fsubr dword ptr [esp + 44]
    fstp dword ptr [esp + 44]
    fld dword ptr [g_1019BC84]
    fmul st(1)
    fadd dword ptr [esp + 48]
    fstp dword ptr [esp + 48]
    fmul dword ptr [g_1019BE84]
    fsubr dword ptr [esp + 52]
    fstp dword ptr [esp + 52]
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 92]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 88]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 84]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fabs
    fld dword ptr [g_1019BC84]
    fmul st(1)
    fld dword ptr [esp + 44]
    fadd st(1)
    fstp dword ptr [esp + 44]
    fadd dword ptr [esp + 48]
    fstp dword ptr [esp + 48]
    fadd dword ptr [esp + 52]
    fstp dword ptr [esp + 52]
    fld st(0)
    fmul st(1)
    faddp st(2)
    fxch st(1)
    fst dword ptr [esp + 12]
    fstp st(1)
    fcomp dword ptr [g_1019BE78]
    fnstsw ax
    test ah, 5
    jnp L34
    push esi
    lea esi, [esp + 48]
    mov dword ptr [esp + 20], 0
    call sub_10059388
    fstp st(0)
    fld dword ptr [g_1019BC84]
    mov dword ptr [esp + 64], 0
    fld dword ptr [esp + 52]
    mov dword ptr [esp + 68], 0
    fmul dword ptr [g_1019BC84]
    pop esi
    fstp dword ptr [esp + 8]
    fld dword ptr [esp + 44]
    fmul dword ptr [g_1019BC84]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 52]
    fmul dword ptr [g_1019BC78]
    fsubr dword ptr [esp + 20]
    fadd dword ptr [esp + 8]
    fst dword ptr [esp + 24]
    fst dword ptr [esp + 4]
    fcomp dword ptr [g_1019BDE8]
    fnstsw ax
    test ah, 65
    jnp L0
    fstp st(0)
    fld dword ptr [esp + 4]
    fmul dword ptr [edi]
    fld dword ptr [esp + 4]
    fmul dword ptr [edi + 4]
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 4]
    fmul dword ptr [edi + 8]
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 4]
    jmp L1
L0:
    fld dword ptr [esp + 16]
L1:
    fld dword ptr [esp + 52]
    fmul dword ptr [g_1019BE84]
    fld dword ptr [esp + 44]
    fmul dword ptr [g_1019BE88]
    fadd st(1)
    fadd dword ptr [esp + 8]
    fcom dword ptr [g_1019BDE8]
    fst dword ptr [esp + 28]
    fnstsw ax
    test ah, 65
    jnp L2
    fld st(0)
    fmul dword ptr [edi + 12]
    faddp st(4)
    fld st(0)
    fmul dword ptr [edi + 16]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fld st(0)
    fmul dword ptr [edi + 20]
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    faddp st(2)
    jmp L3
L2:
    fstp st(0)
L3:
    fld dword ptr [esp + 48]
    fmul dword ptr [g_1019BE7C]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [g_1019BE74]
    fst dword ptr [esp + 4]
    fadd st(1)
    fcom dword ptr [g_1019BDE8]
    fst dword ptr [esp + 32]
    fnstsw ax
    test ah, 65
    jnp L4
    fld st(0)
    fmul dword ptr [edi + 24]
    faddp st(4)
    fld st(0)
    fmul dword ptr [edi + 28]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fld st(0)
    fmul dword ptr [edi + 32]
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    faddp st(2)
    jmp L5
L4:
    fstp st(0)
L5:
    fld dword ptr [esp + 44]
    fmul dword ptr [g_1019BE80]
    fst dword ptr [esp + 16]
    faddp st(1)
    fcom dword ptr [g_1019BDE8]
    fst dword ptr [esp + 36]
    fnstsw ax
    test ah, 65
    jnp L6
    fld st(0)
    fmul dword ptr [edi + 36]
    faddp st(3)
    fld st(0)
    fmul dword ptr [edi + 40]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fld st(0)
    fmul dword ptr [edi + 44]
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    faddp st(1)
    jmp L7
L6:
    fstp st(0)
L7:
    fld dword ptr [esp + 52]
    fmul dword ptr [g_1019BE70]
    fld dword ptr [esp + 48]
    fmul dword ptr [g_1019BE7C]
    fsubr st(1)
    fld dword ptr [esp + 4]
    fadd st(1)
    fcom dword ptr [g_1019BDE8]
    fst dword ptr [esp + 4]
    fnstsw ax
    test ah, 65
    jnp L8
    fld st(0)
    fmul dword ptr [edi + 48]
    faddp st(5)
    fld st(0)
    fmul dword ptr [edi + 52]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fld st(0)
    fmul dword ptr [edi + 56]
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    faddp st(3)
    jmp L9
L8:
    fstp st(0)
L9:
    fadd dword ptr [esp + 16]
    fcom dword ptr [g_1019BDE8]
    fst dword ptr [esp + 16]
    fnstsw ax
    test ah, 65
    jnp L10
    fld st(0)
    fmul dword ptr [edi + 60]
    faddp st(4)
    fld st(0)
    fmul dword ptr [edi + 64]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fld st(0)
    fmul dword ptr [edi + 68]
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    faddp st(2)
    jmp L11
L10:
    fstp st(0)
L11:
    fld dword ptr [esp + 44]
    fmul dword ptr [g_1019BE88]
    fsubp st(1)
    fadd dword ptr [esp + 8]
    fcom dword ptr [g_1019BDE8]
    fst dword ptr [esp + 40]
    fnstsw ax
    test ah, 65
    jnp L12
    fld st(0)
    fmul dword ptr [edi + 72]
    faddp st(3)
    fld st(0)
    fmul dword ptr [edi + 76]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fld st(0)
    fmul dword ptr [edi + 80]
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    faddp st(1)
    jmp L13
L12:
    fstp st(0)
L13:
    fld dword ptr [esp + 20]
    fadd dword ptr [esp + 8]
    fadd dword ptr [esp + 52]
    fcom dword ptr [g_1019BDE8]
    fst dword ptr [esp + 20]
    fnstsw ax
    test ah, 65
    jnp L14
    fld st(0)
    fmul dword ptr [edi + 84]
    faddp st(3)
    fld st(0)
    fmul dword ptr [edi + 88]
    fadd dword ptr [esp + 60]
    fstp dword ptr [esp + 60]
    fld st(0)
    fmul dword ptr [edi + 92]
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    faddp st(1)
    jmp L15
L14:
    fstp st(0)
L15:
    fld dword ptr [g_1019BC84]
    fld st(1)
    fucompp
    fnstsw ax
    test ah, 68
    jnp L16
    fdivr dword ptr [g_1019BC78]
    fld st(0)
    fmulp st(2)
    fld dword ptr [esp + 60]
    fmul st(1)
    fstp dword ptr [esp + 60]
    fmul dword ptr [esp + 64]
    fstp dword ptr [esp + 64]
    jmp L17
L16:
    fstp st(0)
L17:
    fld dword ptr [esp + 24]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L18
    fchs
    fld st(0)
    fmul st(2)
    fadd dword ptr [edi]
    fstp dword ptr [edi]
    fld dword ptr [esp + 60]
    fmul st(1)
    fadd dword ptr [edi + 4]
    fstp dword ptr [edi + 4]
    fmul dword ptr [esp + 64]
    fadd dword ptr [edi + 8]
    fstp dword ptr [edi + 8]
    jmp L19
L18:
    fstp st(0)
L19:
    fld dword ptr [edi]
    mov eax, dword ptr [edi + 4]
    fld dword ptr [esp + 28]
    mov ecx, dword ptr [edi + 8]
    fcom dword ptr [g_1019BC84]
    mov dword ptr [esp + 72], eax
    mov dword ptr [esp + 76], ecx
    fnstsw ax
    test ah, 65
    jne L20
    fchs
    fld st(0)
    fmul st(3)
    fadd dword ptr [edi + 12]
    fstp dword ptr [edi + 12]
    fld dword ptr [esp + 60]
    fmul st(1)
    fadd dword ptr [edi + 16]
    fstp dword ptr [edi + 16]
    fmul dword ptr [esp + 64]
    fadd dword ptr [edi + 20]
    fstp dword ptr [edi + 20]
    jmp L21
L20:
    fstp st(0)
L21:
    fadd dword ptr [edi + 12]
    fld dword ptr [esp + 72]
    fadd dword ptr [edi + 16]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 76]
    fadd dword ptr [edi + 20]
    fstp dword ptr [esp + 76]
    fld dword ptr [esp + 32]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L22
    fchs
    fld st(0)
    fmul st(3)
    fadd dword ptr [edi + 24]
    fstp dword ptr [edi + 24]
    fld dword ptr [esp + 60]
    fmul st(1)
    fadd dword ptr [edi + 28]
    fstp dword ptr [edi + 28]
    fmul dword ptr [esp + 64]
    fadd dword ptr [edi + 32]
    fstp dword ptr [edi + 32]
    jmp L23
L22:
    fstp st(0)
L23:
    fadd dword ptr [edi + 24]
    fld dword ptr [esp + 72]
    fadd dword ptr [edi + 28]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 76]
    fadd dword ptr [edi + 32]
    fstp dword ptr [esp + 76]
    fld dword ptr [esp + 36]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L24
    fchs
    fld st(0)
    fmul st(3)
    fadd dword ptr [edi + 36]
    fstp dword ptr [edi + 36]
    fld dword ptr [esp + 60]
    fmul st(1)
    fadd dword ptr [edi + 40]
    fstp dword ptr [edi + 40]
    fmul dword ptr [esp + 64]
    fadd dword ptr [edi + 44]
    fstp dword ptr [edi + 44]
    jmp L25
L24:
    fstp st(0)
L25:
    fadd dword ptr [edi + 36]
    fld dword ptr [esp + 72]
    fadd dword ptr [edi + 40]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 76]
    fadd dword ptr [edi + 44]
    fstp dword ptr [esp + 76]
    fld dword ptr [esp + 4]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L26
    fchs
    fld st(0)
    fmul st(3)
    fadd dword ptr [edi + 48]
    fstp dword ptr [edi + 48]
    fld dword ptr [esp + 60]
    fmul st(1)
    fadd dword ptr [edi + 52]
    fstp dword ptr [edi + 52]
    fmul dword ptr [esp + 64]
    fadd dword ptr [edi + 56]
    fstp dword ptr [edi + 56]
    jmp L27
L26:
    fstp st(0)
L27:
    fadd dword ptr [edi + 48]
    fld dword ptr [esp + 72]
    fadd dword ptr [edi + 52]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 76]
    fadd dword ptr [edi + 56]
    fstp dword ptr [esp + 76]
    fld dword ptr [esp + 16]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L28
    fchs
    fld st(0)
    fmul st(3)
    fadd dword ptr [edi + 60]
    fstp dword ptr [edi + 60]
    fld dword ptr [esp + 60]
    fmul st(1)
    fadd dword ptr [edi + 64]
    fstp dword ptr [edi + 64]
    fmul dword ptr [esp + 64]
    fadd dword ptr [edi + 68]
    fstp dword ptr [edi + 68]
    jmp L29
L28:
    fstp st(0)
L29:
    fadd dword ptr [edi + 60]
    fld dword ptr [esp + 72]
    fadd dword ptr [edi + 64]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 76]
    fadd dword ptr [edi + 68]
    fstp dword ptr [esp + 76]
    fld dword ptr [esp + 40]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L30
    fchs
    fld st(0)
    fmul st(3)
    fadd dword ptr [edi + 72]
    fstp dword ptr [edi + 72]
    fld dword ptr [esp + 60]
    fmul st(1)
    fadd dword ptr [edi + 76]
    fstp dword ptr [edi + 76]
    fmul dword ptr [esp + 64]
    fadd dword ptr [edi + 80]
    fstp dword ptr [edi + 80]
    jmp L31
L30:
    fstp st(0)
L31:
    fadd dword ptr [edi + 72]
    fld dword ptr [esp + 72]
    fadd dword ptr [edi + 76]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 76]
    fadd dword ptr [edi + 80]
    fstp dword ptr [esp + 76]
    fld dword ptr [esp + 20]
    fcom dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L32
    fchs
    fld st(0)
    fmul st(3)
    fadd dword ptr [edi + 84]
    fstp dword ptr [edi + 84]
    fld dword ptr [esp + 60]
    fmul st(1)
    fadd dword ptr [edi + 88]
    fstp dword ptr [edi + 88]
    fmul dword ptr [esp + 64]
    fadd dword ptr [edi + 92]
    fstp dword ptr [edi + 92]
    jmp L33
L32:
    fstp st(0)
L33:
    fadd dword ptr [edi + 84]
    fld dword ptr [esp + 72]
    fadd dword ptr [edi + 88]
    fld dword ptr [esp + 76]
    fadd dword ptr [edi + 92]
    fstp dword ptr [esp + 76]
    fxch st(1)
    fmul dword ptr [g_1019BDAC]
    fstp dword ptr [esp + 68]
    fmul dword ptr [g_1019BDAC]
    fld dword ptr [esp + 76]
    fmul dword ptr [g_1019BDAC]
    fstp dword ptr [esp + 76]
    fld dword ptr [edi]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi]
    fld dword ptr [edi + 4]
    fsub st(1)
    fstp dword ptr [edi + 4]
    fld dword ptr [edi + 8]
    fsub dword ptr [esp + 76]
    fstp dword ptr [edi + 8]
    fld dword ptr [edi + 8]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld dword ptr [edi + 4]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld st(0)
    fmulp st(1)
    fld dword ptr [edi + 12]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 12]
    fld dword ptr [edi + 16]
    fsub st(2)
    fstp dword ptr [edi + 16]
    fld dword ptr [edi + 20]
    fsub dword ptr [esp + 76]
    fstp dword ptr [edi + 20]
    fld dword ptr [edi + 20]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 16]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 12]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 24]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 24]
    fld dword ptr [edi + 28]
    fsub st(2)
    fstp dword ptr [edi + 28]
    fld dword ptr [edi + 32]
    fsub dword ptr [esp + 76]
    fstp dword ptr [edi + 32]
    fld dword ptr [edi + 32]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 28]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 24]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 36]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 36]
    fld dword ptr [edi + 40]
    fsub st(2)
    fstp dword ptr [edi + 40]
    fld dword ptr [edi + 44]
    fsub dword ptr [esp + 76]
    fstp dword ptr [edi + 44]
    fld dword ptr [edi + 44]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 40]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 36]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 48]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 48]
    fld dword ptr [edi + 52]
    fsub st(2)
    fstp dword ptr [edi + 52]
    fld dword ptr [edi + 56]
    fsub dword ptr [esp + 76]
    fstp dword ptr [edi + 56]
    fld dword ptr [edi + 56]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 52]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 48]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 60]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 60]
    fld dword ptr [edi + 64]
    fsub st(2)
    fstp dword ptr [edi + 64]
    fld dword ptr [edi + 68]
    fsub dword ptr [esp + 76]
    fstp dword ptr [edi + 68]
    fld dword ptr [edi + 68]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 64]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 60]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 72]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 72]
    fld dword ptr [edi + 76]
    fsub st(2)
    fstp dword ptr [edi + 76]
    fld dword ptr [edi + 80]
    fsub dword ptr [esp + 76]
    fstp dword ptr [edi + 80]
    fld dword ptr [edi + 80]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 76]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 72]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [edi + 84]
    fsub dword ptr [esp + 68]
    fstp dword ptr [edi + 84]
    fld dword ptr [edi + 88]
    fsub st(2)
    fstp dword ptr [edi + 88]
    fld dword ptr [edi + 92]
    fsub dword ptr [esp + 76]
    fstp dword ptr [edi + 92]
    fld dword ptr [edi + 92]
    fmul dword ptr [g_1019BE94]
    fld dword ptr [edi + 88]
    fmul dword ptr [g_1019BE8C]
    faddp st(1)
    fld dword ptr [edi + 84]
    fmul dword ptr [g_1019BE90]
    faddp st(1)
    fld st(0)
    fmul st(1)
    faddp st(2)
    fstp st(0)
    fld dword ptr [esp + 12]
    fsub st(1)
    fcomp dword ptr [g_1019BE6C]
    fnstsw ax
    fstp st(0)
    test ah, 5
    jp L35
    fstp st(0)
    fstp st(0)
L34:
    xor al, al
    pop ebx
    add esp, 76
    ret
L35:
    fld dword ptr [esp + 68]
    mov edx, dword ptr [esp + 84]
    imul ebx, ebx, 104
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [ebx + edx + 36]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [ebx + edx + 40]
    lea ecx, [ebx + edx]
    fld dword ptr [esp + 76]
    mov dword ptr [ecx], 3
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [ecx + 44]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [ecx + 4]
    fld dword ptr [esp + 60]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [ecx + 8]
    fld dword ptr [esp + 64]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [ecx + 12]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 52]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 48]
    faddp st(1)
    fld dword ptr [esp + 44]
    fmul dword ptr [esp + 44]
    faddp st(1)
    fcomp dword ptr [g_1019BD50]
    fnstsw ax
    test ah, 5
    jp L36
    xor eax, eax
    mov dword ptr [ecx + 64], eax
    mov dword ptr [ecx + 68], eax
    mov dword ptr [ecx + 72], 03F800000h
    mov al, 1
    pop ebx
    add esp, 76
    ret
L36:
    fld dword ptr [esp + 44]
    mov al, 1
    fchs
    pop ebx
    fstp dword ptr [ecx + 64]
    fld dword ptr [esp + 44]
    fchs
    fstp dword ptr [ecx + 68]
    fld dword ptr [esp + 48]
    fchs
    fstp dword ptr [ecx + 72]
    add esp, 76
    ret
FUN_100368a0 ENDP
END
