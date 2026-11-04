.686
.MODEL FLAT, C
EXTRN sub_100FB950:PROC
EXTRN sub_101054A6:PROC
EXTRN sub_1010553B:PROC
EXTRN sub_10105547:PROC
EXTRN sub_1010554A:PROC
EXTRN sub_1010555B:PROC
EXTRN sub_10105569:PROC
EXTRN sub_10105575:PROC
EXTRN sub_1010557C:PROC
EXTRN sub_1010558C:PROC
EXTRN sub_1010559A:PROC
EXTRN sub_101055DE:PROC
EXTRN sub_101055F1:PROC
EXTRN sub_10105624:PROC
EXTRN sub_1010562F:PROC
EXTRN sub_10105637:PROC
EXTRN sub_1010569C:PROC
EXTRN sub_101056A1:PROC
EXTRN sub_101056A5:PROC
EXTRN EXTRN g_10181CC0:DWORD:DWORD
EXTRN EXTRN g_10181CD0:DWORD:DWORD
EXTRN EXTRN g_10181CE0:DWORD:DWORD
EXTRN EXTRN g_10181CF0:DWORD:DWORD
EXTRN EXTRN g_10181D10:DWORD:DWORD
EXTRN EXTRN g_10181D20:DWORD:DWORD
EXTRN EXTRN g_10181D30:DWORD:DWORD
EXTRN EXTRN g_10181D40:DWORD:DWORD
EXTRN EXTRN g_10181D50:DWORD:DWORD
EXTRN EXTRN g_10182180:DWORD:DWORD
EXTRN EXTRN g_10182188:DWORD:DWORD
EXTRN EXTRN g_10182190:DWORD:DWORD
EXTRN EXTRN g_10182198:DWORD:DWORD
.CODE
FUN_101051ee PROC
    unpcklpd unpcklpd xmm0, xmm0
    movapd movapd xmm1, xmmword ptr [g_10181D10]
    movapd movapd xmm6, xmmword ptr [g_10181CF0]
    movapd movapd xmm2, xmmword ptr [g_10181D20]
    movapd movapd xmm3, xmmword ptr [g_10181D30]
    pextrw pextrw eax, xmm0, 3
    and and eax, 07FFFh
    mov mov edx, 0408Fh
    sub sub edx, eax
    sub sub eax, 03C90h
    or or edx, eax
    cmp cmp edx, 080000000h
    jae sub_101054A6
    mulpd mulpd xmm1, xmm0
    addpd addpd xmm1, xmm6
    movapd movapd xmm7, xmm1
    subpd subpd xmm1, xmm6
    mulpd mulpd xmm2, xmm1
    movapd movapd xmm4, xmmword ptr [g_10181D40]
    mulpd mulpd xmm3, xmm1
    movapd movapd xmm5, xmmword ptr [g_10181D50]
    subpd subpd xmm0, xmm2
    movd movd eax, xmm7
    mov mov ecx, eax
    and and ecx, 63
    shl shl ecx, 4
    sar sar eax, 6
    mov mov edx, eax
    subpd subpd xmm0, xmm3
    movapd movapd xmm2, xmmword ptr [ecx + 010181D60h]
    mulpd mulpd xmm4, xmm0
    movapd movapd xmm1, xmm0
    mulpd mulpd xmm0, xmm0
    addpd addpd xmm5, xmm4
    mulsd mulsd xmm0, xmm0
    addsd addsd xmm1, xmm2
    unpckhpd unpckhpd xmm2, xmm2
    movdqa movdqa xmm6, xmmword ptr [g_10181CD0]
    pand pand xmm7, xmm6
    movdqa movdqa xmm6, xmmword ptr [g_10181CE0]
    paddq paddq xmm7, xmm6
    psllq psllq xmm7, 46
    mulpd mulpd xmm0, xmm5
    addsd addsd xmm1, xmm0
    orpd orpd xmm2, xmm7
    unpckhpd unpckhpd xmm0, xmm0
    addsd addsd xmm0, xmm1
    add add edx, 037Eh
    cmp cmp edx, 077Ch
    ja L0
    mulsd mulsd xmm0, xmm2
    sub sub esp, 16
    addsd addsd xmm0, xmm2
    movlpd movlpd qword ptr [esp + 4], xmm0
    fld fld qword ptr [esp + 4]
    add add esp, 16
    ret ret
    sub sub esp, 18
    wait wait
    fnstcw fnstcw word ptr [esp + 16]
    mov mov dx, word ptr [esp + 16]
    or or dx, 0300h
    mov mov word ptr [esp], dx
    fldcw fldcw word ptr [esp]
    mov mov edx, eax
    sar sar eax, 1
    sub sub edx, eax
    movdqa movdqa xmm6, xmmword ptr [g_10181CC0]
    pandn pandn xmm6, xmm2
    add add eax, 03FFh
    movd movd xmm3, eax
    psllq psllq xmm3, 52
    orpd orpd xmm6, xmm3
    add add edx, 03FFh
    movd movd xmm4, edx
    psllq psllq xmm4, 52
    movlpd movlpd qword ptr [esp], xmm0
    fld fld qword ptr [esp]
    movlpd movlpd qword ptr [esp + 8], xmm6
    fld fld qword ptr [esp + 8]
    fmul fmul st(1), st(0)
    faddp faddp st(1)
    movlpd movlpd qword ptr [esp], xmm4
    fld fld qword ptr [esp]
    fmulp fmulp st(1)
    fstp fstp qword ptr [esp]
    movlpd movlpd xmm0, qword ptr [esp]
    fldcw fldcw word ptr [esp + 16]
    add add esp, 18
    pextrw pextrw ecx, xmm0, 3
    and and ecx, 07FF0h
    cmp cmp ecx, 07FF0h
    jae sub_1010553B
    cmp cmp ecx, 0
    je sub_10105547
    jmp sub_1010557C
    cmp cmp ecx, 080000000h
    jb sub_1010554A
    cmp cmp ecx, 0C086232Bh
    jb sub_1010558C
    ja sub_1010555B
    mov mov edx, dword ptr [esp + 4]
    cmp cmp edx, 0FEFA39EFh
    jb sub_1010559A
    jmp sub_10105569
    mov mov edx, 14
    jmp sub_10105575
    mov mov edx, 15
    sub sub esp, 28
    movlpd movlpd qword ptr [esp + 16], xmm0
    mov mov dword ptr [esp + 12], edx
    mov mov edx, esp
    add add edx, 16
    mov mov dword ptr [esp + 8], edx
    add add edx, 16
    mov mov dword ptr [esp + 4], edx
    mov mov dword ptr [esp], edx
    call sub_100FB950
    movlpd movlpd xmm0, qword ptr [esp + 16]
