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
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_1019BD8C:DWORD:DWORD
EXTRN EXTRN g_1072D9B0:DWORD:DWORD
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
EXTRN EXTRN g_1072D9C0:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9D4:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DEBD:DWORD:DWORD
.CODE
FUN_1002ec00 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 44
    mov mov al, byte ptr [g_1072DEBD]
    test test al, al
    push push ebx
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    mov mov ebx, dword ptr [edi]
    jne L0
    call sub_1002E03F
    mov mov eax, dword ptr [ebx + 4]
    cmp cmp dword ptr [g_1072D9BC], eax
    mov mov dword ptr [esp + 36], eax
    mov mov esi, 3
    jne L1
    cmp cmp dword ptr [g_1072D9C0], esi
L0:
    je L3
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L2
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je L4
    call sub_1003A922
    mov mov edi, dword ptr [esp + 36]
    push push 31
    call sub_1003A64D
    mov mov edi, dword ptr [ebp + 8]
    add add esp, 4
    mov mov eax, dword ptr [g_1072D9D4]
    add add eax, 4
    cmp cmp eax, 0154Ah
    jg L5
    mov mov ecx, dword ptr [g_1072D9D0]
    add add ecx, 6
    cmp cmp ecx, 0100000h
    jle L6
    call sub_1002DFC8
    mov mov ecx, dword ptr [g_1072D9D4]
    mov mov esi, dword ptr [g_1072D9D0]
    mov mov eax, esi
    mov mov edx, ecx
    add add ecx, 4
    mov mov dword ptr [g_1072D9D4], ecx
    add add esi, 6
    mov mov dword ptr [g_1072D9D0], esi
    mov mov esi, dword ptr [g_1072D9B0]
    lea lea ecx, [edx + 3]
    mov mov word ptr [esi + eax*2], cx
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov word ptr [ecx + eax*2 + 2], dx
    mov mov esi, dword ptr [g_1072D9B0]
    lea lea ecx, [edx + 2]
    mov mov word ptr [esi + eax*2 + 4], cx
    mov mov esi, dword ptr [g_1072D9B0]
    mov mov word ptr [esi + eax*2 + 6], cx
    mov mov ecx, dword ptr [g_1072D9B0]
    mov mov word ptr [ecx + eax*2 + 8], dx
    mov mov esi, dword ptr [g_1072D9B0]
    lea lea ecx, [edx + 1]
    mov mov word ptr [esi + eax*2 + 10], cx
    fld fld dword ptr [ebx + 16]
    fmul fmul dword ptr [g_1019BCB0]
    lea lea eax, [esp + 20]
    lea lea ecx, [esp + 16]
    mov mov dword ptr [esp + 44], eax
    fstp fstp dword ptr [esp + 24]
    mov mov dword ptr [esp + 40], ecx
    fld fld dword ptr [ebx + 20]
    fmul fmul dword ptr [g_1019BCB0]
    fstp fstp dword ptr [esp + 28]
    fld fld dword ptr [esp + 24]
    fadd fadd dword ptr [ebx + 8]
    fstp fstp dword ptr [esp + 36]
    fld fld dword ptr [esp + 28]
    fadd fadd dword ptr [ebx + 12]
    fstp fstp dword ptr [esp + 32]
    fld fld dword ptr [ebx + 44]
    fmul fmul dword ptr [g_1019BD8C]
    fstp fstp dword ptr [esp + 48]
    push push eax
    push push ecx
    fld fld dword ptr [esp + 56]
    fsincos fsincos
    mov mov ecx, dword ptr [esp + 52]
    mov mov eax, dword ptr [esp + 48]
    fstp fstp dword ptr [ecx]
    fstp fstp dword ptr [eax]
    pop pop ecx
    pop pop eax
    fld fld dword ptr [esp + 20]
    fmul fmul dword ptr [esp + 24]
    mov mov eax, dword ptr [ebx + 24]
    fld fld dword ptr [esp + 16]
    mov mov ecx, dword ptr [ebx + 40]
    fmul fmul dword ptr [esp + 24]
    movzx movzx esi, dx
    fld fld dword ptr [esp + 16]
    mov mov edx, dword ptr [ebx + 28]
    fmul fmul dword ptr [esp + 28]
    push push edx
    push push eax
    sub sub esp, 8
    fchs fchs
    mov mov eax, esi
    fstp fstp dword ptr [esp + 64]
    fld fld dword ptr [esp + 36]
    fmul fmul dword ptr [esp + 44]
    fstp fstp dword ptr [esp + 68]
    fld fld dword ptr [esp + 48]
    fsub fsub st(1)
    fstp fstp dword ptr [esp + 44]
    fld fld dword ptr [esp + 52]
    fsub fsub st(2)
    fstp fstp dword ptr [esp + 40]
    fld fld dword ptr [esp + 44]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [esp + 4]
    fld fld dword ptr [esp + 40]
    fsub fsub dword ptr [esp + 64]
    fstp fstp dword ptr [esp]
    call sub_1002E634
    mov mov ecx, dword ptr [ebx + 28]
    mov mov edx, dword ptr [ebx + 32]
    add add esp, 16
    push push ecx
    push push edx
    fld fld dword ptr [esp + 40]
    mov mov ecx, dword ptr [ebx + 40]
    fadd fadd st(1)
    sub sub esp, 8
    lea lea eax, [esi + 1]
    fsub fsub dword ptr [esp + 68]
    fstp fstp dword ptr [esp + 4]
    fld fld st(1)
    fadd fadd dword ptr [esp + 52]
    fsub fsub dword ptr [esp + 64]
    fstp fstp dword ptr [esp]
    call sub_1002E668
    mov mov eax, dword ptr [ebx + 36]
    fld fld dword ptr [esp + 68]
    mov mov ecx, dword ptr [ebx + 32]
    fadd fadd st(1)
    add add esp, 16
    push push eax
    fadd fadd dword ptr [esp + 36]
    push push ecx
    mov mov ecx, dword ptr [ebx + 40]
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    lea lea eax, [esi + 2]
    fstp fstp st(0)
    fld fld dword ptr [esp + 64]
    fadd fadd st(1)
    fadd fadd dword ptr [esp + 52]
    fstp fstp dword ptr [esp]
    fstp fstp st(0)
    call sub_1002E6A0
    mov mov edx, dword ptr [ebx + 36]
    fld fld dword ptr [esp + 44]
    mov mov eax, dword ptr [ebx + 24]
    fadd fadd dword ptr [esp + 68]
    mov mov ecx, dword ptr [ebx + 40]
    add add esp, 16
    push push edx
    push push eax
    sub sub esp, 8
    fstp fstp dword ptr [esp + 4]
    lea lea eax, [esi + 3]
    fld fld dword ptr [esp + 40]
    fadd fadd dword ptr [esp + 64]
    fstp fstp dword ptr [esp]
    call sub_1002E6D0
    mov mov eax, dword ptr [edi]
    movzx movzx ecx, word ptr [eax + 2]
    add add esp, 16
    add add ecx, eax
    mov mov dword ptr [edi], ecx
    pop pop edi
    pop pop esi
    pop pop ebx
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_1002ec00 ENDP
END
