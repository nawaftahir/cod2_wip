.686
.MODEL FLAT, C
EXTRN sub_1002E781:PROC
EXTRN sub_1002E7B7:PROC
EXTRN sub_1002E7EF:PROC
EXTRN sub_1002E824:PROC
EXTRN sub_100317B2:PROC
EXTRN sub_100317C0:PROC
EXTRN sub_1003A637:PROC
EXTRN sub_1003A72A:PROC
EXTRN sub_1003A910:PROC
EXTRN sub_1003A9F3:PROC
EXTRN sub_1003AA31:PROC
EXTRN sub_1010A9B3:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_101D1B38:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9C4:DWORD:DWORD
EXTRN EXTRN g_1072D9CC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
.CODE
FUN_10031470 PROC
    mov mov eax, dword ptr [g_101D1B38]
    mov mov ecx, dword ptr [g_1072D9BC]
    sub sub esp, 12
    cmp cmp ecx, eax
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
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
    call sub_1003A910
    push push 31
    call sub_1003A637
    add add esp, 4
L0:
    test test ebp, ebp
    jle sub_100317B2
    mov mov ebx, dword ptr [esp + 36]
    add add ebx, 12
    lea lea esp, [esp]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [ebx - 8]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [ebx - 12]
L1:
    fsub fsub dword ptr [ebx + 4]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [esp + 24]
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 20]
    faddp faddp st(1)
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 32]
    call sub_1010A9B3
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [g_1019BC84]
    fld fld dword ptr [esp + 32]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L4
    fld fld dword ptr [g_1019BC78]
    fdiv fdiv dword ptr [esp + 32]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 20]
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [esp + 24]
    fstp fstp dword ptr [esp + 24]
    fld fld dword ptr [esp + 20]
    mov mov eax, dword ptr [g_1072D9D4]
    fmul fmul dword ptr [g_1019BCB0]
    add add eax, 4
    cmp cmp eax, 0154Ah
    fstp fstp dword ptr [esp + 20]
    fld fld dword ptr [esp + 24]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 24]
    jg L5
    mov mov ecx, dword ptr [g_1072D9D0]
    add add ecx, 6
    cmp cmp ecx, 0100000h
    jle L6
    mov mov edx, dword ptr [g_1072D9CC]
    mov mov dword ptr [esp + 32], edx
    call sub_1003A9F3
    mov mov eax, dword ptr [g_1072D9C4]
    mov mov esi, dword ptr [g_1072D9C0]
    mov mov edi, dword ptr [g_1072D9BC]
    push push eax
    call sub_1003A72A
    mov mov esi, dword ptr [esp + 36]
    mov mov eax, dword ptr [g_1072D9CC]
    add add esp, 4
    cmp cmp eax, esi
    je L8
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L7
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L9
    call sub_1003AA31
    mov mov dword ptr [g_1072D9CC], esi
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    inc inc ecx
    mov mov word ptr [edx + eax*2], cx
    mov mov eax, dword ptr [g_1072D9D0]
    mov mov cx, word ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov word ptr [edx + eax*2 + 2], cx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    add add ecx, 2
    mov mov word ptr [edx + eax*2 + 4], cx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov eax, dword ptr [g_1072D9D0]
    mov mov edx, dword ptr [g_1072D9B0]
    add add ecx, 2
    mov mov word ptr [edx + eax*2 + 6], cx
    mov mov eax, dword ptr [g_1072D9D0]
    mov mov cx, word ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9B0]
    mov mov word ptr [edx + eax*2 + 8], cx
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov edx, dword ptr [g_1072D9D0]
    mov mov eax, dword ptr [g_1072D9B0]
    add add ecx, 3
    mov mov word ptr [eax + edx*2 + 10], cx
    mov mov ecx, dword ptr [g_1072D9D0]
    mov mov eax, dword ptr [g_1072D9D4]
    add add ecx, 6
    mov mov dword ptr [g_1072D9D0], ecx
    fld fld dword ptr [ebx - 8]
    mov mov ecx, dword ptr [ebx - 4]
    fsub fsub dword ptr [esp + 24]
    push push 0
    push push 0
    push push ecx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    mov mov ecx, ebx
    fld fld dword ptr [ebx - 12]
    fsub fsub dword ptr [esp + 40]
    fstp fstp dword ptr [esp]
    call sub_1002E781
    mov mov edx, dword ptr [ebx + 12]
    fld fld dword ptr [ebx + 8]
    fsub fsub dword ptr [esp + 44]
    mov mov eax, dword ptr [g_1072D9D4]
    add add esp, 20
    push push 03F800000h
    push push 0
    push push edx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    lea lea esi, [ebx + 16]
    fld fld dword ptr [ebx + 4]
    inc inc eax
    fsub fsub dword ptr [esp + 40]
    mov mov ecx, esi
    fstp fstp dword ptr [esp]
    call sub_1002E7B7
    mov mov eax, dword ptr [ebx + 12]
    fld fld dword ptr [esp + 44]
    fadd fadd dword ptr [ebx + 8]
    add add esp, 20
    push push 03F800000h
    push push 03F800000h
    push push eax
    mov mov eax, dword ptr [g_1072D9D4]
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    add add eax, 2
    fld fld dword ptr [esp + 40]
    mov mov ecx, esi
    fadd fadd dword ptr [ebx + 4]
    fstp fstp dword ptr [esp]
    call sub_1002E7EF
    add add esp, 20
    push push 0
    push push 03F800000h
    mov mov ecx, dword ptr [ebx - 4]
    fld fld dword ptr [esp + 32]
    fadd fadd dword ptr [ebx - 8]
    mov mov eax, dword ptr [g_1072D9D4]
    push push ecx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    add add eax, 3
    fld fld dword ptr [esp + 40]
    mov mov ecx, ebx
    fadd fadd dword ptr [ebx - 12]
    fstp fstp dword ptr [esp]
    call sub_1002E824
    mov mov edx, dword ptr [g_1072D9D4]
    add add edx, 4
    add add esp, 20
    add add ebx, 32
    dec dec ebp
    mov mov dword ptr [g_1072D9D4], edx
    jne sub_100317C0
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
FUN_10031470 ENDP
END
