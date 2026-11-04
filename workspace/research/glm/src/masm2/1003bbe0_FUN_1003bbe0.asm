.686
.MODEL FLAT, C
EXTRN sub_1003A64A:PROC
EXTRN sub_1003A8EC:PROC
EXTRN sub_1003A923:PROC
EXTRN sub_1003A9BA:PROC
EXTRN sub_1003B1A2:PROC
EXTRN sub_1003E5A4:PROC
EXTRN EXTRN g_1019BCAC:DWORD:DWORD
EXTRN EXTRN g_1019BD58:DWORD:DWORD
EXTRN EXTRN g_1019BD80:DWORD:DWORD
EXTRN EXTRN g_1019BF20:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1003bbe0 PROC
    mov mov eax, dword ptr [g_1072D9D0]
    sub sub esp, 20
    test test eax, eax
    push push esi
    push push edi
    jne L0
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L1
    call sub_1003A8EC
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov edi, dword ptr [eax + 0168h]
    cmp cmp dword ptr [g_1072D9BC], edi
    mov mov esi, 3
    jne L2
    cmp cmp dword ptr [g_1072D9C0], esi
    je L4
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L3
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L5
    call sub_1003A923
    push push 31
    call sub_1003A64A
    add add esp, 4
    mov mov eax, dword ptr [g_10730550]
    fld fld dword ptr [esp + 32]
    fmul fmul dword ptr [g_1019BCAC]
    imul imul eax, eax, 0CD0h
    fstp fstp dword ptr [esp + 32]
    fld fld qword ptr [g_1019BD80]
    fstp fstp qword ptr [esp + 16]
    lea lea esi, [eax + 01072DEE0h]
    lea lea edi, [eax + 01072EBB0h]
    mov mov ecx, 0334h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
L3:
    inc inc dword ptr [g_10730550]
L4:
    fld fld dword ptr [esp + 32]
    fadd fadd qword ptr [esp + 16]
L5:
    fistp fistp dword ptr [esp + 12]
    mov mov al, byte ptr [esp + 12]
    fld fld dword ptr [esp + 36]
    mov mov byte ptr [esp + 34], al
    fmul fmul dword ptr [g_1019BD58]
    mov mov byte ptr [esp + 33], al
    mov mov byte ptr [esp + 32], al
    mov mov byte ptr [esp + 35], 0FFh
    mov mov ecx, dword ptr [esp + 32]
    push push ecx
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 48]
    fmul fmul dword ptr [g_1019BF20]
    fstp fstp dword ptr [esp]
    call sub_1003B1A2
    add add esp, 12
    call sub_1003A9BA
    pop pop edi
    pop pop esi
    add add esp, 20
    jmp sub_1003E5A4
FUN_1003bbe0 ENDP
END
