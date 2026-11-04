.686
.MODEL FLAT, C
.CODE
FUN_10089f75 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    xor edx, edx
    cmp dword ptr [ecx + 4], edx
    push esi
    push edi
    jbe L2
L0:
    mov eax, dword ptr [ecx + 16]
    mov eax, dword ptr [eax + edx*4]
    mov esi, dword ptr [eax + 4]
    mov edi, esi
    and edi, dword ptr [ebp + 12]
    cmp edi, dword ptr [ebp + 12]
    jne L1
    test dword ptr [ebp + 16], esi
    jne L1
    and dword ptr [eax + 8], 0
L1:
    inc edx
    cmp edx, dword ptr [ecx + 4]
    jb L0
L2:
    xor edi, edi
    cmp dword ptr [ecx + 8], edi
    jbe L5
L3:
    mov eax, dword ptr [ecx + 20]
    mov edx, dword ptr [eax + edi*4]
    mov esi, dword ptr [ecx + 16]
    mov eax, dword ptr [edx + 4]
    mov eax, dword ptr [esi + eax*4]
    mov esi, dword ptr [eax + 4]
    mov ebx, esi
    and ebx, dword ptr [ebp + 12]
    cmp ebx, dword ptr [ebp + 12]
    jne L4
    test dword ptr [ebp + 16], esi
    jne L4
    mov edx, dword ptr [edx + 12]
    inc edx
    cmp dword ptr [eax + 8], edx
    ja L4
    mov dword ptr [eax + 8], edx
L4:
    inc edi
    cmp edi, dword ptr [ecx + 8]
    jb L3
L5:
    xor edi, edi
    xor esi, esi
    cmp dword ptr [ecx + 4], edi
    mov dword ptr [ebp - 8], edi
    jbe L9
L6:
    mov eax, dword ptr [ecx + 16]
    mov eax, dword ptr [eax + edi*4]
    mov edx, dword ptr [eax + 4]
    mov ebx, edx
    and ebx, dword ptr [ebp + 12]
    cmp ebx, dword ptr [ebp + 12]
    jne L8
    mov ebx, dword ptr [ebp + 16]
    test ebx, edx
    jne L8
    test dh, 4
    mov ebx, dword ptr [ebp + 8]
    mov dword ptr [eax + 16], esi
    mov dword ptr [eax + 24], ebx
    je L7
    mov dword ptr [ebp - 8], 1
L7:
    add esi, dword ptr [eax + 8]
    and dword ptr [eax + 8], 0
L8:
    inc edi
    cmp edi, dword ptr [ecx + 4]
    jb L6
L9:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ecx + 8], 0
    jbe L12
L10:
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [ecx + 20]
    mov eax, dword ptr [eax + edx*4]
    mov edi, dword ptr [ecx + 16]
    mov edx, dword ptr [eax + 4]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [edx + 4]
    and edi, dword ptr [ebp + 12]
    cmp edi, dword ptr [ebp + 12]
    jne L11
    mov edi, dword ptr [edx + 4]
    mov ebx, dword ptr [ebp + 16]
    test ebx, edi
    jne L11
    mov edi, dword ptr [edx + 24]
    mov dword ptr [eax + 4], edi
    mov edx, dword ptr [edx + 16]
    add dword ptr [eax + 12], edx
L11:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ecx + 8]
    jb L10
L12:
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [ecx + 16]
    shl eax, 2
    cmp dword ptr [ebp - 8], 0
    mov edx, dword ptr [eax + edx]
    pop edi
    mov dword ptr [edx + 8], esi
    pop esi
    pop ebx
    je L13
    mov ecx, dword ptr [ecx + 16]
    mov eax, dword ptr [eax + ecx]
    or byte ptr [eax + 5], 4
L13:
    xor eax, eax
    leave
    ret 12
FUN_10089f75 ENDP
END
