.686
.MODEL FLAT, C
EXTRN sub_1002EA58:PROC
EXTRN sub_1002EA96:PROC
EXTRN sub_1002EAD6:PROC
EXTRN sub_1002EB13:PROC
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
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101D1B44:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9C4:DWORD
EXTRN g_1072D9CC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_10730550:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
.CODE
FUN_10031780 PROC
    mov eax, dword ptr [g_101D1B44]
    mov ecx, dword ptr [g_1072D9BC]
    sub esp, 00000008Ch
    cmp ecx, eax
    push ebx
    push ebp
    push esi
    push edi
    mov edi, eax
    mov esi, 3
    jne L0
    cmp dword ptr [g_1072D9C0], esi
    je L3
L0:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L1
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L2
L1:
    call sub_1003A90F
L2:
    push 31
    call sub_1003A636
    mov eax, dword ptr [g_101D1B44]
    add esp, 4
L3:
    mov cl, byte ptr [esp + 0000000ACh]
    test cl, cl
    jne L4
    mov edx, dword ptr [eax + 48]
    add eax, 48
    and edx, 0FFFFFFF1h
    mov ecx, edx
    or ecx, 2
    mov dword ptr [eax], edx
    mov dword ptr [eax], ecx
L4:
    mov ecx, 16
    mov esi, 010191368h
    lea edi, [esp + 88]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edi, dword ptr [g_10730550]
    imul edi, edi, 000000CD0h
    add edi, 01072E220h
    mov ecx, 16
    lea esi, [esp + 88]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    call sub_1003E1CD
    lea eax, [esp + 88]
    push eax
    call sub_1003E037
    fild dword ptr [esp + 0000000A8h]
    mov ebx, dword ptr [g_1072DDC8]
    mov eax, dword ptr [esp + 0000000A4h]
    add esp, 4
    fstp dword ptr [esp + 16]
    add ebx, 0000000C8h
    test eax, eax
    fild dword ptr [g_1076671C]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 16]
    fdiv dword ptr [esp + 28]
    fstp dword ptr [esp + 84]
    fild dword ptr [g_10766720]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 16]
    fdiv dword ptr [esp + 28]
    fstp dword ptr [esp + 80]
    jle L11
    mov ebp, dword ptr [esp + 0000000A8h]
    add ebp, 4
    mov dword ptr [esp + 28], eax
    lea ebx, [ebx]
L5:
    fld dword ptr [ebx]
    fmul dword ptr [ebp - 4]
    fld dword ptr [ebp]
    fmul dword ptr [ebx + 16]
    faddp st(1)
    fld dword ptr [ebx + 32]
    fmul dword ptr [ebp + 4]
    faddp st(1)
    fadd dword ptr [ebx + 48]
    fstp dword ptr [esp + 32]
    fld dword ptr [ebx + 20]
    fmul dword ptr [ebp]
    fld dword ptr [ebx + 36]
    fmul dword ptr [ebp + 4]
    faddp st(1)
    fld dword ptr [ebx + 4]
    fmul dword ptr [ebp - 4]
    faddp st(1)
    fadd dword ptr [ebx + 52]
    fstp dword ptr [esp + 36]
    fld dword ptr [ebp + 4]
    fmul dword ptr [ebx + 40]
    fld dword ptr [ebx + 8]
    fmul dword ptr [ebp - 4]
    faddp st(1)
    fld dword ptr [ebp]
    fmul dword ptr [ebx + 24]
    faddp st(1)
    fadd dword ptr [ebx + 56]
    fstp dword ptr [esp + 40]
    fld dword ptr [ebx + 28]
    fmul dword ptr [ebp]
    fld dword ptr [ebx + 44]
    fmul dword ptr [ebp + 4]
    faddp st(1)
    fld dword ptr [ebx + 12]
    fmul dword ptr [ebp - 4]
    faddp st(1)
    fadd dword ptr [ebx + 60]
    fstp dword ptr [esp + 44]
    fld dword ptr [ebx + 32]
    fmul dword ptr [ebp + 20]
    fld dword ptr [ebp + 16]
    fmul dword ptr [ebx + 16]
    faddp st(1)
    fld dword ptr [ebx]
    fmul dword ptr [ebp + 12]
    faddp st(1)
    fadd dword ptr [ebx + 48]
    fstp dword ptr [esp + 48]
    fld dword ptr [ebx + 36]
    fmul dword ptr [ebp + 20]
    fld dword ptr [ebx + 20]
    fmul dword ptr [ebp + 16]
    faddp st(1)
    fld dword ptr [ebp + 12]
    fmul dword ptr [ebx + 4]
    faddp st(1)
    fadd dword ptr [ebx + 52]
    fstp dword ptr [esp + 52]
    fld dword ptr [ebx + 8]
    fmul dword ptr [ebp + 12]
    fld dword ptr [ebp + 20]
    fmul dword ptr [ebx + 40]
    faddp st(1)
    fld dword ptr [ebp + 16]
    fmul dword ptr [ebx + 24]
    faddp st(1)
    fadd dword ptr [ebx + 56]
    fstp dword ptr [esp + 56]
    fld dword ptr [ebx + 44]
    fmul dword ptr [ebp + 20]
    fld dword ptr [ebx + 28]
    fmul dword ptr [ebp + 16]
    faddp st(1)
    fld dword ptr [ebp + 12]
    fmul dword ptr [ebx + 12]
    faddp st(1)
    fadd dword ptr [ebx + 60]
    fstp dword ptr [esp + 60]
    fld dword ptr [esp + 52]
    fmul dword ptr [esp + 44]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 36]
    fsubp st(1)
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 60]
    fmul dword ptr [esp + 32]
    fld dword ptr [esp + 48]
    fmul dword ptr [esp + 44]
    fsubp st(1)
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 20]
    faddp st(1)
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 16]
    call sub_1010AB61
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 16]
    fstp dword ptr [esp + 16]
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp + 16]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L6
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 16]
    fstp dword ptr [esp + 16]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 20]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 16]
    fmul dword ptr [esp + 24]
    fstp dword ptr [esp + 24]
