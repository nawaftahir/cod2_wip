.686
.MODEL FLAT, C
EXTRN sub_100F8F91:PROC
EXTRN sub_100F8FB7:PROC
EXTRN sub_100F8FDD:PROC
EXTRN g_1019BD54:DWORD
EXTRN g_1019BE38:DWORD
.CODE
FUN_10026fe0 PROC
    sub esp, 16
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 28]
    push esi
    mov esi, eax
    push edi
    sub ebp, esi
    mov dword ptr [esp + 24], 6
L0:
    mov eax, dword ptr [esp + 44]
    xor ebx, ebx
    test eax, eax
    jle L4
    mov dword ptr [esp + 20], eax
    lea esp, [esp]
L1:
    mov eax, dword ptr [esp + 40]
    test eax, eax
    jle L3
    lea edi, [ebx + ebx*2]
    shl edi, 2
    mov dword ptr [esp + 16], eax
    jmp L2
    lea esp, [esp]
    nop
L2:
    mov eax, dword ptr [esi + ebp]
    movzx ecx, byte ptr [eax + ebx*4 + 2]
    mov dword ptr [esp + 28], ecx
    fild dword ptr [esp + 28]
    fmul dword ptr [g_1019BD54]
    fld qword ptr [g_1019BE38]
    call sub_100F8F91
    mov edx, dword ptr [esi]
    fstp dword ptr [edi + edx]
    mov eax, dword ptr [esi + ebp]
    movzx ecx, byte ptr [eax + ebx*4 + 1]
    mov dword ptr [esp + 28], ecx
    fild dword ptr [esp + 28]
    fmul dword ptr [g_1019BD54]
    fld qword ptr [g_1019BE38]
    call sub_100F8FB7
    mov edx, dword ptr [esi]
    fstp dword ptr [edi + edx + 4]
    mov eax, dword ptr [esi + ebp]
    movzx ecx, byte ptr [eax + ebx*4]
    mov dword ptr [esp + 28], ecx
    fild dword ptr [esp + 28]
    fmul dword ptr [g_1019BD54]
    fld qword ptr [g_1019BE38]
    call sub_100F8FDD
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esp + 16]
    fstp dword ptr [edi + edx + 8]
    inc ebx
    add edi, 12
    dec eax
    mov dword ptr [esp + 16], eax
    jne L2
L3:
    dec dword ptr [esp + 20]
    jne L1
L4:
    mov eax, dword ptr [esp + 24]
    add esi, 4
    dec eax
    mov dword ptr [esp + 24], eax
    jne L0
FUN_10026fe0 ENDP
END
