.686
.MODEL FLAT, C
EXTRN sub_1002DFC8:PROC
EXTRN sub_1002E03F:PROC
EXTRN sub_1002E634:PROC
EXTRN sub_1002E668:PROC
EXTRN sub_1002E6A0:PROC
EXTRN sub_1002E6D0:PROC
EXTRN sub_1003A64D:PROC
EXTRN sub_1003A922:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_1019BD8C:DWORD
EXTRN g_1072D9B0:DWORD
EXTRN g_1072D9BC:DWORD
EXTRN g_1072D9C0:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9D4:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DEBD:DWORD
.CODE
FUN_1002ec00 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 44
    mov al, byte ptr [g_1072DEBD]
    test al, al
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, dword ptr [edi]
    jne L0
    call sub_1002E03F
L0:
    mov eax, dword ptr [ebx + 4]
    cmp dword ptr [g_1072D9BC], eax
    mov dword ptr [esp + 36], eax
    mov esi, 3
    jne L1
    cmp dword ptr [g_1072D9C0], esi
    je L4
L1:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L2
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L3
L2:
    call sub_1003A922
L3:
    mov edi, dword ptr [esp + 36]
    push 31
    call sub_1003A64D
    mov edi, dword ptr [ebp + 8]
    add esp, 4
L4:
    mov eax, dword ptr [g_1072D9D4]
    add eax, 4
    cmp eax, 00000154Ah
    jg L5
    mov ecx, dword ptr [g_1072D9D0]
    add ecx, 6
    cmp ecx, 000100000h
    jle L6
L5:
    call sub_1002DFC8
L6:
    mov ecx, dword ptr [g_1072D9D4]
    mov esi, dword ptr [g_1072D9D0]
    mov eax, esi
    mov edx, ecx
    add ecx, 4
    mov dword ptr [g_1072D9D4], ecx
    add esi, 6
    mov dword ptr [g_1072D9D0], esi
    mov esi, dword ptr [g_1072D9B0]
    lea ecx, [edx + 3]
    mov word ptr [esi + eax*2], cx
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + eax*2 + 2], dx
    mov esi, dword ptr [g_1072D9B0]
    lea ecx, [edx + 2]
    mov word ptr [esi + eax*2 + 4], cx
    mov esi, dword ptr [g_1072D9B0]
    mov word ptr [esi + eax*2 + 6], cx
    mov ecx, dword ptr [g_1072D9B0]
    mov word ptr [ecx + eax*2 + 8], dx
    mov esi, dword ptr [g_1072D9B0]
    lea ecx, [edx + 1]
    mov word ptr [esi + eax*2 + 10], cx
    fld dword ptr [ebx + 16]
    fmul dword ptr [g_1019BCB0]
    lea eax, [esp + 20]
    lea ecx, [esp + 16]
    mov dword ptr [esp + 44], eax
    fstp dword ptr [esp + 24]
    mov dword ptr [esp + 40], ecx
    fld dword ptr [ebx + 20]
    fmul dword ptr [g_1019BCB0]
    fstp dword ptr [esp + 28]
    fld dword ptr [esp + 24]
    fadd dword ptr [ebx + 8]
    fstp dword ptr [esp + 36]
    fld dword ptr [esp + 28]
    fadd dword ptr [ebx + 12]
    fstp dword ptr [esp + 32]
    fld dword ptr [ebx + 44]
    fmul dword ptr [g_1019BD8C]
    fstp dword ptr [esp + 48]
    push eax
    push ecx
    fld dword ptr [esp + 56]
    fsincos
    mov ecx, dword ptr [esp + 52]
    mov eax, dword ptr [esp + 48]
    fstp dword ptr [ecx]
    fstp dword ptr [eax]
    pop ecx
    pop eax
    fld dword ptr [esp + 20]
    fmul dword ptr [esp + 24]
    mov eax, dword ptr [ebx + 24]
    fld dword ptr [esp + 16]
    mov ecx, dword ptr [ebx + 40]
    fmul dword ptr [esp + 24]
    movzx esi, dx
    fld dword ptr [esp + 16]
    mov edx, dword ptr [ebx + 28]
    fmul dword ptr [esp + 28]
    push edx
    push eax
    sub esp, 8
    fchs
    mov eax, esi
    fstp dword ptr [esp + 64]
    fld dword ptr [esp + 36]
    fmul dword ptr [esp + 44]
    fstp dword ptr [esp + 68]
    fld dword ptr [esp + 48]
    fsub st(1)
    fstp dword ptr [esp + 44]
    fld dword ptr [esp + 52]
    fsub st(2)
    fstp dword ptr [esp + 40]
    fld dword ptr [esp + 44]
    fsub dword ptr [esp + 68]
    fstp dword ptr [esp + 4]
    fld dword ptr [esp + 40]
    fsub dword ptr [esp + 64]
    fstp dword ptr [esp]
    call sub_1002E634
    mov ecx, dword ptr [ebx + 28]
    mov edx, dword ptr [ebx + 32]
    add esp, 16
    push ecx
    push edx
    fld dword ptr [esp + 40]
    mov ecx, dword ptr [ebx + 40]
    fadd st(1)
    sub esp, 8
    lea eax, [esi + 1]
    fsub dword ptr [esp + 68]
    fstp dword ptr [esp + 4]
    fld st(1)
    fadd dword ptr [esp + 52]
    fsub dword ptr [esp + 64]
    fstp dword ptr [esp]
    call sub_1002E668
    mov eax, dword ptr [ebx + 36]
    fld dword ptr [esp + 68]
    mov ecx, dword ptr [ebx + 32]
    fadd st(1)
    add esp, 16
    push eax
    fadd dword ptr [esp + 36]
    push ecx
    mov ecx, dword ptr [ebx + 40]
    sub esp, 8
    fstp dword ptr [esp + 4]
    lea eax, [esi + 2]
    fstp st(0)
    fld dword ptr [esp + 64]
    fadd st(1)
    fadd dword ptr [esp + 52]
    fstp dword ptr [esp]
    fstp st(0)
    call sub_1002E6A0
    mov edx, dword ptr [ebx + 36]
    fld dword ptr [esp + 44]
    mov eax, dword ptr [ebx + 24]
    fadd dword ptr [esp + 68]
    mov ecx, dword ptr [ebx + 40]
    add esp, 16
    push edx
    push eax
    sub esp, 8
    fstp dword ptr [esp + 4]
    lea eax, [esi + 3]
    fld dword ptr [esp + 40]
    fadd dword ptr [esp + 64]
    fstp dword ptr [esp]
    call sub_1002E6D0
    mov eax, dword ptr [edi]
    movzx ecx, word ptr [eax + 2]
    add esp, 16
    add ecx, eax
    mov dword ptr [edi], ecx
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
FUN_1002ec00 ENDP
END
