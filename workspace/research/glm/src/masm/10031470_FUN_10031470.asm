.686
.MODEL FLAT, C
EXTRN sub_1002E781:PROC
EXTRN sub_1002E7B7:PROC
EXTRN sub_1002E7EF:PROC
EXTRN sub_1002E824:PROC
EXTRN sub_1003A637:PROC
EXTRN sub_1003A72A:PROC
EXTRN sub_1003A910:PROC
EXTRN sub_1003A9F3:PROC
EXTRN sub_1003AA31:PROC
EXTRN sub_1010A9B3:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_1019BCB0:DWORD
EXTRN g_101D1B38:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9C4:DWORD
EXTRN g_1072D9CC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
.CODE
FUN_10031470 PROC
    mov eax, dword ptr [g_101D1B38]
    mov ecx, dword ptr [g_1072D9BC]
    sub esp, 12
    cmp ecx, eax
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 24]
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
    call sub_1003A910
L2:
    push 31
    call sub_1003A637
    add esp, 4
L3:
    test ebp, ebp
    jle L10
    mov ebx, dword ptr [esp + 36]
    add ebx, 12
    lea esp, [esp]
L4:
    fld dword ptr [ebx + 8]
    fsub dword ptr [ebx - 8]
    fstp dword ptr [esp + 20]
    fld dword ptr [ebx - 12]
    fsub dword ptr [ebx + 4]
    fstp dword ptr [esp + 24]
    fld dword ptr [esp + 24]
    fmul dword ptr [esp + 24]
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 20]
    faddp st(1)
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    call sub_1010A9B3
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    fstp dword ptr [esp + 32]
    fld dword ptr [g_1019BC84]
    fld dword ptr [esp + 32]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L5
    fld dword ptr [g_1019BC78]
    fdiv dword ptr [esp + 32]
    fstp dword ptr [esp + 32]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 20]
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 32]
    fmul dword ptr [esp + 24]
    fstp dword ptr [esp + 24]
L5:
    fld dword ptr [esp + 20]
    mov eax, dword ptr [g_1072D9D4]
    fmul dword ptr [g_1019BCB0]
    add eax, 4
    cmp eax, 00000154Ah
    fstp dword ptr [esp + 20]
    fld dword ptr [esp + 24]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 24]
    jg L6
    mov ecx, dword ptr [g_1072D9D0]
    add ecx, 6
    cmp ecx, 000100000h
    jle L9
L6:
    mov edx, dword ptr [g_1072D9CC]
    mov dword ptr [esp + 32], edx
    call sub_1003A9F3
    mov eax, dword ptr [g_1072D9C4]
    mov esi, dword ptr [g_1072D9C0]
    mov edi, dword ptr [g_1072D9BC]
    push eax
    call sub_1003A72A
    mov esi, dword ptr [esp + 36]
    mov eax, dword ptr [g_1072D9CC]
    add esp, 4
    cmp eax, esi
    je L9
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L7
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L8
L7:
    call sub_1003AA31
L8:
    mov dword ptr [g_1072D9CC], esi
L9:
    mov ecx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    inc ecx
    mov word ptr [edx + eax*2], cx
    mov eax, dword ptr [g_1072D9D0]
    mov cx, word ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    mov word ptr [edx + eax*2 + 2], cx
    mov ecx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    add ecx, 2
    mov word ptr [edx + eax*2 + 4], cx
    mov ecx, dword ptr [g_1072D9D4]
    mov eax, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    add ecx, 2
    mov word ptr [edx + eax*2 + 6], cx
    mov eax, dword ptr [g_1072D9D0]
    mov cx, word ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9B0]
    mov word ptr [edx + eax*2 + 8], cx
    mov ecx, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9D0]
    mov eax, dword ptr [g_1072D9B0]
    add ecx, 3
    mov word ptr [eax + edx*2 + 10], cx
    mov ecx, dword ptr [g_1072D9D0]
    mov eax, dword ptr [g_1072D9D4]
    add ecx, 6
    mov dword ptr [g_1072D9D0], ecx
    fld dword ptr [ebx - 8]
    mov ecx, dword ptr [ebx - 4]
    fsub dword ptr [esp + 24]
    push 0
    push 0
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    mov ecx, ebx
    fld dword ptr [ebx - 12]
    fsub dword ptr [esp + 40]
    fstp dword ptr [esp]
    call sub_1002E781
    mov edx, dword ptr [ebx + 12]
    fld dword ptr [ebx + 8]
    fsub dword ptr [esp + 44]
    mov eax, dword ptr [g_1072D9D4]
    add esp, 20
    push 03F800000h
    push 0
    push edx
    sub esp, 8
    fstp dword ptr [esp + 4]
    lea esi, [ebx + 16]
    fld dword ptr [ebx + 4]
    inc eax
    fsub dword ptr [esp + 40]
    mov ecx, esi
    fstp dword ptr [esp]
    call sub_1002E7B7
    mov eax, dword ptr [ebx + 12]
    fld dword ptr [esp + 44]
    fadd dword ptr [ebx + 8]
    add esp, 20
    push 03F800000h
    push 03F800000h
    push eax
    mov eax, dword ptr [g_1072D9D4]
    sub esp, 8
    fstp dword ptr [esp + 4]
    add eax, 2
    fld dword ptr [esp + 40]
    mov ecx, esi
    fadd dword ptr [ebx + 4]
    fstp dword ptr [esp]
    call sub_1002E7EF
    add esp, 20
    push 0
    push 03F800000h
    mov ecx, dword ptr [ebx - 4]
    fld dword ptr [esp + 32]
    fadd dword ptr [ebx - 8]
    mov eax, dword ptr [g_1072D9D4]
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    add eax, 3
    fld dword ptr [esp + 40]
    mov ecx, ebx
    fadd dword ptr [ebx - 12]
    fstp dword ptr [esp]
    call sub_1002E824
    mov edx, dword ptr [g_1072D9D4]
    add edx, 4
    add esp, 20
    add ebx, 32
    dec ebp
    mov dword ptr [g_1072D9D4], edx
    jne L4
L10:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
FUN_10031470 ENDP
END
