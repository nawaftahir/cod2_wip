; FUN_1010a8a8 @ 0x1010a8a8 — auto-synthesized
.CODE
FUN_1010a8a8 PROC
    push ebp
    mov ebp, esp
    sub esp, 0x20
    and esp, 0xfffffff0
    fld st(0)
    fst dword ptr [esp + 0x18]
    fistp qword ptr [esp + 0x10]
    fild qword ptr [esp + 0x10]
    mov edx, dword ptr [esp + 0x18]
    mov eax, dword ptr [esp + 0x10]
    test eax, eax
    je L0
    fsubp st(1)
    test edx, edx
    jns L1
    fstp dword ptr [esp]
    mov ecx, dword ptr [esp]
    xor ecx, 0x80000000
    add ecx, 0x7fffffff
    adc eax, 0
    mov edx, dword ptr [esp + 0x14]
    adc edx, 0
    jmp L2
    fstp dword ptr [esp]
    mov ecx, dword ptr [esp]
    add ecx, 0x7fffffff
    sbb eax, 0
    mov edx, dword ptr [esp + 0x14]
    sbb edx, 0
    jmp L2
    mov edx, dword ptr [esp + 0x14]
    test edx, 0x7fffffff
    jne L3
    fstp dword ptr [esp + 0x18]
    fstp dword ptr [esp + 0x18]
    leave
    ret
FUN_1010a8a8 ENDP
END