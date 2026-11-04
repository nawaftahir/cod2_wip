.686
.MODEL FLAT, C
EXTRN sub_1002E2B4:PROC
EXTRN sub_1002F8E8:PROC
EXTRN sub_1002F8F3:PROC
EXTRN sub_1002F8FC:PROC
EXTRN sub_1002F908:PROC
EXTRN sub_1002F924:PROC
EXTRN sub_1002F92C:PROC
EXTRN sub_1002F947:PROC
EXTRN sub_1002F964:PROC
EXTRN sub_1002F99D:PROC
EXTRN sub_1002F9AE:PROC
EXTRN sub_1002F9BD:PROC
EXTRN sub_1002FA2B:PROC
EXTRN sub_1002FA85:PROC
EXTRN sub_1002FAE2:PROC
EXTRN sub_1002FAFE:PROC
EXTRN sub_1002FB05:PROC
EXTRN sub_1002FB13:PROC
EXTRN sub_1002FB6A:PROC
EXTRN sub_1002FB75:PROC
EXTRN sub_1002FB7A:PROC
EXTRN sub_1002FB91:PROC
EXTRN sub_1002FBDB:PROC
EXTRN sub_1002FCA8:PROC
EXTRN sub_1002FCB5:PROC
EXTRN sub_1002FCFB:PROC
EXTRN sub_1002FD0E:PROC
EXTRN sub_1002FD49:PROC
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
EXTRN EXTRN g_101CE7BC:DWORD:DWORD
EXTRN EXTRN g_1072D9D0:DWORD:DWORD
EXTRN EXTRN g_1072D9E0:DWORD:DWORD
EXTRN EXTRN g_1072DDBC:DWORD:DWORD
EXTRN EXTRN g_1072DDC4:DWORD:DWORD
EXTRN EXTRN g_1072DDC8:DWORD:DWORD
EXTRN EXTRN g_1072DE40:DWORD:DWORD
EXTRN EXTRN g_1072DE44:DWORD:DWORD
EXTRN EXTRN g_10730550:DWORD:DWORD
.CODE
FUN_1002f430 PROC
    sub sub esp, 52
    mov mov edx, dword ptr [esp + 56]
    push push ebx
    push push ebp
    push push esi
    xor xor esi, esi
    mov mov dword ptr [esp + 52], edx
    mov mov edx, dword ptr [esp + 72]
    push push edi
    xor xor edi, edi
    cmp cmp edx, esi
    mov mov dword ptr [esp + 48], esi
    mov mov dword ptr [esp + 52], 31
    mov mov byte ptr [esp + 23], 0
    mov mov byte ptr [esp + 21], 1
    mov mov byte ptr [esp + 22], 1
    mov mov dword ptr [esp + 36], 07FEh
    mov mov dword ptr [esp + 28], esi
    mov mov dword ptr [esp + 44], -1
    mov mov dword ptr [esp + 40], edi
    mov mov dword ptr [esp + 24], edi
    mov mov dword ptr [esp + 32], 07F7FFFFFh
    mov mov dword ptr [g_1072DE40], 01072DE48h
    mov mov dword ptr [g_1072DE44], esi
    jne L2
    mov mov dword ptr [esp + 76], eax
    mov mov eax, 1
    jmp L3
    lea lea eax, [eax + ecx*8 - 8]
    mov mov dword ptr [esp + 76], eax
    or or eax, -1
    cmp cmp ecx, esi
    jle sub_1002F8E8
    lea lea edx, [eax*8]
    mov mov dword ptr [esp + 60], ecx
    mov mov ecx, dword ptr [esp + 76]
    mov mov dword ptr [esp + 64], edx
    jmp L4
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [ecx]
    cmp cmp eax, dword ptr [esp + 44]
    jne L5
    mov mov al, byte ptr [esp + 23]
    test test al, al
    jne sub_1002F8F3
    mov mov eax, dword ptr [ecx + 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx*4 + 0101904F8h]
    add add esp, 4
    jmp sub_1002F908
    mov mov edx, eax
    and and edx, 080000000h
    mov mov dword ptr [esp + 44], eax
    mov mov ebp, eax
    je L6
    shr shr ebp, 19
    jmp L7
    shr shr ebp, 4
    and and ebp, 0FFFh
    cmp cmp ebp, 0800h
    jl L8
    mov mov ebp, 07FEh
    cmp cmp edx, esi
    mov mov ecx, eax
    je L9
    shr shr ecx, 9
    jmp L10
    shr shr ecx, 21
    and and ecx, 03FFh
    cmp cmp edx, esi
    mov mov edi, dword ptr [ecx*4 + 0101D0B08h]
    je L11
    shr shr eax, 4
    jmp L12
    shr shr eax, 16
    and and eax, 31
    mov mov ebx, eax
    mov mov eax, dword ptr [esp + 72]
    mov mov ecx, ebp
    mov mov edx, ebx
    call L0
    mov mov edx, dword ptr [g_101CE7BC]
    mov mov esi, eax
    mov mov al, byte ptr [edx + 8]
    test test al, al
    jne L13
    test test byte ptr [edi + 48], 48
    jne L14
    cmp cmp esi, -1
    je L15
    mov mov eax, dword ptr [edi + 56]
    mov mov ecx, dword ptr [eax + esi*4 + 4]
    test test ecx, ecx
    je L16
    cmp cmp ebp, dword ptr [esp + 36]
    mov mov edx, dword ptr [g_1072DDC4]
    mov mov byte ptr [esp + 23], 0
    jne L17
    mov mov cl, 1
    jmp L20
    mov mov byte ptr [esp + 23], 1
    jmp sub_1002F9AE
