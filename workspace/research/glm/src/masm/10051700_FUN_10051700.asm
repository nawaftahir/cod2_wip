.686
.MODEL FLAT, C
.CODE
FUN_10051700 PROC
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 20]
    mov ebx, dword ptr [edi + 0000001A8h]
    mov eax, dword ptr [ebx + 92]
    cmp eax, dword ptr [edi + 00000011Ch]
    jl L2
    mov eax, dword ptr [edi + 44]
    mov ecx, dword ptr [edi + 0000000CCh]
    xor ebp, ebp
    test eax, eax
    mov dword ptr [esp + 20], ecx
    jle L1
    lea esi, [ebx + 12]
    nop
L0:
    mov edx, dword ptr [esi + 88]
    mov eax, dword ptr [esp + 28]
    imul edx, dword ptr [eax]
    mov ecx, dword ptr [esp + 24]
    mov eax, dword ptr [ecx + ebp*4]
    push esi
    lea ecx, [eax + edx*4]
    mov edx, dword ptr [esp + 24]
    push ecx
    push edx
    push edi
    call dword ptr [esi + 0x28]
    mov ecx, dword ptr [esp + 36]
    mov eax, dword ptr [edi + 44]
    add esp, 16
    inc ebp
    add ecx, 84
    add esi, 4
    cmp ebp, eax
    mov dword ptr [esp + 20], ecx
    jl L0
L1:
    mov dword ptr [ebx + 92], 0
L2:
    mov esi, dword ptr [edi + 00000011Ch]
    mov edx, dword ptr [ebx + 92]
    mov eax, dword ptr [ebx + 96]
    sub esi, edx
    cmp esi, eax
    jbe L3
    mov esi, eax
L3:
    mov ebp, dword ptr [esp + 40]
    mov eax, dword ptr [ebp]
    mov ecx, dword ptr [esp + 44]
    sub ecx, eax
    cmp esi, ecx
    jbe L4
    mov esi, ecx
L4:
    mov edx, dword ptr [esp + 36]
    mov ecx, dword ptr [edi + 0000001ACh]
    push esi
    lea eax, [edx + eax*4]
    mov edx, dword ptr [ebx + 92]
    push eax
    push edx
    lea eax, [ebx + 12]
    push eax
    push edi
    call dword ptr [ecx + 4]
    add dword ptr [ebp], esi
    mov edx, dword ptr [ebx + 96]
    mov ecx, dword ptr [ebx + 92]
    add ecx, esi
    add esp, 20
    sub edx, esi
    mov dword ptr [ebx + 96], edx
    mov dword ptr [ebx + 92], ecx
    mov eax, dword ptr [edi + 00000011Ch]
    pop edi
    pop esi
    mov ebx, ecx
    pop ebp
    cmp ebx, eax
    pop ebx
    jl L5
    mov eax, dword ptr [esp + 12]
    inc dword ptr [eax]
L5:
    ret
FUN_10051700 ENDP
END
