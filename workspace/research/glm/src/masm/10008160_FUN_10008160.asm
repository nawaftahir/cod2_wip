.686
.MODEL FLAT, C
EXTRN sub_100064D3:PROC
EXTRN sub_100065FE:PROC
EXTRN sub_1000827D:PROC
EXTRN sub_100094EC:PROC
EXTRN sub_100096E6:PROC
EXTRN sub_10024453:PROC
EXTRN g_101CE5EE:DWORD
EXTRN g_101D1B9C:DWORD
EXTRN g_101D7E98:DWORD
EXTRN g_10678500:DWORD
.CODE
FUN_10008160 PROC
L0:
    mov eax, dword ptr [esp + 16]
    sub esp, 12
    push ebx
    mov ebx, dword ptr [esp + 24]
    push ebp
    mov ebp, dword ptr [esp + 24]
    push esi
    mov esi, dword ptr [esp + 36]
    push edi
    push eax
    mov eax, esi
    mov ecx, ebx
    mov edi, ebp
    call sub_100064D3
    add esp, 4
    test al, al
    jne L12
    mov edi, dword ptr [esp + 44]
    push edi
    mov eax, esi
    mov ecx, ebx
    mov edx, ebp
    call sub_100065FE
    add esp, 4
    test al, al
    jne L5
    mov al, byte ptr [g_101CE5EE]
    test al, al
    je L2
    mov eax, dword ptr [ebp + 32]
    xor esi, esi
    test eax, eax
    jle L2
    jmp L1
    lea ecx, [ecx]
L1:
    mov ecx, dword ptr [ebp + 36]
    mov edx, dword ptr [ecx + esi*4]
    push edx
    call sub_100094EC
    mov eax, dword ptr [ebp + 32]
    add esp, 4
    inc esi
    cmp esi, eax
    jl L1
L2:
    mov ecx, dword ptr [ebp + 24]
    test ecx, ecx
    mov eax, dword ptr [ebp + 28]
    mov dword ptr [esp + 20], 0
    jle L12
    mov ecx, dword ptr [g_10678500]
    lea ebx, [eax + eax*2]
    lea edi, [eax*4]
    mov eax, dword ptr [g_101D7E98]
    shl ebx, 2
L3:
    cmp dword ptr [edi + eax], ecx
    je L4
    mov dword ptr [edi + eax], ecx
    mov eax, dword ptr [g_101D1B9C]
    mov eax, dword ptr [eax + 20]
    movzx ecx, word ptr [eax + ebx + 6]
    mov edx, dword ptr [eax + ebx + 8]
    movzx esi, word ptr [eax + ebx + 4]
    add eax, ebx
    mov eax, dword ptr [eax]
    add ecx, 000000800h
    push edx
    call sub_10024453
    mov eax, dword ptr [g_101D7E98]
    mov ecx, dword ptr [g_10678500]
    add esp, 4
L4:
    mov edx, dword ptr [esp + 20]
    mov esi, dword ptr [ebp + 24]
    inc edx
    add edi, 4
    add ebx, 12
    cmp edx, esi
    mov dword ptr [esp + 20], edx
    jl L3
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
L5:
    mov eax, dword ptr [ebp + 40]
    test eax, eax
    je L7
    mov dword ptr [esp + 20], 0
    jle L12
    inc edi
    mov dword ptr [esp + 24], edi
    xor edi, edi
    jmp L6
    lea ecx, [ecx]
L6:
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [ebp + 44]
    push eax
    push esi
    add ecx, edi
    push ebx
    push ecx
    call L0
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [ebp + 40]
    add esp, 16
    inc eax
    add edi, 48
    cmp eax, ecx
    mov dword ptr [esp + 20], eax
    jl L6
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 12
    ret
L7:
    mov al, byte ptr [g_101CE5EE]
    test al, al
    je L9
    mov eax, dword ptr [ebp + 32]
    xor edi, edi
    test eax, eax
    jle L9
L8:
    mov eax, dword ptr [esp + 44]
    mov edx, dword ptr [ebp + 36]
    inc eax
    push eax
    mov eax, dword ptr [edx + edi*4]
    push esi
    push ebx
    push eax
    call sub_100096E6
    mov eax, dword ptr [ebp + 32]
    add esp, 16
    inc edi
    cmp edi, eax
    jl L8
L9:
    mov eax, dword ptr [ebp + 24]
    test eax, eax
    mov edi, dword ptr [ebp + 28]
    mov dword ptr [esp + 20], 0
    jle L12
    mov ecx, dword ptr [esp + 44]
    inc ecx
    mov dword ptr [esp + 24], ecx
    jmp L11
L10:
    mov ebx, dword ptr [esp + 36]
L11:
    push esi
    push ebx
    mov ebx, dword ptr [esp + 32]
    call sub_1000827D
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [ebp + 24]
    add esp, 8
    inc eax
    inc edi
    cmp eax, ecx
    mov dword ptr [esp + 20], eax
    jl L10
L12:
    pop edi
    pop esi
FUN_10008160 ENDP
END