L5:
    cmp cmp ebp, 07FEh
    je L18
    cmp cmp ebp, 07FFh
    je L19
    mov mov ecx, ebp
    imul imul ecx, ecx, 116
    mov mov eax, dword ptr [ecx + edx]
    mov mov cl, byte ptr [eax + 01019806Ch]
    test test cl, cl
    jne L21
    mov mov byte ptr [esp + 22], 0
    xor xor cl, cl
    cmp cmp ebp, 07FEh
    jne L24
    mov mov dword ptr [esp + 24], 0
    jmp L25
    mov mov al, byte ptr [esp + 21]
    test test al, al
    mov mov byte ptr [esp + 22], 1
L6:
    je L22
    mov mov cl, 1
    jmp L23
    mov mov eax, ebp
L7:
    imul imul eax, eax, 116
    fld fld dword ptr [eax + edx + 92]
    fstp fstp dword ptr [esp + 24]
    cmp cmp edi, dword ptr [esp + 48]
    jne L26
    cmp cmp ebx, dword ptr [esp + 52]
    jne L27
    cmp cmp esi, dword ptr [esp + 56]
    jne L28
    fld fld dword ptr [esp + 32]
    fld fld dword ptr [esp + 24]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jp L29
    test test cl, cl
    jne L32
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne L30
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
L10:
    je L31
    call sub_1003AAD8
    fld fld dword ptr [esp + 32]
    fld fld dword ptr [esp + 24]
    fucompp fucompp
    fnstsw fnstsw ax
    test test ah, 68
    jnp L33
    fld fld dword ptr [g_1072DDBC]
    push push ecx
    fsub fsub dword ptr [esp + 28]
    fstp fstp dword ptr [esp]
    call L1
    add add esp, 4
    push push ebx
    call sub_1003A825
    mov mov ecx, dword ptr [esp + 28]
    mov mov edx, dword ptr [g_1072DDC4]
    add add esp, 4
    mov mov dword ptr [esp + 48], edi
    mov mov dword ptr [esp + 52], ebx
    mov mov dword ptr [esp + 56], esi
    mov mov dword ptr [esp + 32], ecx
    cmp cmp ebp, dword ptr [esp + 36]
    je sub_1002FA85
    cmp cmp ebp, 07FEh
    je sub_1002F924
    cmp cmp ebp, 07FFh
    je sub_1002F92C
    mov mov eax, ebp
    imul imul eax, eax, 116
    add add eax, edx
    mov mov dword ptr [g_1072DE40], eax
    cmp cmp dword ptr [eax], 1
    jg sub_1002F947
    mov mov edx, ebp
    imul imul edx, edx, 104
    add add edx, 0107305E8h
    mov mov dword ptr [g_1072DE44], edx
    jmp sub_1002F964
    mov mov eax, 01072DE48h
    mov mov dword ptr [g_1072DE40], eax
    mov mov dword ptr [g_1072DE44], 0
    mov mov cl, byte ptr [esp + 22]
    test test cl, cl
    je sub_1002F9BD
    mov mov al, byte ptr [esp + 21]
    test test al, al
    jne sub_1002F99D
    call sub_1003E769
L16:
    mov mov eax, dword ptr [esp + 28]
    test test eax, eax
    je sub_1002FAE2
    push push 03F800000h
    push push 0
    call sub_1003EAD1
    add add esp, 8
