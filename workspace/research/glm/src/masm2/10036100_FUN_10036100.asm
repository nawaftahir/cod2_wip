.686
.MODEL FLAT, C
EXTRN EXTRN g_1019BD54:DWORD:DWORD
.CODE
FUN_10036100 PROC
    fld fld dword ptr [esp + 4]
    add add ecx, 2
    fmul fmul dword ptr [g_1019BD54]
    add add eax, 8
    mov mov edx, 3
    push push esi
    jmp L0
    lea lea esp, [esp]
    nop nop
    movzx movzx esi, byte ptr [ecx - 2]
    mov mov dword ptr [esp + 8], esi
    add add eax, 32
    add add ecx, 8
    dec dec edx
    fild fild dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 40]
L0:
    fstp fstp dword ptr [eax - 40]
    movzx movzx esi, byte ptr [ecx - 9]
    mov mov dword ptr [esp + 8], esi
    fild fild dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 36]
    fstp fstp dword ptr [eax - 36]
    movzx movzx esi, byte ptr [ecx - 8]
    mov mov dword ptr [esp + 8], esi
    fild fild dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 32]
    fstp fstp dword ptr [eax - 32]
    movzx movzx esi, byte ptr [ecx - 7]
    mov mov dword ptr [esp + 8], esi
    fild fild dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 28]
    fstp fstp dword ptr [eax - 28]
    movzx movzx esi, byte ptr [ecx - 6]
    mov mov dword ptr [esp + 8], esi
    fild fild dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 24]
    fstp fstp dword ptr [eax - 24]
    movzx movzx esi, byte ptr [ecx - 5]
    mov mov dword ptr [esp + 8], esi
    fild fild dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 20]
    fstp fstp dword ptr [eax - 20]
    movzx movzx esi, byte ptr [ecx - 4]
    mov mov dword ptr [esp + 8], esi
    fild fild dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 16]
    fstp fstp dword ptr [eax - 16]
    movzx movzx esi, byte ptr [ecx - 3]
    mov mov dword ptr [esp + 8], esi
    fild fild dword ptr [esp + 8]
    fmul fmul st(1)
    fadd fadd dword ptr [eax - 12]
    fstp fstp dword ptr [eax - 12]
FUN_10036100 ENDP
END
