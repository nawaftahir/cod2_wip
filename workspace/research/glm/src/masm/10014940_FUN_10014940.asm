.686
.MODEL FLAT, C
EXTRN sub_10049EDD:PROC
EXTRN sub_1004A26C:PROC
EXTRN sub_1004A546:PROC
EXTRN sub_1004A5B0:PROC
EXTRN sub_1004A7FB:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D49D8:DWORD
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
EXTRN g_101D4C84:DWORD
.CODE
FUN_10014940 PROC
    sub esp, 000000250h
    push ebx
    push ebp
    mov ebx, eax
    push esi
    lea eax, [esp + 12]
    push eax
    push ebx
    call dword ptr [fp_101D4AFC]
    mov esi, eax
    mov eax, dword ptr [esp + 20]
    xor ebp, ebp
    add esp, 8
    cmp eax, ebp
    je L11
    lea ecx, [esp + 24]
    mov dword ptr [esp + 0000000A4h], ecx
    push edi
    mov ecx, 0000001B8h
    mov eax, 62
    lea edx, [esp + 0000000A8h]
    mov dword ptr [esp + 28], 010051F90h
    mov dword ptr [esp + 32], 010052010h
    mov dword ptr [esp + 36], 010051FD0h
    mov dword ptr [esp + 40], 010052050h
    mov dword ptr [esp + 44], 010052100h
    mov dword ptr [esp + 000000084h], ebp
    mov dword ptr [esp + 000000088h], ebp
    mov dword ptr [esp + 48], ebp
    mov dword ptr [esp + 00000008Ch], 010190EE8h
    mov dword ptr [esp + 000000090h], 123
    mov dword ptr [esp + 000000094h], ebp
    mov dword ptr [esp + 000000098h], ebp
    mov dword ptr [esp + 00000009Ch], ebp
    mov dword ptr [esp + 0000000A0h], 010014630h
    mov dword ptr [esp + 0000000A4h], 010014650h
    mov dword ptr [esp + 0000000C0h], 010014610h
    mov dword ptr [esp + 0000000C4h], 010014620h
    call sub_10049EDD
    mov eax, dword ptr [esp + 0000000C8h]
    cmp eax, ebp
    mov edi, dword ptr [esp + 16]
    jne L0
    mov eax, dword ptr [esp + 0000000ACh]
    push 32
    lea edx, [esp + 0000000ACh]
    push ebp
    push edx
    call dword ptr [eax]
    add esp, 12
    mov dword ptr [esp + 0000000C8h], eax
L0:
    mov dword ptr [eax + 4], esi
    push 1
    lea esi, [esp + 0000000ACh]
    mov dword ptr [eax + 8], 01004A950h
    mov dword ptr [eax + 12], ebp
    mov dword ptr [eax + 16], 01004A960h
    mov dword ptr [eax + 20], 01004F690h
    mov dword ptr [eax + 24], 01004A980h
    mov dword ptr [eax], edi
    call sub_1004A26C
    add esp, 4
    mov eax, esi
    call sub_1004A546
    mov ecx, dword ptr [esp + 00000010Ch]
    mov edx, dword ptr [g_101D4C84]
    cmp ecx, edx
    ja L7
    mov eax, dword ptr [esp + 000000110h]
    cmp eax, edx
    ja L7
    cmp dword ptr [esp + 000000118h], 3
    je L2
    push ebx
    push 0101941ACh
    push 2
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [esp + 0000000B8h]
    add esp, 12
    cmp eax, ebp
    je L1
    mov ecx, esi
    push ecx
    call dword ptr [eax + 0x28]
    add esp, 4
L1:
    mov edx, dword ptr [esp + 16]
    push edx
    jmp L9
L2:
    mov edx, dword ptr [esp + 00000026Ch]
    mov dword ptr [edx], ecx
    mov edx, dword ptr [esp + 000000270h]
    mov dword ptr [edx], eax
    imul eax, ecx
    mov edx, dword ptr [esp + 000000274h]
    shl eax, 2
    push eax
    mov dword ptr [edx], 21
    call dword ptr [fp_101D49D8]
    mov ecx, dword ptr [esp + 000000110h]
    mov edi, eax
    mov eax, dword ptr [esp + 00000026Ch]
    mov dword ptr [eax], edi
    mov eax, dword ptr [esp + 20]
    lea edx, [ecx*4]
    mov ecx, dword ptr [esp + 000000268h]
    mov dword ptr [esp + 24], edx
    mov edx, dword ptr [esp + 00000012Ch]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 000000114h]
    add esp, 4
    cmp edx, eax
    jae L6
    mov bl, 0000000FFh
L3:
    lea eax, [esp + 24]
    push 1
    push eax
    lea esi, [esp + 0000000B0h]
    mov dword ptr [esp + 32], edi
    call sub_1004A7FB
    mov eax, dword ptr [esp + 000000114h]
    add esp, 8
    dec eax
    cmp eax, ebp
    jl L5
    lea ecx, [edi + eax*4 + 2]
    mov edi, edi
L4:
    mov byte ptr [ecx + 1], bl
    mov edx, eax
    imul edx, dword ptr [esp + 000000118h]
    mov dl, byte ptr [edx + edi + 2]
    mov byte ptr [ecx], dl
    mov edx, eax
    imul edx, dword ptr [esp + 000000118h]
    mov dl, byte ptr [edx + edi + 1]
    mov byte ptr [ecx - 1], dl
    mov edx, eax
    imul edx, dword ptr [esp + 000000118h]
    mov dl, byte ptr [edx + edi]
    mov byte ptr [ecx - 2], dl
    dec eax
    sub ecx, 4
    cmp eax, ebp
    jge L4
L5:
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [esp + 000000128h]
    mov ecx, dword ptr [esp + 000000110h]
    add edi, edx
    cmp eax, ecx
    jb L3
L6:
    lea esi, [esp + 0000000A8h]
    call sub_1004A5B0
    mov eax, dword ptr [esp + 0000000ACh]
    cmp eax, ebp
    je L10
    mov ecx, esi
    push ecx
    call dword ptr [eax + 0x28]
    add esp, 4
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000250h
    ret
L7:
    push edx
    push ebx
    push 0101941D4h
    push 2
    call dword ptr [fp_101D49C8]
    mov eax, dword ptr [esp + 0000000BCh]
    add esp, 16
    cmp eax, ebp
    je L8
    lea edx, [esp + 0000000A8h]
    push edx
    call dword ptr [eax + 0x28]
    add esp, 4
L8:
    mov eax, dword ptr [esp + 16]
    push eax
L9:
    mov dword ptr [esp + 0000000C0h], ebp
    mov dword ptr [esp + 0000000B0h], ebp
    call dword ptr [fp_101D4B00]
    add esp, 4
L10:
    pop edi
L11:
    pop esi
    pop ebp
    pop ebx
    add esp, 000000250h
    ret
FUN_10014940 ENDP
END
