.686
.MODEL FLAT, C
.CODE
FUN_100c1d8b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [eax + 12], 0
    jne L0
    xor eax, eax
    jmp L6
L0:
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [ecx + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov ecx, dword ptr [eax + 20]
    cmp ecx, -1
    push ebx
    push esi
    push edi
    je L4
    mov ebx, dword ptr [ebp + 12]
    sub ebx, dword ptr [ebp + 16]
    mov dword ptr [ebp + 8], ebx
L1:
    mov esi, dword ptr [ebp + 16]
    xor edi, edi
L2:
    cmp ecx, dword ptr [ebx + esi]
    jne L3
    mov ebx, dword ptr [eax + 24]
    cmp ebx, dword ptr [esi]
    je L7
    mov ebx, dword ptr [ebp + 8]
L3:
    inc edi
    add esi, 4
    cmp edi, 4
    jb L2
    mov eax, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [eax + 20]
    cmp ecx, -1
    jne L1
L4:
    xor eax, eax
L5:
    pop edi
    pop esi
    pop ebx
L6:
    pop ebp
    ret 16
L7:
    xor eax, eax
    inc eax
    jmp L5
FUN_100c1d8b ENDP
END
