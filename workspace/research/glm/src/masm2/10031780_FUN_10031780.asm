.686
.MODEL FLAT, C
EXTRN sub_1002EA58:PROC
EXTRN sub_1002EA96:PROC
EXTRN sub_1002EAD6:PROC
EXTRN sub_1002EB13:PROC
EXTRN sub_10031D4F:PROC
EXTRN sub_10031D73:PROC
EXTRN sub_10031D87:PROC
EXTRN sub_10031DB3:PROC
EXTRN sub_10031DE7:PROC
EXTRN sub_10031DE9:PROC
EXTRN sub_10031DF5:PROC
EXTRN sub_100321BB:PROC
EXTRN sub_1003A636:PROC
EXTRN sub_1003A906:PROC
EXTRN sub_1003A90F:PROC
EXTRN sub_1003ABCE:PROC
EXTRN sub_1003AC0D:PROC
EXTRN sub_1003ADCC:PROC
EXTRN sub_1003E037:PROC
EXTRN sub_1003E1CD:PROC
EXTRN sub_1003E807:PROC
EXTRN sub_1010AB61:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101D1B44:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9C4:DWORD:DWORD
EXTRN EXTRN g_1072D9CC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
.CODE
FUN_10031780 PROC
    mov mov eax, dword ptr [g_101D1B44]
    mov mov ecx, dword ptr [g_1072D9BC]
    sub sub esp, 08Ch
    cmp cmp ecx, eax
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, eax
    mov mov esi, 3
    jne L0
    cmp cmp dword ptr [g_1072D9C0], esi
    je L2
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L3
    call sub_1003A90F
    push push 31
    call sub_1003A636
    mov mov eax, dword ptr [g_101D1B44]
    add add esp, 4
    mov mov cl, byte ptr [esp + 0ACh]
    test test cl, cl
    jne L4
    mov mov edx, dword ptr [eax + 48]
    add add eax, 48
    and and edx, -15
    mov mov ecx, edx
    or or ecx, 2
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax], ecx
L1:
    mov mov ecx, 16
    mov mov esi, 010191368h
    lea lea edi, [esp + 88]
