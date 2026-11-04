.686
.MODEL FLAT, C
EXTRN sub_100F8F91:PROC
EXTRN sub_100F8FCD:PROC
EXTRN sub_101030FB:PROC
EXTRN EXTRN g_1076ADB0:DWORD:DWORD
.CODE
FUN_100f8f20 PROC
    cmp cmp dword ptr [g_1076ADB0], 0
    je L0
    sub sub esp, 8
    stmxcsr stmxcsr dword ptr [esp + 4]
    mov mov eax, dword ptr [esp + 4]
    and and eax, 01F80h
    cmp cmp eax, 01F80h
    jne L1
    fnstcw fnstcw word ptr [esp]
    mov mov ax, word ptr [esp]
    and and ax, 127
    cmp cmp ax, 127
    lea lea esp, [esp + 8]
    jne sub_100F8F91
    jmp sub_101030FB
    sub sub esp, 20
    fxch fxch st(1)
    fstp fstp qword ptr [esp]
    fst fst qword ptr [esp + 8]
    mov mov eax, dword ptr [esp + 12]
    call sub_100F8FCD
    add add esp, 20
    ret ret
FUN_100f8f20 ENDP
END
