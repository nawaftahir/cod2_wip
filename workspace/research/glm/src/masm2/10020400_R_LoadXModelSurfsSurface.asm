.686
.MODEL FLAT, C
EXTRN sub_100171E1:PROC
EXTRN sub_1002056A:PROC
EXTRN sub_10020571:PROC
EXTRN sub_10020573:PROC
EXTRN sub_1002058C:PROC
EXTRN sub_10020592:PROC
EXTRN sub_100205A5:PROC
EXTRN sub_100205BA:PROC
EXTRN sub_1010A858:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN fp_101D4B3C:DWORD:DWORD
EXTRN EXTRN fp_101D4B48:DWORD:DWORD
EXTRN EXTRN fp_101D4B58:DWORD:DWORD
EXTRN EXTRN g_101D1B2C:DWORD:DWORD
.CODE
R_LoadXModelSurfsSurface PROC
    sub sub esp, 88
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 100]
    push push esi
    push push edi
    push push ebp
    call dword ptr [fp_101D4B48]
    mov mov ebx, eax
    add add esp, 4
    xor xor edi, edi
    xor xor esi, esi
    test test ebx, ebx
    mov mov dword ptr [esp + 20], ebx
    jle L0
    lea lea eax, [esp + 24]
    push push eax
    push push esi
    lea lea ecx, [esp + 36]
    push push ecx
    push push ebp
    call dword ptr [fp_101D4B3C]
    add add esp, 16
    add add edi, eax
    inc inc esi
    cmp cmp esi, ebx
    jl L0
    add add edi, ebx
    shl shl edi, 2
    push push edi
    call dword ptr [fp_101D49D4]
    mov mov ecx, dword ptr [esp + 24]
    lea lea esi, [eax + ebx*4]
    add add esp, 4
    xor xor ebx, ebx
    test test ecx, ecx
    mov mov dword ptr [esp + 36], eax
    jle sub_10020571
    mov mov dword ptr [esp + 16], eax
    jmp L1
    mov mov esi, dword ptr [esp + 32]
    lea lea ecx, [ecx]
    lea lea edx, [esp + 24]
    push push edx
    push push ebx
    lea lea eax, [esp + 36]
    push push eax
    push push ebp
    call dword ptr [fp_101D4B3C]
    mov mov ecx, dword ptr [esp + 32]
    mov mov edi, eax
    lea lea edx, [esi + edi*4]
    mov mov dword ptr [ecx], esi
    add add esp, 16
    xor xor esi, esi
    test test edi, edi
    mov mov dword ptr [esp + 32], edx
    jle sub_1002058C
    lea lea ebx, [ebx]
    push push ebx
    push push esi
    push push ebp
    call dword ptr [fp_101D4B58]
    add add esp, 12
    lea lea edx, [esp + 40]
    mov mov cl, byte ptr [eax]
    inc inc eax
    mov mov byte ptr [edx], cl
    inc inc edx
    test test cl, cl
    jne sub_1002056A
    lea lea eax, [esp + 40]
    push push eax
    call sub_1010A858
    mov mov al, byte ptr [esp + 44]
    add add esp, 4
    test test al, al
    jne sub_100205A5
    mov mov eax, dword ptr [g_101D1B2C]
    jmp sub_100205BA
    push push 8
    lea lea eax, [esp + 44]
    call sub_100171E1
    add add esp, 4
    mov mov ecx, dword ptr [esp + 16]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [edx + esi*4], eax
    inc inc esi
    cmp cmp esi, edi
    jl sub_10020592
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 20]
    inc inc ebx
    add add ecx, 4
    cmp cmp ebx, eax
    mov mov dword ptr [esp + 16], ecx
    jl sub_10020573
    mov mov eax, dword ptr [esp + 36]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 88
    ret ret
R_LoadXModelSurfsSurface ENDP
END
