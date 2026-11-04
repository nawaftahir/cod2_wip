.686
.MODEL FLAT, C
EXTRN sub_100270E5:PROC
EXTRN sub_100270E9:PROC
EXTRN sub_100270F0:PROC
EXTRN sub_100270F2:PROC
EXTRN sub_10027106:PROC
EXTRN sub_100F8F91:PROC
EXTRN sub_100F8FB7:PROC
EXTRN sub_100F8FDD:PROC
EXTRN EXTRN g_1019BD54:DWORD:DWORD
EXTRN EXTRN g_1019BE38:DWORD:DWORD
.CODE
FUN_10026fe0 PROC
    sub sub esp, 16
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 28]
    push push esi
    mov mov esi, eax
    push push edi
    sub sub ebp, esi
    mov mov dword ptr [esp + 24], 6
    mov mov eax, dword ptr [esp + 44]
    xor xor ebx, ebx
    test test eax, eax
    jle sub_100270E5
    mov mov dword ptr [esp + 20], eax
    lea lea esp, [esp]
    mov mov eax, dword ptr [esp + 40]
    test test eax, eax
    jle sub_100270F2
    lea lea edi, [ebx + ebx*2]
    shl shl edi, 2
    mov mov dword ptr [esp + 16], eax
    jmp L0
    lea lea esp, [esp]
    nop nop
    mov mov eax, dword ptr [esi + ebp]
    movzx movzx ecx, byte ptr [eax + ebx*4 + 2]
    mov mov dword ptr [esp + 28], ecx
    fild fild dword ptr [esp + 28]
    fmul fmul dword ptr [g_1019BD54]
    fld fld qword ptr [g_1019BE38]
    call sub_100F8F91
    mov mov edx, dword ptr [esi]
    fstp fstp dword ptr [edi + edx]
    mov mov eax, dword ptr [esi + ebp]
    movzx movzx ecx, byte ptr [eax + ebx*4 + 1]
    mov mov dword ptr [esp + 28], ecx
    fild fild dword ptr [esp + 28]
    fmul fmul dword ptr [g_1019BD54]
    fld fld qword ptr [g_1019BE38]
    call sub_100F8FB7
    mov mov edx, dword ptr [esi]
    fstp fstp dword ptr [edi + edx + 4]
    mov mov eax, dword ptr [esi + ebp]
    movzx movzx ecx, byte ptr [eax + ebx*4]
    mov mov dword ptr [esp + 28], ecx
    fild fild dword ptr [esp + 28]
    fmul fmul dword ptr [g_1019BD54]
    fld fld qword ptr [g_1019BE38]
    call sub_100F8FDD
    mov mov edx, dword ptr [esi]
    mov mov eax, dword ptr [esp + 16]
    fstp fstp dword ptr [edi + edx + 8]
    inc inc ebx
    add add edi, 12
    dec dec eax
    mov mov dword ptr [esp + 16], eax
    jne sub_10027106
    dec dec dword ptr [esp + 20]
    jne sub_100270F0
    mov mov eax, dword ptr [esp + 24]
    add add esi, 4
    dec dec eax
    mov mov dword ptr [esp + 24], eax
    jne sub_100270E9
FUN_10026fe0 ENDP
END
