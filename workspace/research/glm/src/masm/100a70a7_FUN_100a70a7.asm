.686
.MODEL FLAT, C
.CODE
FUN_100a70a7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    mov edx, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [edx + 8]
    mov edx, dword ptr [edx + 28]
    mov eax, dword ptr [ecx + 20]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 72]
    cmp edx, -1
    jne L0
    xor eax, eax
    inc eax
    leave
    ret
L0:
    push esi
    mov esi, dword ptr [ecx + 24]
    push edi
    mov edi, dword ptr [esi + edx*4]
    mov edx, dword ptr [edi]
    and edx, 0FFF00000h
    cmp edx, 010000000h
    je L1
    xor eax, eax
    inc eax
    jmp L11
L1:
    mov edx, dword ptr [ecx + 000000100h]
    or dword ptr [ebp - 16], 0FFFFFFFFh
    push ebx
    mov ebx, dword ptr [edx + 8]
    mov edx, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + edx*4]
    mov dword ptr [ebp - 12], edx
    mov edx, dword ptr [eax + 72]
    cmp edx, -1
    mov dword ptr [ebp - 8], ebx
    je L4
    cmp dword ptr [eax + 60], 0
    jne L4
    mov eax, dword ptr [esi + edx*4]
    mov edx, dword ptr [eax]
    and edx, 0FFF00000h
    cmp edx, 010000000h
    jne L4
    and dword ptr [ebp - 4], 0
    cmp dword ptr [eax + 4], 0
    jbe L4
    mov esi, dword ptr [eax + 16]
L2:
    mov edx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebp - 12]
    shl edx, 2
    cmp dword ptr [esi + edx], ebx
    jne L3
    mov ebx, dword ptr [eax + 8]
    mov edx, dword ptr [edx + ebx]
    mov dword ptr [ebp - 16], edx
L3:
    inc dword ptr [ebp - 4]
    mov edx, dword ptr [ebp - 4]
    cmp edx, dword ptr [eax + 4]
    jb L2
    mov ebx, dword ptr [ebp - 8]
L4:
    mov eax, dword ptr [edi + 4]
    and dword ptr [ebp - 8], 0
    and dword ptr [ebp - 4], 0
    test eax, eax
    jbe L8
L5:
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [edi + 8]
    shl edx, 2
    mov eax, dword ptr [eax + edx]
    cmp eax, dword ptr [ebp - 12]
    jne L6
    mov esi, dword ptr [edi + 16]
    mov esi, dword ptr [edx + esi]
    cmp esi, dword ptr [ebx + 28]
    jne L6
    mov dword ptr [ebp - 8], 1
L6:
    cmp eax, dword ptr [ebp - 16]
    jne L7
    mov eax, dword ptr [edi + 16]
    mov eax, dword ptr [edx + eax]
    cmp eax, dword ptr [ebx + 28]
    jne L7
    mov dword ptr [ebp - 8], 1
L7:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [edi + 4]
    jb L5
    cmp dword ptr [ebp - 8], 0
    jne L9
L8:
    xor eax, eax
    inc eax
    jmp L10
L9:
    mov eax, dword ptr [ecx + 000000100h]
    mov dword ptr [eax], 072E00003h
    mov eax, dword ptr [ecx + 000000100h]
    mov dword ptr [eax + 4], 6
    mov eax, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [eax + 16]
    mov dword ptr [eax + 12], edx
    mov eax, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [eax + 20]
    mov dword ptr [eax + 16], edx
    mov eax, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov ecx, dword ptr [eax + 24]
    mov dword ptr [eax + 20], ecx
    xor eax, eax
L10:
    pop ebx
L11:
    pop edi
    pop esi
    leave
    ret
FUN_100a70a7 ENDP
END
