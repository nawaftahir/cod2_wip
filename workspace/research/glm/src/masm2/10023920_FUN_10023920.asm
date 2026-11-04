.686
.MODEL FLAT, C
EXTRN sub_100238DE:PROC
EXTRN sub_10023AE9:PROC
EXTRN sub_10023AED:PROC
EXTRN sub_10023AFF:PROC
EXTRN sub_10023B6A:PROC
EXTRN sub_10023B6C:PROC
EXTRN sub_10023BB5:PROC
EXTRN sub_10023BFD:PROC
EXTRN sub_10023C17:PROC
EXTRN sub_10023C24:PROC
EXTRN sub_10023C28:PROC
EXTRN sub_10023C2D:PROC
EXTRN sub_10061D92:PROC
EXTRN sub_10061DC1:PROC
EXTRN sub_10061DDB:PROC
EXTRN sub_10061E14:PROC
EXTRN sub_100F6391:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN fp_101D4B5C:DWORD:DWORD
EXTRN EXTRN fp_101D4BB4:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_1067850C:DWORD:DWORD
.CODE
FUN_10023920 PROC
    mov mov eax, 02028h
    call sub_100F883A
    mov mov ecx, dword ptr [g_1067850C]
    xor xor eax, eax
    test test ecx, ecx
    mov mov dword ptr [esp + 8], 010196E04h
    mov mov dword ptr [esp + 12], 010196DFCh
    mov mov dword ptr [esp + 16], 010196DF4h
    mov mov dword ptr [esp + 20], 010196DECh
    mov mov dword ptr [esp + 24], 010196DE4h
    mov mov dword ptr [esp + 28], 010196DD8h
    mov mov dword ptr [esp + 32], 010196DD0h
    mov mov dword ptr [esp + 36], 010196DC4h
    mov mov dword ptr [esp + 40], 010196DBCh
    mov mov dword ptr [esp + 44], 010196DB0h
    je L0
    mov mov dword ptr [esp + eax*4 + 48], eax
    inc inc eax
    cmp cmp eax, ecx
    jne L0
    push push 010023800h
    push push 4
    push push ecx
    lea lea eax, [esp + 60]
    push push eax
    call sub_100F6391
    mov mov edx, dword ptr [g_1067850C]
    xor xor ecx, ecx
    add add esp, 16
    test test edx, edx
    mov mov dword ptr [esp], ecx
    je sub_10023B6A
    push push ebx
    push push ebp
    push push esi
    push push edi
    jmp L1
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + ecx*4 + 64]
    mov mov esi, dword ptr [g_101DA9C8]
    lea lea ebp, [esp + ecx*4 + 64]
    mov mov edi, eax
    imul imul eax, eax, 116
    imul imul edi, edi, 52
    lea lea ebx, [eax + esi + 0A0010h]
    lea lea esi, [ecx + 1]
    add add edi, 010678AC4h
    cmp cmp esi, edx
    je sub_10023AE9
    lea lea ecx, [esp + esi*4 + 64]
    mov mov dword ptr [esp + 20], ecx
    mov mov edx, dword ptr [esp + 20]
    push push edx
    push push ebp
    call sub_100238DE
    add add esp, 8
    test test eax, eax
    jne sub_10023AFF
    mov mov ecx, dword ptr [esp + 20]
    mov mov eax, dword ptr [g_1067850C]
    inc inc esi
    add add ecx, 4
    cmp cmp esi, eax
    mov mov dword ptr [esp + 20], ecx
    jne sub_10023AED
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [ebx]
    sub sub esi, ecx
    mov mov ecx, dword ptr [esp + eax*4 + 24]
    push push ecx
    push push esi
    push push 010196DA4h
    call sub_10061D92
    mov mov eax, dword ptr [ebx]
    add add esp, 12
    cmp cmp eax, 3
    ja sub_10023BB5
    jmp jmp dword ptr [eax*4 + 010023ADCh]
    mov mov edi, dword ptr [edi + 4]
    push push 0
    push push edi
    call dword ptr [fp_101D4BB4]
    push push eax
    call dword ptr [fp_101D4B5C]
    push push eax
    push push 010194210h
    call sub_10061DC1
    add add esp, 20
    jmp sub_10023BFD
    mov mov edi, dword ptr [edi + 4]
    push push edi
    call dword ptr [fp_101D4B5C]
    push push eax
    push push 010194210h
    call sub_10061DDB
    add add esp, 12
    jmp sub_10023C17
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov edx, dword ptr [edi + 4]
    sub sub edx, dword ptr [eax + 0138h]
    sar sar edx, 5
    push push edx
    push push 010196D9Ch
    jmp sub_10023C28
    mov mov ebx, dword ptr [ebx + 84]
    test test ebx, ebx
    je sub_10023C24
    mov mov ebx, dword ptr [ebx]
    jmp sub_10023C2D
    mov mov ebx, 010196D94h
    push push ebx
    push push 010194210h
    call sub_10061E14
    add add esp, 8
    mov mov eax, dword ptr [esp + 16]
    mov mov edx, dword ptr [g_1067850C]
    add add eax, esi
    cmp cmp eax, edx
    mov mov dword ptr [esp + 16], eax
    jne sub_10023B6C
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 02028h
    ret ret
FUN_10023920 ENDP
END
