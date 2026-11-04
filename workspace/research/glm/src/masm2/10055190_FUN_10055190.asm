.686
.MODEL FLAT, C
EXTRN sub_1005501E:PROC
EXTRN sub_10055144:PROC
EXTRN sub_100552FC:PROC
EXTRN sub_100552FF:PROC
EXTRN sub_10055371:PROC
EXTRN sub_100553B7:PROC
EXTRN sub_100553DA:PROC
EXTRN sub_100553E8:PROC
EXTRN sub_100553EB:PROC
.CODE
FUN_10055190 PROC
    push push ebx
    push push ebp
    push push esi
    push push edi
    mov mov edi, dword ptr [esp + 20]
    mov mov eax, dword ptr [edi + 4]
    mov mov esi, dword ptr [eax + 68]
    mov mov dword ptr [esp + 20], eax
    xor xor ebx, ebx
    mov mov eax, esi
    xor xor edx, edx
    xor xor ebp, ebp
    cmp cmp eax, ebx
    je L1
    mov mov edi, edi
    cmp cmp dword ptr [eax], ebx
    jne L0
    mov mov ecx, dword ptr [eax + 8]
    mov mov ebx, dword ptr [eax + 12]
    imul imul ebx, ecx
    add add edx, ebx
    mov mov ebx, dword ptr [eax + 4]
    imul imul ebx, ecx
    add add ebp, ebx
    xor xor ebx, ebx
    mov mov eax, dword ptr [eax + 36]
    cmp cmp eax, ebx
    jne L2
    mov mov eax, dword ptr [esp + 20]
    mov mov eax, dword ptr [eax + 72]
    cmp cmp eax, ebx
    je L4
    jmp L3
    lea lea ecx, [ecx]
    cmp cmp dword ptr [eax], ebx
    jne L5
    mov mov ecx, dword ptr [eax + 8]
    mov mov ebx, dword ptr [eax + 12]
    imul imul ebx, ecx
L0:
    shl shl ebx, 7
L2:
    add add edx, ebx
    mov mov ebx, dword ptr [eax + 4]
    imul imul ebx, ecx
    shl shl ebx, 7
    add add ebp, ebx
    xor xor ebx, ebx
    mov mov eax, dword ptr [eax + 36]
    cmp cmp eax, ebx
    jne L6
    cmp cmp edx, ebx
    jle sub_10055371
    cmp cmp esi, ebx
    je sub_100552FF
    cmp cmp dword ptr [esi], ebx
    jne sub_100552FC
    mov mov ebp, dword ptr [esi + 4]
    mov mov ecx, dword ptr [esi + 12]
    xor xor edx, edx
    lea lea eax, [ebp - 1]
    div div ecx
    inc inc eax
    cmp cmp eax, 03B9ACA00h
    jg L7
    mov mov dword ptr [esi + 16], ebp
    jmp L8
    imul imul ecx, ecx, 03B9ACA00h
    mov mov dword ptr [esi + 16], ecx
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ecx + 20], 49
    mov mov edx, dword ptr [edi]
    push push edi
    call call dword ptr [edx]
    add add esp, 4
    mov mov byte ptr [esi + 34], 1
    mov mov eax, dword ptr [esi + 16]
L4:
    mov mov ecx, dword ptr [esi + 8]
    push push eax
    push push ecx
L6:
    push push 1
    push push edi
    call sub_1005501E
    mov mov edx, dword ptr [esp + 36]
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [edx + 80]
    add add esp, 16
    mov mov dword ptr [esi + 20], eax
    mov mov dword ptr [esi + 24], ebx
    mov mov dword ptr [esi + 28], ebx
    mov mov byte ptr [esi + 33], bl
    mov mov esi, dword ptr [esi + 36]
    cmp cmp esi, ebx
    jne sub_100552FF
    mov mov ecx, dword ptr [esp + 20]
    mov mov esi, dword ptr [ecx + 72]
    cmp cmp esi, ebx
    je sub_100553EB
    cmp cmp dword ptr [esi], ebx
    jne sub_100553E8
    mov mov ebp, dword ptr [esi + 4]
    mov mov ecx, dword ptr [esi + 12]
    xor xor edx, edx
    lea lea eax, [ebp - 1]
    div div ecx
    inc inc eax
    cmp cmp eax, 03B9ACA00h
    jg sub_100553B7
    mov mov dword ptr [esi + 16], ebp
    jmp sub_100553DA
    imul imul ecx, ecx, 03B9ACA00h
    mov mov dword ptr [esi + 16], ecx
    mov mov edx, dword ptr [edi]
    mov mov dword ptr [edx + 20], 49
    mov mov eax, dword ptr [edi]
    push push edi
    call call dword ptr [eax]
    add add esp, 4
    mov mov byte ptr [esi + 34], 1
    mov mov ecx, dword ptr [esi + 16]
    mov mov edx, dword ptr [esi + 8]
    push push ecx
L7:
    push push edx
    push push 1
    push push edi
    call sub_10055144
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [esp + 36]
    mov mov ecx, dword ptr [eax + 80]
    add add esp, 16
    mov mov dword ptr [esi + 20], ecx
    mov mov dword ptr [esi + 24], ebx
    mov mov dword ptr [esi + 28], ebx
    mov mov byte ptr [esi + 33], bl
    mov mov esi, dword ptr [esi + 36]
    cmp cmp esi, ebx
    jne sub_100553EB
    pop pop edi
    pop pop esi
FUN_10055190 ENDP
END
