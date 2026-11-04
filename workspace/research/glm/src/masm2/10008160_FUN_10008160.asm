.686
.MODEL FLAT, C
EXTRN sub_100064D3:PROC
EXTRN sub_100065FE:PROC
EXTRN sub_1000834F:PROC
EXTRN sub_1000839D:PROC
EXTRN sub_100083AE:PROC
EXTRN sub_100083B6:PROC
EXTRN sub_100083C8:PROC
EXTRN sub_10008435:PROC
EXTRN sub_1000843A:PROC
EXTRN sub_10008443:PROC
EXTRN sub_100084A0:PROC
EXTRN sub_100084B4:PROC
EXTRN sub_100084BF:PROC
EXTRN sub_100094EC:PROC
EXTRN sub_100096E6:PROC
EXTRN sub_10024453:PROC
EXTRN EXTRN g_101CE5EE:DWORD:DWORD
EXTRN EXTRN g_101D1B9C:DWORD:DWORD
EXTRN EXTRN g_101D7E98:DWORD:DWORD
EXTRN EXTRN g_10678500:DWORD:DWORD
.CODE
FUN_10008160 PROC
    mov mov eax, dword ptr [esp + 16]
    sub sub esp, 12
    push push ebx
    mov mov ebx, dword ptr [esp + 24]
    push push ebp
    mov mov ebp, dword ptr [esp + 24]
    push push esi
    mov mov esi, dword ptr [esp + 36]
    push push edi
    push push eax
    mov mov eax, esi
    mov mov ecx, ebx
    mov mov edi, ebp
    call sub_100064D3
    add add esp, 4
    test test al, al
    jne sub_1000834F
    mov mov edi, dword ptr [esp + 44]
    push push edi
    mov mov eax, esi
    mov mov ecx, ebx
    mov mov edx, ebp
    call sub_100065FE
    add add esp, 4
    test test al, al
    jne L6
    mov mov al, byte ptr [g_101CE5EE]
    test test al, al
    je L1
    mov mov eax, dword ptr [ebp + 32]
    xor xor esi, esi
    test test eax, eax
    jle L2
    jmp L0
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [ebp + 36]
    mov mov edx, dword ptr [ecx + esi*4]
    push push edx
    call sub_100094EC
    mov mov eax, dword ptr [ebp + 32]
    add add esp, 4
    inc inc esi
    cmp cmp esi, eax
    jl L3
    mov mov ecx, dword ptr [ebp + 24]
    test test ecx, ecx
    mov mov eax, dword ptr [ebp + 28]
    mov mov dword ptr [esp + 20], 0
    jle sub_100083AE
    mov mov ecx, dword ptr [g_10678500]
    lea lea ebx, [eax + eax*2]
    lea lea edi, [eax*4]
    mov mov eax, dword ptr [g_101D7E98]
    shl shl ebx, 2
    cmp cmp dword ptr [edi + eax], ecx
    je L7
    mov mov dword ptr [edi + eax], ecx
    mov mov eax, dword ptr [g_101D1B9C]
    mov mov eax, dword ptr [eax + 20]
    movzx movzx ecx, word ptr [eax + ebx + 6]
    mov mov edx, dword ptr [eax + ebx + 8]
    movzx movzx esi, word ptr [eax + ebx + 4]
    add add eax, ebx
    mov mov eax, dword ptr [eax]
    add add ecx, 0800h
    push push edx
    call sub_10024453
    mov mov eax, dword ptr [g_101D7E98]
    mov mov ecx, dword ptr [g_10678500]
    add add esp, 4
    mov mov edx, dword ptr [esp + 20]
    mov mov esi, dword ptr [ebp + 24]
    inc inc edx
    add add edi, 4
    add add ebx, 12
    cmp cmp edx, esi
    mov mov dword ptr [esp + 20], edx
    jl L8
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
    mov mov eax, dword ptr [ebp + 40]
    test test eax, eax
    je sub_100083B6
    mov mov dword ptr [esp + 20], 0
    jle sub_10008435
    inc inc edi
    mov mov dword ptr [esp + 24], edi
    xor xor edi, edi
    jmp sub_1000839D
L4:
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 24]
    mov mov ecx, dword ptr [ebp + 44]
    push push eax
    push push esi
    add add ecx, edi
    push push ebx
    push push ecx
    call L5
L5:
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [ebp + 40]
    add add esp, 16
    inc inc eax
    add add edi, 48
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 20], eax
    jl sub_100083C8
L6:
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 12
    ret ret
    mov mov al, byte ptr [g_101CE5EE]
    test test al, al
    je sub_1000843A
    mov mov eax, dword ptr [ebp + 32]
    xor xor edi, edi
    test test eax, eax
    jle sub_10008443
    mov mov eax, dword ptr [esp + 44]
    mov mov edx, dword ptr [ebp + 36]
    inc inc eax
    push push eax
    mov mov eax, dword ptr [edx + edi*4]
    push push esi
    push push ebx
    push push eax
    call sub_100096E6
    mov mov eax, dword ptr [ebp + 32]
    add add esp, 16
    inc inc edi
    cmp cmp edi, eax
    jl sub_10008443
    mov mov eax, dword ptr [ebp + 24]
    test test eax, eax
    mov mov edi, dword ptr [ebp + 28]
    mov mov dword ptr [esp + 20], 0
    jle sub_100084B4
    mov mov ecx, dword ptr [esp + 44]
    inc inc ecx
    mov mov dword ptr [esp + 24], ecx
L8:
    jmp sub_100084A0
    mov mov ebx, dword ptr [esp + 36]
    push push esi
    push push ebx
    mov mov ebx, dword ptr [esp + 32]
    call L4
    mov mov eax, dword ptr [esp + 28]
    mov mov ecx, dword ptr [ebp + 24]
    add add esp, 8
    inc inc eax
    inc inc edi
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 20], eax
    jl sub_100084BF
    pop pop edi
    pop pop esi
FUN_10008160 ENDP
END