L6:
    fld dword ptr [esp + 20]
    mov ecx, dword ptr [g_1072D9D4]
    fmul dword ptr [esp + 84]
    add ecx, 4
    cmp ecx, 00000154Ah
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 80]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 44]
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 44]
    fstp dword ptr [esp + 68]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 60]
    fstp dword ptr [esp + 72]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 60]
    fstp dword ptr [esp + 76]
    jg L7
    mov edx, dword ptr [g_1072D9D0]
    add edx, 6
    cmp edx, 000100000h
    jle L10
L7:
    mov eax, dword ptr [g_1072D9CC]
    mov dword ptr [esp + 16], eax
    call sub_1003ABCE
    mov ecx, dword ptr [g_1072D9C4]
    mov esi, dword ptr [g_1072D9C0]
    mov edi, dword ptr [g_1072D9BC]
    push ecx
    call sub_1003A906
    mov esi, dword ptr [esp + 20]
    mov eax, dword ptr [g_1072D9CC]
    add esp, 4
    cmp eax, esi
    je L10
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L8
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L9
L8:
    call sub_1003AC0D
L9:
    mov dword ptr [g_1072D9CC], esi
L10:
    mov edx, dword ptr [g_1072D9D4]
    fld dword ptr [esp + 36]
    mov ecx, dword ptr [g_1072D9D0]
    fsub dword ptr [esp + 68]
    mov eax, dword ptr [g_1072D9B0]
    add edx, 3
    mov word ptr [eax + ecx*2], dx
    mov ecx, dword ptr [g_1072D9D0]
    mov dx, word ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9B0]
    mov word ptr [eax + ecx*2 + 2], dx
    mov edx, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9D0]
    mov eax, dword ptr [g_1072D9B0]
    add edx, 2
    mov word ptr [eax + ecx*2 + 4], dx
    mov edx, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9D0]
    mov eax, dword ptr [g_1072D9B0]
    add edx, 2
    mov word ptr [eax + ecx*2 + 6], dx
    mov ecx, dword ptr [g_1072D9D0]
    mov dx, word ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9B0]
    mov word ptr [eax + ecx*2 + 8], dx
    mov edx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    inc edx
    mov word ptr [ecx + eax*2 + 10], dx
    mov edx, dword ptr [g_1072D9D0]
    mov eax, dword ptr [esp + 40]
    add edx, 6
    push 0
    mov dword ptr [g_1072D9D0], edx
    mov edx, dword ptr [esp + 48]
    push 0
    push edx
    push eax
    mov eax, dword ptr [g_1072D9D4]
    sub esp, 8
    fstp dword ptr [esp + 4]
    lea esi, [ebp + 8]
    fld dword ptr [esp + 56]
    mov edx, esi
    fsub dword ptr [esp + 88]
    fstp dword ptr [esp]
    call sub_1002EA58
    mov ecx, dword ptr [esp + 84]
    fld dword ptr [esp + 76]
    mov edx, dword ptr [esp + 80]
    fsub dword ptr [esp + 100]
    mov eax, dword ptr [g_1072D9D4]
    add esp, 24
    push 03F800000h
    push 0
    push ecx
    push edx
    sub esp, 8
    fstp dword ptr [esp + 4]
    lea edi, [ebp + 24]
    fld dword ptr [esp + 72]
    inc eax
    fsub dword ptr [esp + 96]
    mov edx, edi
    fstp dword ptr [esp]
    call sub_1002EA96
    mov eax, dword ptr [esp + 84]
    fld dword ptr [esp + 100]
    fadd dword ptr [esp + 76]
    mov ecx, dword ptr [esp + 80]
    add esp, 24
    push 03F800000h
    push 03F800000h
    push eax
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 96]
    fadd dword ptr [esp + 72]
    fstp dword ptr [esp]
    mov eax, dword ptr [g_1072D9D4]
    add eax, 2
    mov edx, edi
    call sub_1002EAD6
    fld dword ptr [esp + 92]
    mov edx, dword ptr [esp + 68]
    fadd dword ptr [esp + 60]
    mov eax, dword ptr [esp + 64]
    add esp, 24
    push 0
    push 03F800000h
    push edx
    push eax
    mov eax, dword ptr [g_1072D9D4]
    sub esp, 8
    fstp dword ptr [esp + 4]
    add eax, 3
    fld dword ptr [esp + 88]
    mov edx, esi
    fadd dword ptr [esp + 56]
    fstp dword ptr [esp]
    call sub_1002EB13
    mov edx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [esp + 52]
    add edx, 4
    add esp, 24
    add ebp, 32
    dec eax
    mov dword ptr [g_1072D9D4], edx
    mov dword ptr [esp + 28], eax
    jne L5
L11:
    call sub_1003ADCC
    mov edi, dword ptr [g_1072DDC8]
    call sub_1003E807
    mov al, byte ptr [esp + 0000000ACh]
    test al, al
    jne L12
    mov eax, dword ptr [g_101D1B44]
    mov edx, dword ptr [eax + 48]
    add eax, 48
    and edx, 0FFFFFFF1h
    mov ecx, edx
    or ecx, 4
    mov dword ptr [eax], edx
    mov dword ptr [eax], ecx
L12:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 00000008Ch
    ret
FUN_10031780 ENDP
END
