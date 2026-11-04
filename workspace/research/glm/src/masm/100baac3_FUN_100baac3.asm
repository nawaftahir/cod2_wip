.686
.MODEL FLAT, C
.CODE
FUN_100baac3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    push edi
    mov edi, 001000000h
L0:
    xor ebx, ebx
    cmp dword ptr [ecx + 12], ebx
    mov dword ptr [ebp - 20], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L9
L1:
    mov eax, dword ptr [ecx + 24]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [eax + edx*4]
    mov eax, dword ptr [edx + 4]
    and dword ptr [ebp - 12], 0
    test eax, eax
    jbe L8
    mov ebx, dword ptr [edx + 8]
    mov esi, dword ptr [ecx + 20]
    mov dword ptr [ebp - 8], ebx
    mov dword ptr [ebp - 16], eax
L2:
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [esi + eax*4]
    test dword ptr [eax], edi
    je L3
    mov dword ptr [ebp - 12], 1
L3:
    mov ebx, dword ptr [eax + 56]
    cmp ebx, -1
    je L4
    mov eax, dword ptr [esi + ebx*4]
L4:
    test dword ptr [eax], edi
    je L5
    mov dword ptr [ebp - 12], 1
L5:
    add dword ptr [ebp - 8], 4
    dec dword ptr [ebp - 16]
    jne L2
    xor ebx, ebx
    cmp dword ptr [ebp - 12], ebx
    je L8
    cmp dword ptr [edx + 12], ebx
    jbe L8
L6:
    mov eax, dword ptr [edx + 16]
    mov eax, dword ptr [eax + ebx*4]
    mov esi, dword ptr [ecx + 20]
    mov esi, dword ptr [esi + eax*4]
    mov eax, dword ptr [esi]
    test edi, eax
    jne L7
    or eax, edi
    mov dword ptr [esi], eax
    mov dword ptr [ebp - 20], 1
L7:
    inc ebx
    cmp ebx, dword ptr [edx + 12]
    jb L6
L8:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ecx + 12]
    jb L1
    xor ebx, ebx
    cmp dword ptr [ebp - 20], ebx
    jne L0
L9:
    cmp dword ptr [ecx + 8], ebx
    jbe L12
L10:
    mov eax, dword ptr [ecx + 20]
    mov edx, dword ptr [eax + ebx*4]
    mov esi, dword ptr [edx + 56]
    cmp esi, -1
    je L11
    mov eax, dword ptr [eax + esi*4]
    test dword ptr [eax], edi
    je L11
    or dword ptr [edx], edi
L11:
    inc ebx
    cmp ebx, dword ptr [ecx + 8]
    jb L10
L12:
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    leave
    ret
FUN_100baac3 ENDP
END
