.686
.MODEL FLAT, C
EXTRN sub_100171E1:PROC
EXTRN sub_1010A858:PROC
EXTRN fp_101D49D4:DWORD
EXTRN fp_101D4B3C:DWORD
EXTRN fp_101D4B48:DWORD
EXTRN fp_101D4B58:DWORD
EXTRN g_101D1B2C:DWORD
.CODE
R_LoadXModelSurfsSurface PROC
    sub esp, 88
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 100]
    push esi
    push edi
    push ebp
    call dword ptr [fp_101D4B48]
    mov ebx, eax
    add esp, 4
    xor edi, edi
    xor esi, esi
    test ebx, ebx
    mov dword ptr [esp + 20], ebx
    jle L1
L0:
    lea eax, [esp + 24]
    push eax
    push esi
    lea ecx, [esp + 36]
    push ecx
    push ebp
    call dword ptr [fp_101D4B3C]
    add esp, 16
    add edi, eax
    inc esi
    cmp esi, ebx
    jl L0
L1:
    add edi, ebx
    shl edi, 2
    push edi
    call dword ptr [fp_101D49D4]
    mov ecx, dword ptr [esp + 24]
    lea esi, [eax + ebx*4]
    add esp, 4
    xor ebx, ebx
    test ecx, ecx
    mov dword ptr [esp + 36], eax
    jle L9
    mov dword ptr [esp + 16], eax
    jmp L3
L2:
    mov esi, dword ptr [esp + 32]
    lea ecx, [ecx]
L3:
    lea edx, [esp + 24]
    push edx
    push ebx
    lea eax, [esp + 36]
    push eax
    push ebp
    call dword ptr [fp_101D4B3C]
    mov ecx, dword ptr [esp + 32]
    mov edi, eax
    lea edx, [esi + edi*4]
    mov dword ptr [ecx], esi
    add esp, 16
    xor esi, esi
    test edi, edi
    mov dword ptr [esp + 32], edx
    jle L8
    lea ebx, [ebx]
L4:
    push ebx
    push esi
    push ebp
    call dword ptr [fp_101D4B58]
    add esp, 12
    lea edx, [esp + 40]
L5:
    mov cl, byte ptr [eax]
    inc eax
    mov byte ptr [edx], cl
    inc edx
    test cl, cl
    jne L5
    lea eax, [esp + 40]
    push eax
    call sub_1010A858
    mov al, byte ptr [esp + 44]
    add esp, 4
    test al, al
    jne L6
    mov eax, dword ptr [g_101D1B2C]
    jmp L7
L6:
    push 8
    lea eax, [esp + 44]
    call sub_100171E1
    add esp, 4
L7:
    mov ecx, dword ptr [esp + 16]
    mov edx, dword ptr [ecx]
    mov dword ptr [edx + esi*4], eax
    inc esi
    cmp esi, edi
    jl L4
L8:
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 20]
    inc ebx
    add ecx, 4
    cmp ebx, eax
    mov dword ptr [esp + 16], ecx
    jl L2
    mov eax, dword ptr [esp + 36]
L9:
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 88
    ret
R_LoadXModelSurfsSurface ENDP
END