L17:
    mov mov dword ptr [esp + 28], 0
    jmp sub_1002FAFE
    mov mov cl, byte ptr [esp + 21]
    test test cl, cl
    je sub_1002FA2B
    mov mov eax, dword ptr [g_10730550]
    imul imul eax, eax, 0CD0h
    lea lea esi, [eax + 01072DEE0h]
    lea lea edi, [eax + 01072EBB0h]
    mov mov ecx, 0334h
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    inc inc dword ptr [g_10730550]
    mov mov eax, dword ptr [g_1072DE40]
    mov mov ecx, dword ptr [eax + 56]
    lea lea esi, [eax + 56]
    lea lea edx, [eax + 60]
    push push ecx
    lea lea ecx, [eax + 20]
    mov mov eax, dword ptr [g_10730550]
    imul imul eax, eax, 0CD0h
    add add eax, 01072DEF0h
    call sub_1005A6D4
    mov mov edx, dword ptr [esi]
    add add esp, 4
    push push edx
    call sub_1003E16F
L21:
    mov mov eax, dword ptr [g_1072DE40]
    mov mov eax, dword ptr [eax + 4]
    mov mov edi, dword ptr [esp + 32]
    and and eax, 24
    add add esp, 4
L22:
    cmp cmp edi, eax
    mov mov dword ptr [esp + 40], eax
L23:
    je sub_1002FB7A
    mov mov eax, dword ptr [g_1072D9D0]
    test test eax, eax
    jne sub_1002FB05
    mov mov eax, dword ptr [g_1072D9E0]
    test test eax, eax
    je sub_1002FB13
    call sub_1002E2B4
    mov mov esi, dword ptr [esp + 40]
    cmp cmp esi, 24
    ja sub_1002FB6A
    movzx movzx ecx, byte ptr [esi + 01002F8E4h]
    jmp jmp dword ptr [ecx*4 + 01002F8D4h]
    push push 03F800000h
    jmp sub_1002FB75
    mov mov edx, dword ptr [g_1072DDC8]
    mov mov eax, dword ptr [edx + 0148h]
    push push eax
    call sub_1003E5F4
    add add esp, 4
    push push 03E4CCCCDh
    jmp sub_1002FB91
    push push 03F000000h
    push push 0
    call sub_1003EBBA
    add add esp, 8
    cmp cmp edi, 8
    jne sub_1002FBDB
    mov mov edx, dword ptr [g_10730550]
    mov mov ecx, dword ptr [g_1072DDC8]
    imul imul edx, edx, 0CD0h
    fld fld dword ptr [ecx + 0C0h]
    fchs fchs
    fchs fchs
L29:
    fstp fstp dword ptr [edx + 01072E258h]
    call sub_1003E519
    mov mov dword ptr [esp + 28], esi
    mov mov al, byte ptr [esp + 22]
    mov mov byte ptr [esp + 21], al
    mov mov dword ptr [esp + 36], ebp
    mov mov ecx, dword ptr [esp + 76]
L30:
    mov mov eax, dword ptr [ecx + 4]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx*4 + 0101904F8h]
    add add esp, 4
    xor xor esi, esi
    mov mov ecx, dword ptr [esp + 76]
    mov mov edx, dword ptr [esp + 64]
    mov mov eax, dword ptr [esp + 60]
    add add ecx, edx
    dec dec eax
    mov mov dword ptr [esp + 76], ecx
    mov mov dword ptr [esp + 60], eax
    jne sub_1002F8FC
    mov mov edi, dword ptr [esp + 40]
    cmp cmp dword ptr [g_1072D9D0], esi
    jne sub_1002FCA8
    cmp cmp dword ptr [g_1072D9E0], esi
    je sub_1002FCB5
    call sub_1003AD15
    cmp cmp edi, esi
    je sub_1002FCFB
    push push 03F800000h
    push push esi
    call sub_1003EC54
    add add esp, 8
    cmp cmp edi, 8
    jne sub_1002FD0E
    mov mov ecx, dword ptr [g_10730550]
    mov mov eax, dword ptr [g_1072DDC8]
    imul imul ecx, ecx, 0CD0h
    fld fld dword ptr [eax + 0C0h]
    fchs fchs
    fchs fchs
    fstp fstp dword ptr [ecx + 01072E258h]
    call sub_1003E5B2
    mov mov al, byte ptr [esp + 21]
    test test al, al
    jne sub_1002FD49
    call sub_1003E93F
    pop pop edi
    mov mov dword ptr [g_1072DE40], esi
    mov mov dword ptr [g_1072DE44], esi
    pop pop esi
    pop pop ebp
    pop pop ebx
FUN_1002f430 ENDP
END
