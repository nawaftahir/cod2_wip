.686
.MODEL FLAT, C
EXTRN sub_100677EE:PROC
EXTRN sub_10067D0B:PROC
.CODE
FUN_10067fa7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    and dword ptr [ebp - 4], 0
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi]
    cmp eax, dword ptr [esi + 4]
    jae L18
    push edi
L0:
    mov eax, dword ptr [esi]
    mov dl, byte ptr [eax]
    cmp dl, 10
    jne L1
    inc eax
    inc dword ptr [esi + 28]
    mov dword ptr [ebp - 4], 1
    jmp L15
L1:
    cmp dl, 32
    je L14
    cmp dl, 9
    jl L2
    cmp dl, 13
    jle L14
L2:
    cmp dl, 47
    jne L10
    lea ecx, [eax + 1]
    cmp ecx, dword ptr [esi + 4]
    jae L4
    cmp byte ptr [ecx], dl
    jne L4
L3:
    mov ecx, esi
    call sub_100677EE
    jmp L16
L4:
    cmp dl, 47
    jne L10
    mov edi, dword ptr [esi + 4]
    lea ecx, [eax + 1]
    cmp ecx, edi
    jae L10
    cmp byte ptr [ecx], 42
    jne L10
    add eax, 2
    cmp eax, edi
    mov dword ptr [esi], eax
    jae L8
L5:
    mov eax, dword ptr [esi]
    mov dl, byte ptr [eax]
    cmp dl, 42
    jne L6
    lea ecx, [eax + 1]
    cmp ecx, edi
    jae L6
    cmp byte ptr [ecx], 47
    je L8
L6:
    cmp dl, 10
    jne L7
    inc dword ptr [esi + 28]
L7:
    inc eax
    mov dword ptr [esi], eax
    cmp eax, dword ptr [esi + 4]
    jb L5
L8:
    mov eax, dword ptr [esi]
    cmp eax, edi
    jae L9
    add eax, 2
    jmp L15
L9:
    push 01010CAF4h
    push 0000003E9h
    lea eax, [esi + 8]
    push eax
    push dword ptr [esi + 48]
    call sub_10067D0B
    add esp, 16
    jmp L16
L10:
    test byte ptr [esi + 40], 2
    je L11
    cmp dl, 59
    je L3
L11:
    cmp dl, 92
    jne L17
    lea ecx, [eax + 1]
    cmp ecx, dword ptr [esi + 4]
    jae L12
    cmp byte ptr [ecx], 10
    jne L12
    add eax, 2
    jmp L13
L12:
    cmp dl, 92
    jne L17
    lea ecx, [eax + 2]
    cmp ecx, dword ptr [esi + 4]
    jae L17
    cmp byte ptr [eax + 1], 13
    jne L17
    cmp byte ptr [ecx], 10
    jne L17
    add eax, 3
L13:
    inc dword ptr [esi + 28]
    jmp L15
L14:
    inc eax
L15:
    mov dword ptr [esi], eax
L16:
    mov eax, dword ptr [esi]
    cmp eax, dword ptr [esi + 4]
    jb L0
L17:
    pop edi
L18:
    mov eax, dword ptr [ebp - 4]
    pop esi
    leave
    ret
FUN_10067fa7 ENDP
END
