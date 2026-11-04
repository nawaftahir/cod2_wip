.686
.MODEL FLAT, C
EXTRN sub_1002E7F5:PROC
EXTRN sub_1002E82C:PROC
EXTRN sub_1002E868:PROC
EXTRN sub_1002E8A1:PROC
EXTRN sub_1003A633:PROC
EXTRN sub_1003A6A7:PROC
EXTRN sub_1003A90C:PROC
EXTRN sub_1003A96F:PROC
EXTRN sub_1003A9AE:PROC
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
FUN_10030de0 PROC
    mov eax, dword ptr [g_101D1B38]
    mov ecx, dword ptr [g_1072D9BC]
    sub esp, 8
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
    call sub_1003A90C
L2:
    push 31
    call sub_1003A633
    add esp, 4
L3:
    mov eax, dword ptr [esp + 28]
    movsx ecx, word ptr [eax + 6]
    mov dword ptr [esp + 16], ecx
    xor ebp, ebp
    cmp word ptr [eax + 4], bp
    fild dword ptr [esp + 16]
    lea ebx, [eax + 8]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 16]
    jle L9
    nop
L4:
    mov edx, dword ptr [g_1072D9D4]
    add edx, 4
    cmp edx, 00000154Ah
    jg L5
    mov eax, dword ptr [g_1072D9D0]
    add eax, 6
    cmp eax, 000100000h
    jle L8
L5:
    mov ecx, dword ptr [g_1072D9CC]
    mov dword ptr [esp + 20], ecx
    call sub_1003A96F
    mov edx, dword ptr [g_1072D9C4]
    mov esi, dword ptr [g_1072D9C0]
    mov edi, dword ptr [g_1072D9BC]
    push edx
    call sub_1003A6A7
    mov esi, dword ptr [esp + 24]
    mov eax, dword ptr [g_1072D9CC]
    add esp, 4
    cmp eax, esi
    je L8
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L6
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L7
L6:
    call sub_1003A9AE
L7:
    mov dword ptr [g_1072D9CC], esi
L8:
    mov eax, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    inc eax
    mov word ptr [ecx + edx*2], ax
    mov edx, dword ptr [g_1072D9D0]
    mov ax, word ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + edx*2 + 2], ax
    mov eax, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    add eax, 2
    mov word ptr [ecx + edx*2 + 4], ax
    mov eax, dword ptr [g_1072D9D4]
    mov edx, dword ptr [g_1072D9D0]
    mov ecx, dword ptr [g_1072D9B0]
    add eax, 2
    mov word ptr [ecx + edx*2 + 6], ax
    mov edx, dword ptr [g_1072D9D0]
    mov ax, word ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + edx*2 + 8], ax
    mov eax, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [g_1072D9D0]
    mov edx, dword ptr [g_1072D9B0]
    add eax, 3
    mov word ptr [edx + ecx*2 + 10], ax
    mov esi, dword ptr [g_1072D9D0]
    push 0
    add esi, 6
    mov dword ptr [g_1072D9D0], esi
    fld dword ptr [ebx + 4]
    mov eax, dword ptr [ebx + 8]
    fsub dword ptr [esp + 20]
    push 0
    push 03F800000h
    push eax
    mov eax, dword ptr [g_1072D9D4]
    sub esp, 8
    fstp dword ptr [esp + 4]
    lea esi, [ebx + 12]
    fld dword ptr [ebx]
    mov edx, esi
    fsub dword ptr [esp + 40]
    fstp dword ptr [esp]
    call sub_1002E7F5
    mov ecx, dword ptr [ebx + 8]
    fld dword ptr [esp + 40]
    fadd dword ptr [ebx + 4]
    mov eax, dword ptr [g_1072D9D4]
    add esp, 24
    push 03F800000h
    push 0
    push 03F800000h
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    inc eax
    fld dword ptr [ebx]
    mov edx, esi
    fsub dword ptr [esp + 40]
    fstp dword ptr [esp]
    call sub_1002E82C
    mov edx, dword ptr [ebx + 8]
    fld dword ptr [esp + 40]
    fadd dword ptr [ebx + 4]
    mov eax, dword ptr [g_1072D9D4]
    add esp, 24
    push 03F800000h
    push 03F800000h
    push 03F800000h
    push edx
    sub esp, 8
    fstp dword ptr [esp + 4]
    add eax, 2
    fld dword ptr [esp + 40]
    mov edx, esi
    fadd dword ptr [ebx]
    fstp dword ptr [esp]
    call sub_1002E868
    mov eax, dword ptr [ebx + 8]
    fld dword ptr [ebx + 4]
    fsub dword ptr [esp + 40]
    add esp, 24
    push 0
    push 03F800000h
    push 03F800000h
    push eax
    mov eax, dword ptr [g_1072D9D4]
    sub esp, 8
    fstp dword ptr [esp + 4]
    add eax, 3
    fld dword ptr [esp + 40]
    mov edx, esi
    fadd dword ptr [ebx]
    fstp dword ptr [esp]
    call sub_1002E8A1
    mov esi, dword ptr [g_1072D9D4]
    mov ecx, dword ptr [esp + 52]
    add esi, 4
    mov dword ptr [g_1072D9D4], esi
    movsx edx, word ptr [ecx + 4]
    add esp, 24
    inc ebp
    add ebx, 16
    cmp ebp, edx
    jl L4
L9:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
FUN_10030de0 ENDP
END
