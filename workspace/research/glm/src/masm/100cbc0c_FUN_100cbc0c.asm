.686
.MODEL FLAT, C
.CODE
FUN_100cbc0c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    xor ebx, ebx
    cmp dword ptr [ecx + 56], ebx
    mov dword ptr [ebp - 24], ebx
    mov dword ptr [ebp - 12], ebx
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 8], ebx
    jbe L9
    push esi
    push edi
L0:
    mov eax, dword ptr [ecx + 60]
    mov edx, dword ptr [ebp - 8]
    mov edx, dword ptr [eax + edx*4]
    mov esi, dword ptr [ecx + 4]
    mov esi, dword ptr [esi + 24]
    mov edi, dword ptr [ecx + 44]
    mov eax, edx
    shl eax, 2
    mov esi, dword ptr [eax + esi]
    mov dword ptr [eax + edi], ebx
    mov edi, dword ptr [ecx + 40]
    and dword ptr [eax + edi], 0
    test word ptr [esi + 2], 00000FFF0h
    je L8
    mov esi, dword ptr [ecx + 12]
    mov esi, dword ptr [eax + esi]
    mov edi, dword ptr [ecx + 16]
    and dword ptr [ebp - 4], 0
    lea edi, [edi + esi*4]
    mov esi, dword ptr [ecx + 8]
    mov esi, dword ptr [eax + esi]
    test esi, esi
    mov dword ptr [ebp - 20], esi
    jbe L3
L1:
    mov esi, dword ptr [ebp - 4]
    mov ebx, dword ptr [ecx + 4]
    mov esi, dword ptr [edi + esi*4]
    mov ebx, dword ptr [ebx + 20]
    mov esi, dword ptr [ebx + esi*4]
    cmp edx, dword ptr [esi + 88]
    jne L2
    mov esi, dword ptr [ecx + 40]
    add esi, eax
    dec dword ptr [esi]
L2:
    inc dword ptr [ebp - 4]
    mov esi, dword ptr [ebp - 4]
    cmp esi, dword ptr [ebp - 20]
    jb L1
    mov ebx, dword ptr [ebp - 24]
L3:
    mov edx, dword ptr [ecx + 32]
    mov edx, dword ptr [eax + edx]
    mov esi, dword ptr [ecx + 36]
    lea esi, [esi + edx*4]
    mov edx, dword ptr [ecx + 28]
    mov edx, dword ptr [eax + edx]
    xor edi, edi
    test edx, edx
    mov dword ptr [ebp - 24], edx
    mov dword ptr [ebp - 20], edi
    jbe L6
L4:
    mov edx, dword ptr [esi + edi*4]
    mov edi, dword ptr [ecx + 4]
    mov edi, dword ptr [edi + 20]
    mov edx, dword ptr [edi + edx*4]
    cmp dword ptr [edx + 92], 0
    je L5
    mov edx, dword ptr [ecx + 40]
    add edx, eax
    inc dword ptr [edx]
L5:
    mov edi, dword ptr [ebp - 20]
    inc edi
    cmp edi, dword ptr [ebp - 24]
    mov dword ptr [ebp - 20], edi
    jb L4
L6:
    add dword ptr [ebp - 12], ebx
    cmp ebx, dword ptr [ebp - 16]
    jbe L7
    mov dword ptr [ebp - 16], ebx
L7:
    mov edx, dword ptr [ecx + 40]
    add ebx, dword ptr [edx + eax]
    mov dword ptr [ebp - 24], ebx
L8:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ecx + 56]
    jb L0
    pop edi
    pop esi
L9:
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    pop ebx
    je L10
    mov ecx, dword ptr [ebp - 12]
    mov dword ptr [eax], ecx
L10:
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L11
    mov ecx, dword ptr [ebp - 16]
    mov dword ptr [eax], ecx
L11:
    leave
    ret 8
FUN_100cbc0c ENDP
END
