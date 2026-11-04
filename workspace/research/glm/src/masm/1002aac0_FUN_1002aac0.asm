.686
.MODEL FLAT, C
.CODE
FUN_1002aac0 PROC
L0:
    mov ecx, dword ptr [esp + 16]
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 24]
    push edi
    mov edi, dword ptr [esp + 24]
    cmp word ptr [edi + esi*4 + 12], 0
    je L2
    mov ebx, dword ptr [esp + 20]
    lea esp, [esp]
L1:
    mov al, byte ptr [edi + esi*4 + 14]
    test al, al
    mov word ptr [edi + esi*4 + 12], 0
    jne L3
    lea ebp, [ecx - 1]
    push ebp
    lea eax, [esi + esi + 1]
    push eax
    push edi
    push ebx
    call L0
    lea esi, [esi + esi + 2]
    add esp, 16
    cmp word ptr [edi + esi*4 + 12], 0
    mov ecx, ebp
    jne L1
L2:
    inc esi
    shl esi, cl
    shl esi, 4
    mov ecx, dword ptr [esi + edi - 116]
    mov edx, dword ptr [esi + edi - 120]
    lea eax, [esi + edi - 120]
    pop edi
    mov dword ptr [ecx], edx
    mov ecx, dword ptr [eax]
    mov edx, dword ptr [eax + 4]
    pop esi
    pop ebp
    mov dword ptr [ecx + 4], edx
    pop ebx
    ret
L3:
    lea eax, [esi + 1]
    shl eax, cl
    shl eax, 4
    mov ebp, dword ptr [eax + edi - 108]
    lea edx, [eax + edi - 120]
    xor eax, eax
L4:
    cmp dword ptr [ebp + eax*4], edx
    je L5
    inc eax
    cmp eax, 4
    jb L4
    jmp L6
L5:
    mov dword ptr [ebp + eax*4], 0
L6:
    add ecx, 5
    or eax, 0FFFFFFFFh
    shl eax, cl
    mov ecx, dword ptr [ebx + 00000C430h]
    add ecx, eax
    mov eax, dword ptr [ebx + 00000C434h]
    mov dword ptr [ebx + 00000C430h], ecx
    mov ecx, dword ptr [edx + 8]
    movsx edx, word ptr [ecx + 2]
    sub eax, edx
    mov dword ptr [ebx + 00000C434h], eax
    mov byte ptr [edi + esi*4 + 14], 0
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1002aac0 ENDP
END
