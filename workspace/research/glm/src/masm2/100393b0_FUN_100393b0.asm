.686
.MODEL FLAT, C
EXTRN sub_10038D98:PROC
EXTRN sub_100391FA:PROC
EXTRN sub_10039496:PROC
EXTRN sub_1003949E:PROC
EXTRN sub_100394AF:PROC
EXTRN sub_100394B3:PROC
EXTRN sub_100394BB:PROC
EXTRN sub_100394D0:PROC
EXTRN sub_100394DC:PROC
EXTRN sub_1003950A:PROC
EXTRN sub_1003952F:PROC
EXTRN EXTRN g_1072D9BC:DWORD:DWORD
.CODE
FUN_100393b0 PROC
    push push ecx
    test test eax, eax
    push push esi
    mov mov esi, ecx
    jle sub_1003949E
    push push ebx
    push push ebp
    mov mov dword ptr [esp + 12], eax
    mov mov ebx, dword ptr [esp + 12]
    push push edi
    mov mov edi, dword ptr [esp + 16]
    jmp L0
    lea lea ecx, [ecx]
    movzx movzx eax, word ptr [esi]
    sub sub eax, 0
    je sub_10039496
    dec dec eax
    je L1
    dec dec eax
    jne sub_100394B3
    mov mov ecx, dword ptr [g_1072D9BC]
    movzx movzx edx, word ptr [ecx + 54]
    mov mov ebp, dword ptr [esi + 4]
    xor xor eax, eax
    test test edx, edx
    jle L3
    mov mov ecx, dword ptr [ecx + 64]
    lea lea esp, [esp]
    cmp cmp ebp, dword ptr [ecx]
    je L4
    inc inc eax
    add add ecx, 20
    cmp cmp eax, edx
    jl L2
    push push ebx
    push push edi
    jmp sub_100394D0
    lea lea edi, [ecx + 4]
    mov mov ebx, 1
    push push ebx
    push push edi
    jmp sub_100394DC
    mov mov ax, word ptr [esi + 4]
    cmp cmp ax, 0BBh
    jae sub_100394BB
    movzx movzx ebx, byte ptr [esi + 7]
    movzx movzx ecx, word ptr [esi + 2]
    movzx movzx edi, ax
    sub sub edi, 080h
    shl shl edi, 4
    push push ebx
    add add edi, 01072DA00h
    push push edi
    push push ecx
    jmp sub_1003950A
    movzx movzx ecx, byte ptr [esi + 7]
    movzx movzx edx, byte ptr [esi + 6]
    push push ecx
    movzx movzx eax, ax
    push push edx
    push push eax
    call sub_10038D98
    movzx movzx ebx, byte ptr [esi + 7]
L2:
    movzx movzx ecx, word ptr [esi + 2]
    add add esp, 12
    push push ebx
L4:
    mov mov edi, eax
    push push edi
    push push ecx
    jmp sub_1003952F
    mov mov edx, dword ptr [esi + 4]
    push push 1
    push push edx
    movzx movzx eax, word ptr [esi + 2]
    push push eax
    call sub_100391FA
    add add esp, 12
    mov mov eax, dword ptr [esp + 16]
    add add esi, 8
    dec dec eax
    mov mov dword ptr [esp + 16], eax
    jne sub_100394AF
    pop pop edi
    pop pop ebp
    pop pop ebx
FUN_100393b0 ENDP
END
