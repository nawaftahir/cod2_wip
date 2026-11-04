.686
.MODEL FLAT, C
EXTRN sub_100238DE:PROC
EXTRN sub_10061D92:PROC
EXTRN sub_10061DC1:PROC
EXTRN sub_10061DDB:PROC
EXTRN sub_10061E14:PROC
EXTRN sub_100F6391:PROC
EXTRN sub_100F883A:PROC
EXTRN fp_101D4B5C:DWORD
EXTRN fp_101D4BB4:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101DA9C8:DWORD
EXTRN g_1067850C:DWORD
.CODE
FUN_10023920 PROC
    mov eax, 000002028h
    call sub_100F883A
    mov ecx, dword ptr [g_1067850C]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [esp + 8], 010196E04h
    mov dword ptr [esp + 12], 010196DFCh
    mov dword ptr [esp + 16], 010196DF4h
    mov dword ptr [esp + 20], 010196DECh
    mov dword ptr [esp + 24], 010196DE4h
    mov dword ptr [esp + 28], 010196DD8h
    mov dword ptr [esp + 32], 010196DD0h
    mov dword ptr [esp + 36], 010196DC4h
    mov dword ptr [esp + 40], 010196DBCh
    mov dword ptr [esp + 44], 010196DB0h
    je L1
L0:
    mov dword ptr [esp + eax*4 + 48], eax
    inc eax
    cmp eax, ecx
    jne L0
L1:
    push 010023800h
    push 4
    push ecx
    lea eax, [esp + 60]
    push eax
    call sub_100F6391
    mov edx, dword ptr [g_1067850C]
    xor ecx, ecx
    add esp, 16
    test edx, edx
    mov dword ptr [esp], ecx
    je L12
    push ebx
    push ebp
    push esi
    push edi
    jmp L3
L2:
    mov ecx, dword ptr [esp + 16]
L3:
    mov eax, dword ptr [esp + ecx*4 + 64]
    mov esi, dword ptr [g_101DA9C8]
    lea ebp, [esp + ecx*4 + 64]
    mov edi, eax
    imul eax, eax, 116
    imul edi, edi, 52
    lea ebx, [eax + esi + 0000A0010h]
    lea esi, [ecx + 1]
    add edi, 010678AC4h
    cmp esi, edx
    je L6
    lea ecx, [esp + esi*4 + 64]
    mov dword ptr [esp + 20], ecx
L4:
    mov edx, dword ptr [esp + 20]
    push edx
    push ebp
    call sub_100238DE
    add esp, 8
    test eax, eax
    jne L5
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [g_1067850C]
    inc esi
    add ecx, 4
    cmp esi, eax
    mov dword ptr [esp + 20], ecx
    jne L4
L5:
    mov ecx, dword ptr [esp + 16]
L6:
    mov eax, dword ptr [ebx]
    sub esi, ecx
    mov ecx, dword ptr [esp + eax*4 + 24]
    push ecx
    push esi
    push 010196DA4h
    call sub_10061D92
    mov eax, dword ptr [ebx]
    add esp, 12
    cmp eax, 3
    ja L7
    jmp dword ptr [eax*4 + 0x10023adc]
    mov edi, dword ptr [edi + 4]
    push 0
    push edi
    call dword ptr [fp_101D4BB4]
    push eax
    call dword ptr [fp_101D4B5C]
    push eax
    push 010194210h
    call sub_10061DC1
    add esp, 20
    jmp L11
    mov edi, dword ptr [edi + 4]
    push edi
    call dword ptr [fp_101D4B5C]
    push eax
    push 010194210h
    call sub_10061DDB
    add esp, 12
    jmp L11
    mov eax, dword ptr [g_101D1B9C]
    mov edx, dword ptr [edi + 4]
    sub edx, dword ptr [eax + 000000138h]
    sar edx, 5
    push edx
    push 010196D9Ch
    jmp L10
L7:
    mov ebx, dword ptr [ebx + 84]
    test ebx, ebx
    je L8
    mov ebx, dword ptr [ebx]
    jmp L9
L8:
    mov ebx, 010196D94h
L9:
    push ebx
    push 010194210h
L10:
    call sub_10061E14
    add esp, 8
L11:
    mov eax, dword ptr [esp + 16]
    mov edx, dword ptr [g_1067850C]
    add eax, esi
    cmp eax, edx
    mov dword ptr [esp + 16], eax
    jne L2
    pop edi
    pop esi
    pop ebp
    pop ebx
L12:
    add esp, 000002028h
    ret
FUN_10023920 ENDP
END
