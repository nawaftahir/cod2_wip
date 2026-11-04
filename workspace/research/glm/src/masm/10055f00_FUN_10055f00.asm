.686
.MODEL FLAT, C
.CODE
FUN_10055f00 PROC
    sub esp, 16
    mov ecx, dword ptr [esp + 20]
    mov eax, dword ptr [ecx + 0000001B0h]
    mov eax, dword ptr [eax + 24]
    mov edx, dword ptr [eax + 4]
    push esi
    mov esi, dword ptr [ecx + 100]
    push edi
    mov edi, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    mov dword ptr [esp + 12], eax
    mov eax, dword ptr [esp + 40]
    test eax, eax
    mov dword ptr [esp + 8], edx
    mov dword ptr [esp + 16], esi
    jle L3
    mov ecx, dword ptr [esp + 36]
    push ebx
    mov ebx, dword ptr [esp + 36]
    sub ebx, ecx
    push ebp
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 28], ebx
    mov dword ptr [esp + 48], eax
    lea esp, [esp]
L0:
    test esi, esi
    mov eax, dword ptr [ebx + ecx]
    mov edx, dword ptr [ecx]
    jbe L2
    lea esp, [esp]
L1:
    movzx ecx, byte ptr [eax]
    movzx ebx, byte ptr [eax + 1]
    mov ebp, dword ptr [esp + 16]
    movzx ebx, byte ptr [ebx + ebp]
    movzx ecx, byte ptr [ecx + edi]
    mov ebp, dword ptr [esp + 20]
    inc eax
    add ecx, ebx
    movzx ebx, byte ptr [eax + 1]
    movzx ebx, byte ptr [ebx + ebp]
    inc eax
    add ecx, ebx
    inc eax
    mov byte ptr [edx], cl
    inc edx
    dec esi
    jne L1
    mov esi, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 36]
    mov ebx, dword ptr [esp + 28]
L2:
    mov eax, dword ptr [esp + 48]
    add ecx, 4
    dec eax
    mov dword ptr [esp + 36], ecx
    mov dword ptr [esp + 48], eax
    jne L0
    pop ebp
    pop ebx
L3:
    pop edi
    pop esi
    add esp, 16
    ret
FUN_10055f00 ENDP
END
