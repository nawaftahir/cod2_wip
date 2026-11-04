.686
.MODEL FLAT, C
.CODE
FUN_1004bca0 PROC
    push ecx
    mov eax, dword ptr [esp + 8]
    push ebp
    mov ebp, dword ptr [eax + 44]
    push edi
    mov edi, dword ptr [eax + 100]
    mov eax, dword ptr [esp + 32]
    dec eax
    mov dword ptr [esp + 8], edi
    js L5
    mov edx, dword ptr [esp + 24]
    shl edx, 2
    inc eax
    push ebx
    mov dword ptr [esp + 20], eax
    push esi
L0:
    xor esi, esi
    test ebp, ebp
    jle L4
    lea esp, [esp]
L1:
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [eax + esi*4]
    mov eax, dword ptr [esp + 36]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edx + ecx]
    add eax, esi
    test edi, edi
    jbe L3
L2:
    mov bl, byte ptr [ecx]
    mov byte ptr [eax], bl
    inc ecx
    add eax, ebp
    dec edi
    jne L2
    mov edi, dword ptr [esp + 16]
L3:
    inc esi
    cmp esi, ebp
    jl L1
L4:
    mov ecx, dword ptr [esp + 36]
    mov eax, dword ptr [esp + 24]
    add ecx, 4
    add edx, 4
    dec eax
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 24], eax
    jne L0
    pop esi
    pop ebx
L5:
    pop edi
    pop ebp
    pop ecx
    ret
FUN_1004bca0 ENDP
END
