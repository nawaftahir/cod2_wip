.686
.MODEL FLAT, C
EXTRN sub_1002E2B4:PROC
EXTRN sub_1002F45D:PROC
EXTRN sub_1002F4CC:PROC
EXTRN sub_1003A825:PROC
EXTRN sub_1003AAD8:PROC
EXTRN sub_1003AD15:PROC
EXTRN sub_1003E16F:PROC
EXTRN sub_1003E519:PROC
EXTRN sub_1003E5B2:PROC
EXTRN sub_1003E5F4:PROC
EXTRN sub_1003E769:PROC
EXTRN sub_1003E93F:PROC
EXTRN sub_1003EAD1:PROC
EXTRN sub_1003EBBA:PROC
EXTRN sub_1003EC54:PROC
EXTRN sub_1005A6D4:PROC
EXTRN g_101CE7BC:DWORD
EXTRN g_1072D9D0:DWORD
EXTRN g_1072D9E0:DWORD
EXTRN g_1072DDBC:DWORD
EXTRN g_1072DDC4:DWORD
EXTRN g_1072DDC8:DWORD
EXTRN g_1072DE40:DWORD
EXTRN g_1072DE44:DWORD
EXTRN g_10730550:DWORD
.CODE
FUN_1002f430 PROC
    sub esp, 52
    mov edx, dword ptr [esp + 56]
    push ebx
    push ebp
    push esi
    xor esi, esi
    mov dword ptr [esp + 52], edx
    mov edx, dword ptr [esp + 72]
    push edi
    xor edi, edi
    cmp edx, esi
    mov dword ptr [esp + 48], esi
    mov dword ptr [esp + 52], 31
    mov byte ptr [esp + 23], 0
    mov byte ptr [esp + 21], 1
    mov byte ptr [esp + 22], 1
    mov dword ptr [esp + 36], 0000007FEh
    mov dword ptr [esp + 28], esi
    mov dword ptr [esp + 44], 0FFFFFFFFh
    mov dword ptr [esp + 40], edi
    mov dword ptr [esp + 24], edi
    mov dword ptr [esp + 32], 07F7FFFFFh
    mov dword ptr [g_1072DE40], 01072DE48h
    mov dword ptr [g_1072DE44], esi
    jne L0
    mov dword ptr [esp + 76], eax
    mov eax, 1
    jmp L1
L0:
    lea eax, [eax + ecx*8 - 8]
    mov dword ptr [esp + 76], eax
    or eax, 0FFFFFFFFh
L1:
    cmp ecx, esi
    jle L39
    lea edx, [eax*8]
    mov dword ptr [esp + 60], ecx
    mov ecx, dword ptr [esp + 76]
    mov dword ptr [esp + 64], edx
    jmp L2
    lea ecx, [ecx]
L2:
    mov eax, dword ptr [ecx]
    cmp eax, dword ptr [esp + 44]
    jne L3
    mov al, byte ptr [esp + 23]
    test al, al
    jne L38
    mov eax, dword ptr [ecx + 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx*4 + 0x101904f8]
    add esp, 4
    jmp L38
L3:
    mov edx, eax
    and edx, 080000000h
    mov dword ptr [esp + 44], eax
    mov ebp, eax
    je L4
    shr ebp, 19
    jmp L5
L4:
    shr ebp, 4
L5:
    and ebp, 000000FFFh
    cmp ebp, 000000800h
    jl L6
    mov ebp, 0000007FEh
L6:
    cmp edx, esi
    mov ecx, eax
    je L7
    shr ecx, 9
    jmp L8
L7:
    shr ecx, 21
L8:
    and ecx, 0000003FFh
    cmp edx, esi
    mov edi, dword ptr [ecx*4 + 0101D0B08h]
    je L9
    shr eax, 4
    jmp L10
L9:
    shr eax, 16
