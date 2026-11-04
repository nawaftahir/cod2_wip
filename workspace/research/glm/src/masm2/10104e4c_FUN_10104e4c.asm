.686
.MODEL FLAT, C
EXTRN sub_10104C63:PROC
EXTRN sub_10104CEC:PROC
EXTRN sub_10104F29:PROC
EXTRN sub_10104F2E:PROC
EXTRN sub_10104F66:PROC
EXTRN EXTRN g_101A5364:DWORD:DWORD
.CODE
FUN_10104e4c PROC
    push push edx
    sub sub esp, 48
    fstp fstp xword ptr [esp + 24]
    fstp fstp xword ptr [esp]
    xor xor edx, edx
    mov mov eax, dword ptr [esp + 6]
    test test eax, 07FFF0000h
    je L0
    call sub_10104C63
    add add esp, 48
    pop pop edx
    ret ret
    fld fld xword ptr [esp]
    fld fld xword ptr [esp + 24]
    mov mov eax, dword ptr [esp]
    or or eax, dword ptr [esp + 4]
    je sub_10104F29
    fxch fxch st(1)
    fstp fstp xword ptr [esp + 12]
    fld fld xword ptr [esp]
    fxch fxch st(1)
    or or edx, 2
    fnstcw fnstcw word ptr [esp + 36]
    mov mov eax, dword ptr [esp + 36]
    or or eax, 033Fh
    mov mov dword ptr [esp + 40], eax
    fldcw fldcw word ptr [esp + 40]
    mov mov eax, dword ptr [esp + 32]
    and and eax, 07FFFh
    cmp cmp eax, 07FBEh
    ja sub_10104F2E
    or or edx, 1
    fmul fmul qword ptr [g_101A5364]
    fstp fstp xword ptr [esp + 24]
    fmul fmul qword ptr [g_101A5364]
    fstp fstp xword ptr [esp]
    jmp sub_10104F66
    fnstcw fnstcw word ptr [esp + 36]
    mov mov eax, dword ptr [esp + 36]
    or or eax, 0300h
    mov mov dword ptr [esp + 40], eax
    fldcw fldcw word ptr [esp + 40]
    fstp fstp st(0)
    fmul fmul qword ptr [g_101A5364]
    fstp fstp xword ptr [esp]
    fldcw fldcw word ptr [esp + 36]
    call sub_10104CEC
    add add esp, 48
    pop pop edx
    ret ret
    fprem fprem
    add add esp, 48
    pop pop edx
    ret ret
FUN_10104e4c ENDP
END
