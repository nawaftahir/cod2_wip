.686
.MODEL FLAT, C
EXTRN sub_100479C5:PROC
EXTRN sub_10047B7E:PROC
EXTRN sub_10047D85:PROC
EXTRN sub_10047D8B:PROC
EXTRN sub_10047DFC:PROC
EXTRN sub_10047E07:PROC
EXTRN sub_10047E0E:PROC
.CODE
FUN_10047c30 PROC
    push push ebx
    mov mov bl, byte ptr [esp + 8]
    push push esi
    push push edi
    mov mov esi, eax
    call sub_10047B7E
    mov mov al, byte ptr [esi + 12]
    test test al, al
    jne L2
    push push 127
    mov mov eax, 7
    call sub_100479C5
    xor xor eax, eax
    mov mov dword ptr [esi + 24], eax
    mov mov dword ptr [esi + 28], eax
    mov mov eax, dword ptr [esi + 16]
    mov mov byte ptr [eax], 0FFh
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [esi + 20]
    add add esp, 4
    inc inc ecx
    dec dec eax
    mov mov dword ptr [esi + 16], ecx
    mov mov dword ptr [esi + 20], eax
    jne L0
    mov mov eax, dword ptr [esi + 32]
    mov mov edi, dword ptr [eax + 32]
    push push eax
    call call dword ptr [edi + 12]
    add add esp, 4
    test test al, al
    jne L1
    mov mov ecx, dword ptr [esi + 32]
    mov mov edx, dword ptr [ecx]
    mov mov dword ptr [edx + 20], 24
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx]
    add add esp, 4
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [esi + 16], edx
    mov mov eax, dword ptr [edi + 4]
    mov mov dword ptr [esi + 20], eax
    mov mov ecx, dword ptr [esi + 16]
    sub sub bl, 48
    mov mov byte ptr [ecx], bl
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [esi + 20]
    inc inc ecx
    dec dec eax
    mov mov dword ptr [esi + 16], ecx
    mov mov dword ptr [esi + 20], eax
    jne sub_10047D85
    mov mov eax, dword ptr [esi + 32]
    mov mov edi, dword ptr [eax + 32]
    push push eax
    call call dword ptr [edi + 12]
    add add esp, 4
    test test al, al
    jne sub_10047D8B
    mov mov edx, dword ptr [esi + 32]
    mov mov eax, dword ptr [edx]
    mov mov dword ptr [eax + 20], 24
    mov mov eax, dword ptr [esi + 32]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx]
    add add esp, 4
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [esi + 16], edx
    mov mov eax, dword ptr [edi + 4]
    mov mov dword ptr [esi + 20], eax
    mov mov ecx, dword ptr [esi + 32]
    mov mov eax, dword ptr [ecx + 0134h]
    xor xor edx, edx
    cmp cmp eax, edx
    jne sub_10047DFC
    mov mov edi, dword ptr [ecx + 0ECh]
    xor xor eax, eax
    cmp cmp edi, edx
L2:
    jle sub_10047E0E
    lea lea ecx, [esi + 36]
    mov mov dword ptr [ecx], edx
    mov mov edi, dword ptr [esi + 32]
    mov mov ebx, dword ptr [edi + 0ECh]
    inc inc eax
    add add ecx, 4
    cmp cmp eax, ebx
    jl sub_10047E07
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    mov mov dword ptr [esi + 56], edx
    mov mov dword ptr [esi + 60], edx
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10047c30 ENDP
END
