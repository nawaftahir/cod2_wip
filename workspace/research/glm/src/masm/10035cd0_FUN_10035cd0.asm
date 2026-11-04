.686
.MODEL FLAT, C
EXTRN sub_100058BA:PROC
EXTRN sub_1002C25B:PROC
EXTRN sub_10035DE8:PROC
EXTRN g_1019BD68:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BDE0:DWORD
EXTRN g_101CE7CC:DWORD
EXTRN g_106D3194:DWORD
EXTRN g_10764578:DWORD
.CODE
FUN_10035cd0 PROC
    mov ecx, dword ptr [g_10764578]
    sub esp, 76
    test ecx, ecx
    push ebx
    push ebp
    push esi
    push edi
    je L9
    mov ecx, dword ptr [g_101CE7CC]
    mov ecx, dword ptr [ecx + 8]
    test ecx, ecx
    mov dword ptr [esp + 60], ecx
    jle L9
    fld dword ptr [eax]
    fsub dword ptr [g_1019BDE0]
    fstp dword ptr [esp + 44]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 64]
    fld dword ptr [esp + 44]
    fadd qword ptr [esp + 64]
    fistp dword ptr [esp + 40]
    fld dword ptr [eax + 4]
    mov edx, dword ptr [esp + 40]
    fsub dword ptr [g_1019BDE0]
    sar edx, 5
    mov dword ptr [esp + 56], edx
    fstp dword ptr [esp + 44]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 64]
    fld dword ptr [esp + 44]
    fadd qword ptr [esp + 64]
    fistp dword ptr [esp + 40]
    fld dword ptr [eax + 8]
    mov ebx, dword ptr [esp + 40]
    fsub dword ptr [g_1019BDE0]
    sar ebx, 5
    mov dword ptr [esp + 52], ebx
    fstp dword ptr [esp + 44]
    fld qword ptr [g_1019BD68]
    fstp qword ptr [esp + 64]
    fld dword ptr [esp + 44]
    fsub qword ptr [esp + 64]
    fistp dword ptr [esp + 40]
    mov edi, dword ptr [esp + 40]
    lea eax, [edx - 000001000h]
    shl eax, 5
    mov dword ptr [esp + 44], eax
    fild dword ptr [esp + 44]
    lea eax, [ebx - 000001000h]
    shl eax, 5
    fstp dword ptr [esp + 76]
    sar edi, 6
    mov dword ptr [esp + 44], eax
    fild dword ptr [esp + 44]
    lea eax, [edi - 000000800h]
    shl eax, 6
    fstp dword ptr [esp + 80]
    mov dword ptr [esp + 44], eax
    fild dword ptr [esp + 44]
    or ebp, 0FFFFFFFFh
    mov dword ptr [esp + 64], edi
    mov dword ptr [esp + 28], ebp
    fstp dword ptr [esp + 84]
    lea esp, [esp]
L0:
    lea eax, [edi + ebp]
    test eax, eax
    mov dword ptr [esp + 32], eax
    jl L8
    shl eax, 6
    cmp eax, 000080000h
    jg L8
    mov esi, ecx
    neg esi
    cmp esi, ecx
    mov dword ptr [esp + 36], esi
    jg L8
    mov eax, ecx
    sub eax, esi
    lea edi, [esi + ebx]
    inc eax
    mov dword ptr [esp + 24], edi
    mov dword ptr [esp + 44], eax
    lea ecx, [ecx]
L1:
    test edi, edi
    jl L7
    mov ebp, edi
    shl ebp, 5
    cmp ebp, 000080000h
    jg L7
    cmp esi, ecx
    jg L7
    lea ebp, [esi + edx]
    lea eax, [ebp - 000001000h]
    shl eax, 5
    mov dword ptr [esp + 20], eax
    mov eax, ecx
    sub eax, esi
    inc eax
    mov dword ptr [esp + 40], eax
    lea ebx, [ebx]
L2:
    test ebp, ebp
    jl L6
    mov ecx, ebp
    shl ecx, 5
    cmp ecx, 000080000h
    jg L6
    mov edx, dword ptr [esp + 32]
    push 0
    push edx
    push edi
    mov ebx, ebp
    call sub_10035DE8
    add esp, 12
    test eax, eax
    jge L6
    fild dword ptr [esp + 20]
    mov eax, dword ptr [esp + 32]
    mov esi, dword ptr [esp + 100]
    mov ecx, dword ptr [esp + 96]
    add edi, 0FFFFF000h
    fstp dword ptr [esp + 76]
    shl edi, 5
    mov dword ptr [esp + 48], edi
    fild dword ptr [esp + 48]
    add eax, 0FFFFF800h
    shl eax, 6
    mov dword ptr [esp + 48], eax
    fstp dword ptr [esp + 80]
    push 0
    fild dword ptr [esp + 52]
    lea edi, [esp + 80]
    fstp dword ptr [esp + 88]
    call sub_1002C25B
    add esp, 4
    cmp eax, 2
    je L5
    mov eax, dword ptr [esp + 28]
    test eax, eax
    je L3
    cmp eax, 1
    mov ebx, 010191408h
    jne L4
L3:
    mov ebx, 0101913C8h
L4:
    mov edi, dword ptr [g_106D3194]
    push 010195640h
    lea ecx, [esp + 80]
    push 03F800000h
    push ecx
    add edi, 000249D18h
    call sub_100058BA
    add esp, 12
L5:
    mov edi, dword ptr [esp + 24]
    mov esi, dword ptr [esp + 36]
L6:
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 40]
    add edx, 32
    inc ebp
    dec eax
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 40], eax
    jne L2
    mov ebx, dword ptr [esp + 52]
    mov edx, dword ptr [esp + 56]
    mov ecx, dword ptr [esp + 60]
    mov eax, dword ptr [esp + 44]
L7:
    inc edi
    dec eax
    mov dword ptr [esp + 24], edi
    mov dword ptr [esp + 44], eax
    jne L1
    mov edi, dword ptr [esp + 64]
    mov ebp, dword ptr [esp + 28]
L8:
    inc ebp
    cmp ebp, 1
    mov dword ptr [esp + 28], ebp
    jle L0
L9:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 76
    ret
FUN_10035cd0 ENDP
END
