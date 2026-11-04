.686
.MODEL FLAT, C
.CODE
FUN_100a7509 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    mov eax, dword ptr [ecx + 000000100h]
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    jne L8
    mov eax, dword ptr [ecx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    jae L8
    mov eax, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [ecx + 20]
    push ebx
    push esi
    mov esi, dword ptr [eax]
    push edi
    mov edi, dword ptr [eax + 8]
    mov edi, dword ptr [edi]
    mov edi, dword ptr [edx + edi*4]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [edx + eax*4]
    and esi, 0000FFFFFh
    xor ebx, ebx
    cmp dword ptr [edi + 60], ebx
    mov dword ptr [ebp - 20], esi
    jne L7
    test byte ptr [edx + 61], 2
    je L7
    cmp byte ptr [edi + 108], 3
    jne L7
    mov eax, dword ptr [edx + 4]
    cmp eax, dword ptr [ecx + 000000088h]
    jne L7
    cmp esi, ebx
    mov dword ptr [ebp - 8], ebx
    jbe L6
L0:
    mov eax, dword ptr [ebp - 8]
    mov edx, dword ptr [ecx + 000000100h]
    mov edx, dword ptr [edx + 8]
    shl eax, 2
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [eax + edx]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [edx + eax*4]
    or byte ptr [eax + 61], 2
    mov edx, dword ptr [ecx + 0000000FCh]
    jmp L5
L1:
    mov eax, dword ptr [ecx + 24]
    mov eax, dword ptr [eax + edx*4]
    cmp dword ptr [eax + 4], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L4
L2:
    mov ebx, dword ptr [ebp - 4]
    mov edi, dword ptr [eax + 8]
    mov esi, dword ptr [ecx + 000000100h]
    lea edi, [edi + ebx*4]
    mov ebx, dword ptr [esi + 16]
    mov esi, dword ptr [ebp - 12]
    mov dword ptr [ebp - 16], edi
    mov edi, dword ptr [edi]
    cmp edi, dword ptr [esi + ebx]
    jne L3
    mov edi, dword ptr [ecx + 000000100h]
    mov edi, dword ptr [edi + 8]
    mov esi, dword ptr [esi + edi]
    mov edi, dword ptr [ebp - 16]
    mov dword ptr [edi], esi
L3:
    inc dword ptr [ebp - 4]
    mov esi, dword ptr [ebp - 4]
    cmp esi, dword ptr [eax + 4]
    jb L2
    mov esi, dword ptr [ebp - 20]
    xor ebx, ebx
L4:
    inc edx
L5:
    cmp edx, dword ptr [ecx + 12]
    jb L1
    inc dword ptr [ebp - 8]
    cmp dword ptr [ebp - 8], esi
    jb L0
L6:
    mov eax, dword ptr [ecx + 000000100h]
    mov dword ptr [eax], ebx
L7:
    pop edi
    pop esi
    pop ebx
L8:
    xor eax, eax
    leave
    ret
FUN_100a7509 ENDP
END
