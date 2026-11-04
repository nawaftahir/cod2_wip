.686
.MODEL FLAT, C
EXTRN sub_1005501E:PROC
EXTRN sub_10055144:PROC
.CODE
FUN_10055190 PROC
    push ebx
    push ebp
    push esi
    push edi
    mov edi, dword ptr [esp + 20]
    mov eax, dword ptr [edi + 4]
    mov esi, dword ptr [eax + 68]
    mov dword ptr [esp + 20], eax
    xor ebx, ebx
    mov eax, esi
    xor edx, edx
    xor ebp, ebp
    cmp eax, ebx
    je L2
    mov edi, edi
L0:
    cmp dword ptr [eax], ebx
    jne L1
    mov ecx, dword ptr [eax + 8]
    mov ebx, dword ptr [eax + 12]
    imul ebx, ecx
    add edx, ebx
    mov ebx, dword ptr [eax + 4]
    imul ebx, ecx
    add ebp, ebx
    xor ebx, ebx
L1:
    mov eax, dword ptr [eax + 36]
    cmp eax, ebx
    jne L0
L2:
    mov eax, dword ptr [esp + 20]
    mov eax, dword ptr [eax + 72]
    cmp eax, ebx
    je L5
    jmp L3
    lea ecx, [ecx]
L3:
    cmp dword ptr [eax], ebx
    jne L4
    mov ecx, dword ptr [eax + 8]
    mov ebx, dword ptr [eax + 12]
    imul ebx, ecx
    shl ebx, 7
    add edx, ebx
    mov ebx, dword ptr [eax + 4]
    imul ebx, ecx
    shl ebx, 7
    add ebp, ebx
    xor ebx, ebx
L4:
    mov eax, dword ptr [eax + 36]
    cmp eax, ebx
    jne L3
L5:
    cmp edx, ebx
    jle L15
    cmp esi, ebx
    je L10
L6:
    cmp dword ptr [esi], ebx
    jne L9
    mov ebp, dword ptr [esi + 4]
    mov ecx, dword ptr [esi + 12]
    xor edx, edx
    lea eax, [ebp - 1]
    div ecx
    inc eax
    cmp eax, 03B9ACA00h
    jg L7
    mov dword ptr [esi + 16], ebp
    jmp L8
L7:
    imul ecx, ecx, 03B9ACA00h
    mov dword ptr [esi + 16], ecx
    mov ecx, dword ptr [edi]
    mov dword ptr [ecx + 20], 49
    mov edx, dword ptr [edi]
    push edi
    call dword ptr [edx]
    add esp, 4
    mov byte ptr [esi + 34], 1
L8:
    mov eax, dword ptr [esi + 16]
    mov ecx, dword ptr [esi + 8]
    push eax
    push ecx
    push 1
    push edi
    call sub_1005501E
    mov edx, dword ptr [esp + 36]
    mov dword ptr [esi], eax
    mov eax, dword ptr [edx + 80]
    add esp, 16
    mov dword ptr [esi + 20], eax
    mov dword ptr [esi + 24], ebx
    mov dword ptr [esi + 28], ebx
    mov byte ptr [esi + 33], bl
L9:
    mov esi, dword ptr [esi + 36]
    cmp esi, ebx
    jne L6
L10:
    mov ecx, dword ptr [esp + 20]
    mov esi, dword ptr [ecx + 72]
    cmp esi, ebx
    je L15
L11:
    cmp dword ptr [esi], ebx
    jne L14
    mov ebp, dword ptr [esi + 4]
    mov ecx, dword ptr [esi + 12]
    xor edx, edx
    lea eax, [ebp - 1]
    div ecx
    inc eax
    cmp eax, 03B9ACA00h
    jg L12
    mov dword ptr [esi + 16], ebp
    jmp L13
L12:
    imul ecx, ecx, 03B9ACA00h
    mov dword ptr [esi + 16], ecx
    mov edx, dword ptr [edi]
    mov dword ptr [edx + 20], 49
    mov eax, dword ptr [edi]
    push edi
    call dword ptr [eax]
    add esp, 4
    mov byte ptr [esi + 34], 1
L13:
    mov ecx, dword ptr [esi + 16]
    mov edx, dword ptr [esi + 8]
    push ecx
    push edx
    push 1
    push edi
    call sub_10055144
    mov dword ptr [esi], eax
    mov eax, dword ptr [esp + 36]
    mov ecx, dword ptr [eax + 80]
    add esp, 16
    mov dword ptr [esi + 20], ecx
    mov dword ptr [esi + 24], ebx
    mov dword ptr [esi + 28], ebx
    mov byte ptr [esi + 33], bl
L14:
    mov esi, dword ptr [esi + 36]
    cmp esi, ebx
    jne L11
L15:
    pop edi
    pop esi
FUN_10055190 ENDP
END