L10:
    and eax, 31
    mov ebx, eax
    mov eax, dword ptr [esp + 72]
    mov ecx, ebp
    mov edx, ebx
    call sub_1002F45D
    mov edx, dword ptr [g_101CE7BC]
    mov esi, eax
    mov al, byte ptr [edx + 8]
    test al, al
    jne L11
    test byte ptr [edi + 48], 48
    jne L12
L11:
    cmp esi, -1
    je L12
    mov eax, dword ptr [edi + 56]
    mov ecx, dword ptr [eax + esi*4 + 4]
    test ecx, ecx
    je L12
    cmp ebp, dword ptr [esp + 36]
    mov edx, dword ptr [g_1072DDC4]
    mov byte ptr [esp + 23], 0
    jne L13
    mov cl, 1
    jmp L18
L12:
    mov byte ptr [esp + 23], 1
    jmp L37
L13:
    cmp ebp, 0000007FEh
    je L16
    cmp ebp, 0000007FFh
    je L16
    mov ecx, ebp
    imul ecx, ecx, 116
    mov eax, dword ptr [ecx + edx]
    mov cl, byte ptr [eax + 01019806Ch]
    test cl, cl
    jne L16
    mov byte ptr [esp + 22], 0
L14:
    xor cl, cl
L15:
    cmp ebp, 0000007FEh
    jne L17
    mov dword ptr [esp + 24], 0
    jmp L18
L16:
    mov al, byte ptr [esp + 21]
    test al, al
    mov byte ptr [esp + 22], 1
    je L14
    mov cl, 1
    jmp L15
L17:
    mov eax, ebp
    imul eax, eax, 116
    fld dword ptr [eax + edx + 92]
    fstp dword ptr [esp + 24]
L18:
    cmp edi, dword ptr [esp + 48]
    jne L19
    cmp ebx, dword ptr [esp + 52]
    jne L19
    cmp esi, dword ptr [esp + 56]
    jne L19
    fld dword ptr [esp + 32]
    fld dword ptr [esp + 24]
    fucompp
    fnstsw ax
    test ah, 68
    jp L19
    test cl, cl
    jne L23
L19:
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L20
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L21
L20:
    call sub_1003AAD8
L21:
    fld dword ptr [esp + 32]
    fld dword ptr [esp + 24]
    fucompp
    fnstsw ax
    test ah, 68
    jnp L22
    fld dword ptr [g_1072DDBC]
    push ecx
    fsub dword ptr [esp + 28]
    fstp dword ptr [esp]
    call sub_1002F4CC
    add esp, 4
L22:
    push ebx
    call sub_1003A825
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [g_1072DDC4]
    add esp, 4
    mov dword ptr [esp + 48], edi
    mov dword ptr [esp + 52], ebx
    mov dword ptr [esp + 56], esi
    mov dword ptr [esp + 32], ecx
L23:
    cmp ebp, dword ptr [esp + 36]
    je L36
    cmp ebp, 0000007FEh
    je L24
    cmp ebp, 0000007FFh
    je L24
    mov eax, ebp
    imul eax, eax, 116
    add eax, edx
    mov dword ptr [g_1072DE40], eax
    cmp dword ptr [eax], 1
    jg L25
    mov edx, ebp
    imul edx, edx, 104
    add edx, 0107305E8h
    mov dword ptr [g_1072DE44], edx
    jmp L26
L24:
    mov eax, 01072DE48h
    mov dword ptr [g_1072DE40], eax
L25:
    mov dword ptr [g_1072DE44], 0
L26:
    mov cl, byte ptr [esp + 22]
    test cl, cl
    je L28
    mov al, byte ptr [esp + 21]
    test al, al
    jne L27
    call sub_1003E769
L27:
    mov eax, dword ptr [esp + 28]
    test eax, eax
    je L35
    push 03F800000h
    push 0
    call sub_1003EAD1
    add esp, 8
    mov dword ptr [esp + 28], 0
    jmp L35
