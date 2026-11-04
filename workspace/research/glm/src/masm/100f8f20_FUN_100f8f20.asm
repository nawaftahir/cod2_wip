.686
.MODEL FLAT, C
EXTRN sub_100F8FCD:PROC
EXTRN sub_101030FB:PROC
EXTRN g_1076ADB0:DWORD
.CODE
FUN_100f8f20 PROC
    cmp dword ptr [g_1076ADB0], 0
    je L1
    sub esp, 8
    stmxcsr dword ptr [esp + 4]
    mov eax, dword ptr [esp + 4]
    and eax, 000001F80h
    cmp eax, 000001F80h
    jne L0
    fnstcw word ptr [esp]
    mov ax, word ptr [esp]
    and ax, 127
    cmp ax, 127
L0:
    lea esp, [esp + 8]
    jne L1
    jmp sub_101030FB
L1:
    sub esp, 20
    fxch st(1)
    fstp qword ptr [esp]
    fst qword ptr [esp + 8]
    mov eax, dword ptr [esp + 12]
    call sub_100F8FCD
    add esp, 20
    ret
FUN_100f8f20 ENDP
END
