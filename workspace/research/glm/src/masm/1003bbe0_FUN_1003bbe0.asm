.686
.MODEL FLAT, C
EXTRN sub_1003A64A:PROC
EXTRN sub_1003A8EC:PROC
EXTRN sub_1003A923:PROC
EXTRN sub_1003A9BA:PROC
EXTRN sub_1003B1A2:PROC
EXTRN sub_1003E5A4:PROC
EXTRN g_1019BCAC:DWORD
EXTRN g_1019BD58:DWORD
EXTRN g_1019BD80:DWORD
EXTRN g_1019BF20:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_10730550:DWORD
.CODE
FUN_1003bbe0 PROC
    mov eax, dword ptr [g_1072D9D0]
    sub esp, 20
    test eax, eax
    push esi
    push edi
    jne L0
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L1
L0:
    call sub_1003A8EC
L1:
    mov eax, dword ptr [g_101D1B9C]
    mov edi, dword ptr [eax + 000000168h]
    cmp dword ptr [g_1072D9BC], edi
    mov esi, 3
    jne L2
    cmp dword ptr [g_1072D9C0], esi
    je L5
L2:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L3
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L4
L3:
    call sub_1003A923
L4:
    push 31
    call sub_1003A64A
    add esp, 4
L5:
    mov eax, dword ptr [g_10730550]
    fld dword ptr [esp + 32]
    fmul dword ptr [g_1019BCAC]
    imul eax, eax, 000000CD0h
    fstp dword ptr [esp + 32]
    fld qword ptr [g_1019BD80]
    fstp qword ptr [esp + 16]
    lea esi, [eax + 01072DEE0h]
    lea edi, [eax + 01072EBB0h]
    mov ecx, 000000334h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    inc dword ptr [g_10730550]
    fld dword ptr [esp + 32]
    fadd qword ptr [esp + 16]
    fistp dword ptr [esp + 12]
    mov al, byte ptr [esp + 12]
    fld dword ptr [esp + 36]
    mov byte ptr [esp + 34], al
    fmul dword ptr [g_1019BD58]
    mov byte ptr [esp + 33], al
    mov byte ptr [esp + 32], al
    mov byte ptr [esp + 35], 0000000FFh
    mov ecx, dword ptr [esp + 32]
    push ecx
    sub esp, 8
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 48]
    fmul dword ptr [g_1019BF20]
    fstp dword ptr [esp]
    call sub_1003B1A2
    add esp, 12
    call sub_1003A9BA
    pop edi
    pop esi
    add esp, 20
    jmp sub_1003E5A4
FUN_1003bbe0 ENDP
END