L0:
    add add esp, 28
    sub sub esp, 16
    movlpd movlpd qword ptr [esp + 4], xmm0
    fld fld qword ptr [esp + 4]
    add add esp, 16
    ret ret
    cmp cmp eax, 07FF00000h
    jae sub_10105637
    mov mov eax, dword ptr [esp + 8]
    cmp cmp eax, 080000000h
    jae sub_1010562F
    movlpd movlpd xmm0, qword ptr [g_10182190]
    mulsd mulsd xmm0, xmm0
    mov mov edx, 14
    jmp sub_101055DE
    movlpd movlpd xmm0, qword ptr [g_10182198]
    mulsd mulsd xmm0, xmm0
    mov mov edx, 15
    jmp sub_101055F1
    mov mov edx, dword ptr [esp + 4]
    cmp cmp eax, 07FF00000h
    ja sub_1010569C
    cmp cmp edx, 0
    jne sub_101056A1
    mov mov eax, dword ptr [esp + 8]
    cmp cmp eax, 07FF00000h
    jne sub_101056A5
    fld fld qword ptr [g_10182180]
    ret ret
    fld fld qword ptr [g_10182188]
    ret ret
    mov mov edx, 03EAh
    jmp sub_10105624
    mov mov eax, dword ptr [esp + 8]
    and and eax, 07FFFFFFFh
    cmp cmp eax, 040900000h
FUN_101051ee ENDP
END