L3:
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edi, dword ptr [g_10730550]
    imul imul edi, edi, 0CD0h
    add add edi, 01072E220h
    mov mov ecx, 16
    lea lea esi, [esp + 88]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003E1CD
    lea lea eax, [esp + 88]
    push push eax
    call sub_1003E037
    fild fild dword ptr [esp + 0A8h]
    mov mov ebx, dword ptr [g_1072DDC8]
    mov mov eax, dword ptr [esp + 0A4h]
    add add esp, 4
    fstp fstp dword ptr [esp + 16]
    add add ebx, 0C8h
    test test eax, eax
    fild fild dword ptr [g_1076671C]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 16]
    fdiv fdiv dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 84]
    fild fild dword ptr [g_10766720]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 16]
    fdiv fdiv dword ptr [esp + 28]
    fstp fstp dword ptr [esp + 80]
    jle sub_10031D73
    mov mov ebp, dword ptr [esp + 0A8h]
    add add ebp, 4
    mov mov dword ptr [esp + 28], eax
    lea lea ebx, [ebx]
    fld fld dword ptr [ebx]
    fmul fmul dword ptr [ebp - 4]
    fld fld dword ptr [ebp]
    fmul fmul dword ptr [ebx + 16]
    faddp faddp st(1)
    fld fld dword ptr [ebx + 32]
    fmul fmul dword ptr [ebp + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [ebx + 48]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [ebx + 20]
    fmul fmul dword ptr [ebp]
    fld fld dword ptr [ebx + 36]
    fmul fmul dword ptr [ebp + 4]
    faddp faddp st(1)
    fld fld dword ptr [ebx + 4]
    fmul fmul dword ptr [ebp - 4]
    faddp faddp st(1)
    fadd fadd dword ptr [ebx + 52]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [ebp + 4]
    fmul fmul dword ptr [ebx + 40]
    fld fld dword ptr [ebx + 8]
    fmul fmul dword ptr [ebp - 4]
    faddp faddp st(1)
    fld fld dword ptr [ebp]
    fmul fmul dword ptr [ebx + 24]
    faddp faddp st(1)
    fadd fadd dword ptr [ebx + 56]
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [ebx + 28]
    fmul fmul dword ptr [ebp]
    fld fld dword ptr [ebx + 44]
    fmul fmul dword ptr [ebp + 4]
    faddp faddp st(1)
    fld fld dword ptr [ebx + 12]
    fmul fmul dword ptr [ebp - 4]
    faddp faddp st(1)
    fadd fadd dword ptr [ebx + 60]
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [ebx + 32]
    fmul fmul dword ptr [ebp + 20]
    fld fld dword ptr [ebp + 16]
    fmul fmul dword ptr [ebx + 16]
    faddp faddp st(1)
    fld fld dword ptr [ebx]
    fmul fmul dword ptr [ebp + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [ebx + 48]
    fstp fstp dword ptr [esp + 48]
    fld fld dword ptr [ebx + 36]
    fmul fmul dword ptr [ebp + 20]
    fld fld dword ptr [ebx + 20]
    fmul fmul dword ptr [ebp + 16]
    faddp faddp st(1)
    fld fld dword ptr [ebp + 12]
    fmul fmul dword ptr [ebx + 4]
    faddp faddp st(1)
    fadd fadd dword ptr [ebx + 52]
    fstp fstp dword ptr [esp + 52]
    fld fld dword ptr [ebx + 8]
    fmul fmul dword ptr [ebp + 12]
    fld fld dword ptr [ebp + 20]
    fmul fmul dword ptr [ebx + 40]
    faddp faddp st(1)
    fld fld dword ptr [ebp + 16]
    fmul fmul dword ptr [ebx + 24]
    faddp faddp st(1)
    fadd fadd dword ptr [ebx + 56]
    fstp fstp dword ptr [esp + 56]
    fld fld dword ptr [ebx + 44]
    fmul fmul dword ptr [ebp + 20]
    fld fld dword ptr [ebx + 28]
    fmul fmul dword ptr [ebp + 16]
    faddp faddp st(1)
    fld fld dword ptr [ebp + 12]
    fmul fmul dword ptr [ebx + 12]
    faddp faddp st(1)
    fadd fadd dword ptr [ebx + 60]
    fstp fstp dword ptr [esp + 60]
    fld fld dword ptr [esp + 52]
    fmul fmul dword ptr [esp + 44]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 36]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 60]
    fmul fmul dword ptr [esp + 32]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [esp + 44]
    fsubp fsubp st(1)
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 16]
    call sub_1010AB61
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 16]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L5
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 16]
    fstp fstp dword ptr [esp + 16]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 16]
    fmul fmul dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 20]
    mov mov ecx, dword ptr [g_1072D9D4]
    fmul fmul dword ptr [esp + 84]
    add add ecx, 4
    cmp cmp ecx, 0154Ah
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 80]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 68]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 72]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 60]
    fstp fstp dword ptr [esp + 76]
    jg sub_10031D4F
    mov mov edx, dword ptr [g_1072D9D0]
    add add edx, 6
    cmp cmp edx, 0100000h
    jle sub_10031DB3
    mov mov eax, dword ptr [g_1072D9CC]
    mov mov dword ptr [esp + 16], eax
    call sub_1003ABCE
    mov mov ecx, dword ptr [g_1072D9C4]
    mov mov esi, dword ptr [g_1072D9C0]
    mov mov edi, dword ptr [g_1072D9BC]
    push push ecx
    call sub_1003A906
    mov mov esi, dword ptr [esp + 20]
    mov mov eax, dword ptr [g_1072D9CC]
    add add esp, 4
    cmp cmp eax, esi
    je sub_10031DE9
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne sub_10031DE7
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je sub_10031DF5
    call sub_1003AC0D
    mov mov dword ptr [g_1072D9CC], esi
    mov mov edx, dword ptr [g_1072D9D4]
    fld fld dword ptr [esp + 36]
    mov mov ecx, dword ptr [g_1072D9D0]
    fsub fsub dword ptr [esp + 68]
    mov mov eax, dword ptr [g_1072D9B0]
    add add edx, 3
    mov mov word ptr [eax + ecx*2], dx
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov dx, word ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9B0]
    mov mov word ptr [eax + ecx*2 + 2], dx
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov eax, dword ptr [g_1072D9B0]
    add add edx, 2
    mov mov word ptr [eax + ecx*2 + 4], dx
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov eax, dword ptr [g_1072D9B0]
    add add edx, 2
    mov mov word ptr [eax + ecx*2 + 6], dx
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov dx, word ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9B0]
    mov mov word ptr [eax + ecx*2 + 8], dx
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9D0]
    mov mov ecx, dword ptr [g_1072D9B0]
    inc inc edx
    mov mov word ptr [ecx + eax*2 + 10], dx
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov eax, dword ptr [esp + 40]
    add add edx, 6
    push push 0
    mov mov dword ptr [g_1072D9D0], edx
    mov mov edx, dword ptr [esp + 48]
    push push 0
    push push edx
    push push eax
    mov mov eax, dword ptr [g_1072D9D4]
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    lea lea esi, [ebp + 8]
    fld fld dword ptr [esp + 56]
    mov mov edx, esi
    fsub fsub dword ptr [esp + 88]
    fstp fstp dword ptr [esp]
    call sub_1002EA58
    mov mov ecx, dword ptr [esp + 84]
    fld fld dword ptr [esp + 76]
    mov mov edx, dword ptr [esp + 80]
    fsub fsub dword ptr [esp + 100]
    mov mov eax, dword ptr [g_1072D9D4]
    add add esp, 24
    push push 03F800000h
    push push 0
    push push ecx
    push push edx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    lea lea edi, [ebp + 24]
    fld fld dword ptr [esp + 72]
    inc inc eax
    fsub fsub dword ptr [esp + 96]
    mov mov edx, edi
    fstp fstp dword ptr [esp]
    call sub_1002EA96
    mov mov eax, dword ptr [esp + 84]
    fld fld dword ptr [esp + 100]
    fadd fadd dword ptr [esp + 76]
    mov mov ecx, dword ptr [esp + 80]
    add add esp, 24
    push push 03F800000h
    push push 03F800000h
    push push eax
    push push ecx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 96]
    fadd fadd dword ptr [esp + 72]
    fstp fstp dword ptr [esp]
    mov mov eax, dword ptr [g_1072D9D4]
    add add eax, 2
    mov mov edx, edi
    call sub_1002EAD6
    fld fld dword ptr [esp + 92]
    mov mov edx, dword ptr [esp + 68]
    fadd fadd dword ptr [esp + 60]
    mov mov eax, dword ptr [esp + 64]
    add add esp, 24
    push push 0
    push push 03F800000h
    push push edx
    push push eax
    mov mov eax, dword ptr [g_1072D9D4]
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    add add eax, 3
    fld fld dword ptr [esp + 88]
    mov mov edx, esi
    fadd fadd dword ptr [esp + 56]
    fstp fstp dword ptr [esp]
    call sub_1002EB13
    mov mov edx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [esp + 52]
    add add edx, 4
    add add esp, 24
    add add ebp, 32
L5:
    dec dec eax
    mov mov dword ptr [g_1072D9D4], edx
    mov mov dword ptr [esp + 28], eax
    jne sub_10031D87
    call sub_1003ADCC
    mov mov edi, dword ptr [g_1072DDC8]
    call sub_1003E807
    mov mov al, byte ptr [esp + 0ACh]
    test test al, al
    jne sub_100321BB
    mov mov eax, dword ptr [g_101D1B44]
    mov mov edx, dword ptr [eax + 48]
    add add eax, 48
    and and edx, -15
    mov mov ecx, edx
    or or ecx, 4
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax], ecx
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 08Ch
    ret ret
FUN_10031780 ENDP
END
