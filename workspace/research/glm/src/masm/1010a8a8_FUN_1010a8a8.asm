.686
.MODEL FLAT, C
.CODE
FUN_1010a8a8 PROC
    push ebp
    mov ebp, esp
    sub esp, 32
    and esp, 0FFFFFFF0h
    fld st(0)
    fst dword ptr [esp + 24]
    fistp qword ptr [esp + 16]
    fild qword ptr [esp + 16]
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 16]
    test eax, eax
    je L2
L0:
    fsubp st(1)
    test edx, edx
    jns L1
    fstp dword ptr [esp]
    mov ecx, dword ptr [esp]
    xor ecx, 080000000h
    add ecx, 07FFFFFFFh
    adc eax, 0
    mov edx, dword ptr [esp + 20]
    adc edx, 0
    jmp L3
L1:
    fstp dword ptr [esp]
    mov ecx, dword ptr [esp]
    add ecx, 07FFFFFFFh
    sbb eax, 0
    mov edx, dword ptr [esp + 20]
    sbb edx, 0
    jmp L3
L2:
    mov edx, dword ptr [esp + 20]
    test edx, 07FFFFFFFh
    jne L0
    fstp dword ptr [esp + 24]
    fstp dword ptr [esp + 24]
L3:
    leave
    ret
FUN_1010a8a8 ENDP
END
