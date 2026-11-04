.686
.MODEL FLAT, C
EXTRN sub_10104C63:PROC
EXTRN sub_10104CEC:PROC
EXTRN g_101A5364:DWORD
.CODE
FUN_10104e4c PROC
    push edx
    sub esp, 48
    fstp xword ptr [esp + 24]
    fstp xword ptr [esp]
    xor edx, edx
    mov eax, dword ptr [esp + 6]
    test eax, 07FFF0000h
    je L0
    call sub_10104C63
    add esp, 48
    pop edx
    ret
L0:
    fld xword ptr [esp]
    fld xword ptr [esp + 24]
    mov eax, dword ptr [esp]
    or eax, dword ptr [esp + 4]
    je L3
    fxch st(1)
    fstp xword ptr [esp + 12]
    fld xword ptr [esp]
    fxch st(1)
    or edx, 2
    fnstcw word ptr [esp + 36]
    mov eax, dword ptr [esp + 36]
    or eax, 00000033Fh
    mov dword ptr [esp + 40], eax
    fldcw word ptr [esp + 40]
    mov eax, dword ptr [esp + 32]
    and eax, 000007FFFh
    cmp eax, 000007FBEh
    ja L1
    or edx, 1
    fmul qword ptr [g_101A5364]
    fstp xword ptr [esp + 24]
    fmul qword ptr [g_101A5364]
    fstp xword ptr [esp]
    jmp L2
L1:
    fnstcw word ptr [esp + 36]
    mov eax, dword ptr [esp + 36]
    or eax, 000000300h
    mov dword ptr [esp + 40], eax
    fldcw word ptr [esp + 40]
    fstp st(0)
    fmul qword ptr [g_101A5364]
    fstp xword ptr [esp]
L2:
    fldcw word ptr [esp + 36]
    call sub_10104CEC
    add esp, 48
    pop edx
    ret
L3:
    fprem
    add esp, 48
    pop edx
    ret
FUN_10104e4c ENDP
END
