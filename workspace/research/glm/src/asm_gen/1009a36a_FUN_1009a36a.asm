; FUN_1009a36a @ 0x1009a36a — auto-synthesized
    EXTRN g_1010c728:DWORD
.CODE
FUN_1009a36a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [eax]
    sub ecx, 0
    je L0
    dec ecx
    je L1
    dec ecx
    je L2
    dec ecx
    je L3
    mov eax, 0x80004005
    jmp L4
    fld qword ptr [eax + 8]
    jmp L5
    mov eax, dword ptr [eax + 8]
    test eax, eax
    mov dword ptr [ebp + 0xc], eax
    fild dword ptr [ebp + 0xc]
    jge L5
    fadd qword ptr [g_1010c728]
    jmp L5
    fild dword ptr [eax + 8]
    mov eax, dword ptr [ebp + 8]
    fstp qword ptr [eax]
    jmp L6
    cmp dword ptr [eax + 8], 0
    je L7
    fld1
    jmp L8
    fldz
    mov eax, dword ptr [ebp + 8]
    fld st(0)
    fstp qword ptr [eax]
    fstp st(0)
    xor eax, eax
    pop ebp
    ret 0xc
FUN_1009a36a ENDP
END