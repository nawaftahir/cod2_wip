.686
.MODEL FLAT, C
EXTRN sub_100FB950:PROC
EXTRN g_10181CC0:DWORD
EXTRN g_10181CD0:DWORD
EXTRN g_10181CE0:DWORD
EXTRN g_10181CF0:DWORD
EXTRN g_10181D10:DWORD
EXTRN g_10181D20:DWORD
EXTRN g_10181D30:DWORD
EXTRN g_10181D40:DWORD
EXTRN g_10181D50:DWORD
EXTRN g_10182180:DWORD
EXTRN g_10182188:DWORD
EXTRN g_10182190:DWORD
EXTRN g_10182198:DWORD
.CODE
FUN_101051ee PROC
    unpcklpd xmm0, xmm0
    movapd xmm1, xmmword ptr [g_10181D10]
    movapd xmm6, xmmword ptr [g_10181CF0]
    movapd xmm2, xmmword ptr [g_10181D20]
    movapd xmm3, xmmword ptr [g_10181D30]
    pextrw eax, xmm0, 3
    and eax, 000007FFFh
    mov edx, 00000408Fh
    sub edx, eax
    sub eax, 000003C90h
    or edx, eax
    cmp edx, 080000000h
    jae L9
    mulpd xmm1, xmm0
    addpd xmm1, xmm6
    movapd xmm7, xmm1
    subpd xmm1, xmm6
    mulpd xmm2, xmm1
    movapd xmm4, xmmword ptr [g_10181D40]
    mulpd xmm3, xmm1
    movapd xmm5, xmmword ptr [g_10181D50]
    subpd xmm0, xmm2
    movd eax, xmm7
    mov ecx, eax
    and ecx, 63
    shl ecx, 4
    sar eax, 6
    mov edx, eax
    subpd xmm0, xmm3
    movapd xmm2, xmmword ptr [ecx + 010181D60h]
    mulpd xmm4, xmm0
    movapd xmm1, xmm0
    mulpd xmm0, xmm0
    addpd xmm5, xmm4
    mulsd xmm0, xmm0
    addsd xmm1, xmm2
    unpckhpd xmm2, xmm2
    movdqa xmm6, xmmword ptr [g_10181CD0]
    pand xmm7, xmm6
    movdqa xmm6, xmmword ptr [g_10181CE0]
    paddq xmm7, xmm6
    psllq xmm7, 46
    mulpd xmm0, xmm5
    addsd xmm1, xmm0
    orpd xmm2, xmm7
    unpckhpd xmm0, xmm0
    addsd xmm0, xmm1
    add edx, 00000037Eh
    cmp edx, 00000077Ch
    ja L0
    mulsd xmm0, xmm2
    sub esp, 16
    addsd xmm0, xmm2
    movlpd qword ptr [esp + 4], xmm0
    fld qword ptr [esp + 4]
    add esp, 16
    ret
L0:
    sub esp, 18
    wait
    fnstcw word ptr [esp + 16]
    mov dx, word ptr [esp + 16]
    or dx, 000000300h
    mov word ptr [esp], dx
    fldcw word ptr [esp]
    mov edx, eax
    sar eax, 1
    sub edx, eax
    movdqa xmm6, xmmword ptr [g_10181CC0]
    pandn xmm6, xmm2
    add eax, 0000003FFh
    movd xmm3, eax
    psllq xmm3, 52
    orpd xmm6, xmm3
    add edx, 0000003FFh
    movd xmm4, edx
    psllq xmm4, 52
    movlpd qword ptr [esp], xmm0
    fld qword ptr [esp]
    movlpd qword ptr [esp + 8], xmm6
    fld qword ptr [esp + 8]
    fmul st(1), st(0)
    faddp st(1)
    movlpd qword ptr [esp], xmm4
    fld qword ptr [esp]
    fmulp st(1)
    fstp qword ptr [esp]
    movlpd xmm0, qword ptr [esp]
    fldcw word ptr [esp + 16]
    add esp, 18
    pextrw ecx, xmm0, 3
    and ecx, 000007FF0h
    cmp ecx, 000007FF0h
    jae L1
    cmp ecx, 0
    je L2
    jmp L4
    cmp ecx, 080000000h
    jb L1
    cmp ecx, 0C086232Bh
    jb L4
    ja L2
    mov edx, dword ptr [esp + 4]
    cmp edx, 0FEFA39EFh
    jb L4
    jmp L2
L1:
    mov edx, 14
    jmp L3
L2:
    mov edx, 15
L3:
    sub esp, 28
    movlpd qword ptr [esp + 16], xmm0
    mov dword ptr [esp + 12], edx
    mov edx, esp
    add edx, 16
    mov dword ptr [esp + 8], edx
    add edx, 16
    mov dword ptr [esp + 4], edx
    mov dword ptr [esp], edx
    call sub_100FB950
    movlpd xmm0, qword ptr [esp + 16]
    add esp, 28
L4:
    sub esp, 16
    movlpd qword ptr [esp + 4], xmm0
    fld qword ptr [esp + 4]
    add esp, 16
    ret
    cmp eax, 07FF00000h
    jae L6
    mov eax, dword ptr [esp + 8]
    cmp eax, 080000000h
    jae L5
    movlpd xmm0, qword ptr [g_10182190]
    mulsd xmm0, xmm0
    mov edx, 14
    jmp L3
L5:
    movlpd xmm0, qword ptr [g_10182198]
    mulsd xmm0, xmm0
    mov edx, 15
    jmp L3
L6:
    mov edx, dword ptr [esp + 4]
    cmp eax, 07FF00000h
    ja L8
    cmp edx, 0
    jne L8
    mov eax, dword ptr [esp + 8]
    cmp eax, 07FF00000h
    jne L7
    fld qword ptr [g_10182180]
    ret
L7:
    fld qword ptr [g_10182188]
    ret
L8:
    mov edx, 0000003EAh
    jmp L3
L9:
    mov eax, dword ptr [esp + 8]
    and eax, 07FFFFFFFh
    cmp eax, 040900000h
FUN_101051ee ENDP
END