L28:
    mov cl, byte ptr [esp + 21]
    test cl, cl
    je L29
    mov eax, dword ptr [g_10730550]
    imul eax, eax, 000000CD0h
    lea esi, [eax + 01072DEE0h]
    lea edi, [eax + 01072EBB0h]
    mov ecx, 000000334h
    rep movsd dword ptr es:[edi], dword ptr [esi]
    inc dword ptr [g_10730550]
    mov eax, dword ptr [g_1072DE40]
L29:
    mov ecx, dword ptr [eax + 56]
    lea esi, [eax + 56]
    lea edx, [eax + 60]
    push ecx
    lea ecx, [eax + 20]
    mov eax, dword ptr [g_10730550]
    imul eax, eax, 000000CD0h
    add eax, 01072DEF0h
    call sub_1005A6D4
    mov edx, dword ptr [esi]
    add esp, 4
    push edx
    call sub_1003E16F
    mov eax, dword ptr [g_1072DE40]
    mov eax, dword ptr [eax + 4]
    mov edi, dword ptr [esp + 32]
    and eax, 24
    add esp, 4
    cmp edi, eax
    mov dword ptr [esp + 40], eax
    je L35
    mov eax, dword ptr [g_1072D9D0]
    test eax, eax
    jne L30
    mov eax, dword ptr [g_1072D9E0]
    test eax, eax
    je L31
L30:
    call sub_1002E2B4
L31:
    mov esi, dword ptr [esp + 40]
    cmp esi, 24
    ja L33
    movzx ecx, byte ptr [esi + 01002F8E4h]
    jmp dword ptr [ecx*4 + 0x1002f8d4]
    push 03F800000h
    jmp L32
    mov edx, dword ptr [g_1072DDC8]
    mov eax, dword ptr [edx + 000000148h]
    push eax
    call sub_1003E5F4
    add esp, 4
    push 03E4CCCCDh
    jmp L32
    push 03F000000h
L32:
    push 0
    call sub_1003EBBA
    add esp, 8
L33:
    cmp edi, 8
    jne L34
    mov edx, dword ptr [g_10730550]
    mov ecx, dword ptr [g_1072DDC8]
    imul edx, edx, 000000CD0h
    fld dword ptr [ecx + 0000000C0h]
    fchs
    fchs
    fstp dword ptr [edx + 01072E258h]
    call sub_1003E519
L34:
    mov dword ptr [esp + 28], esi
L35:
    mov al, byte ptr [esp + 22]
    mov byte ptr [esp + 21], al
    mov dword ptr [esp + 36], ebp
L36:
    mov ecx, dword ptr [esp + 76]
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx*4 + 0x101904f8]
    add esp, 4
L37:
    xor esi, esi
L38:
    mov ecx, dword ptr [esp + 76]
    mov edx, dword ptr [esp + 64]
    mov eax, dword ptr [esp + 60]
    add ecx, edx
    dec eax
    mov dword ptr [esp + 76], ecx
    mov dword ptr [esp + 60], eax
    jne L2
    mov edi, dword ptr [esp + 40]
L39:
    cmp dword ptr [g_1072D9D0], esi
    jne L40
    cmp dword ptr [g_1072D9E0], esi
    je L41
L40:
    call sub_1003AD15
L41:
    cmp edi, esi
    je L42
    push 03F800000h
    push esi
    call sub_1003EC54
    add esp, 8
    cmp edi, 8
    jne L42
    mov ecx, dword ptr [g_10730550]
    mov eax, dword ptr [g_1072DDC8]
    imul ecx, ecx, 000000CD0h
    fld dword ptr [eax + 0000000C0h]
    fchs
    fchs
    fstp dword ptr [ecx + 01072E258h]
    call sub_1003E5B2
L42:
    mov al, byte ptr [esp + 21]
    test al, al
    jne L43
    call sub_1003E93F
L43:
    pop edi
    mov dword ptr [g_1072DE40], esi
    mov dword ptr [g_1072DE44], esi
    pop esi
    pop ebp
    pop ebx
FUN_1002f430 ENDP
END
