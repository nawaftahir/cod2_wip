.686
.MODEL FLAT, C
EXTRN g_1019BD54:DWORD
.CODE
FUN_10036100 PROC
    fld dword ptr [esp + 4]
    add ecx, 2
    fmul dword ptr [g_1019BD54]
    add eax, 8
    mov edx, 3
    push esi
    jmp L0
    lea esp, [esp]
    nop
L0:
    movzx esi, byte ptr [ecx - 2]
    mov dword ptr [esp + 8], esi
    add eax, 32
    add ecx, 8
    dec edx
    fild dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [eax - 40]
    fstp dword ptr [eax - 40]
    movzx esi, byte ptr [ecx - 9]
    mov dword ptr [esp + 8], esi
    fild dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [eax - 36]
    fstp dword ptr [eax - 36]
    movzx esi, byte ptr [ecx - 8]
    mov dword ptr [esp + 8], esi
    fild dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [eax - 32]
    fstp dword ptr [eax - 32]
    movzx esi, byte ptr [ecx - 7]
    mov dword ptr [esp + 8], esi
    fild dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [eax - 28]
    fstp dword ptr [eax - 28]
    movzx esi, byte ptr [ecx - 6]
    mov dword ptr [esp + 8], esi
    fild dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [eax - 24]
    fstp dword ptr [eax - 24]
    movzx esi, byte ptr [ecx - 5]
    mov dword ptr [esp + 8], esi
    fild dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [eax - 20]
    fstp dword ptr [eax - 20]
    movzx esi, byte ptr [ecx - 4]
    mov dword ptr [esp + 8], esi
    fild dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [eax - 16]
    fstp dword ptr [eax - 16]
    movzx esi, byte ptr [ecx - 3]
    mov dword ptr [esp + 8], esi
    fild dword ptr [esp + 8]
    fmul st(1)
    fadd dword ptr [eax - 12]
    fstp dword ptr [eax - 12]
FUN_10036100 ENDP
END
