.686
.MODEL FLAT, C
EXTRN sub_10067CF3:PROC
EXTRN sub_100683C3:PROC
EXTRN sub_10082788:PROC
.CODE
FUN_10068576 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    push edi
    mov edi, ecx
    mov ecx, dword ptr [edi + 4]
    cmp ebx, ecx
    jae L15
    mov al, byte ptr [ebx]
    cmp al, 34
    jne L0
    mov byte ptr [ebp + 11], al
    jmp L1
L0:
    cmp al, 60
    jne L15
    test byte ptr [edi + 40], 8
    je L15
    mov byte ptr [ebp + 11], 62
L1:
    lea esi, [ebx + 1]
    cmp esi, ecx
    mov dword ptr [ebp - 4], esi
    jae L5
    lea ecx, [esi + 1]
L2:
    mov al, byte ptr [esi]
    cmp byte ptr [ebp + 11], al
    je L5
    cmp al, 10
    je L5
    cmp al, 92
    jne L4
    test byte ptr [edi + 40], 4
    jne L4
    mov edx, dword ptr [edi + 4]
    inc esi
    inc ecx
    cmp esi, edx
    jae L4
    mov al, byte ptr [esi]
    cmp al, 10
    je L3
    cmp al, 13
    jne L4
    cmp ecx, edx
    jae L4
    cmp byte ptr [ecx], 10
    jne L4
    inc esi
    inc ecx
L3:
    inc dword ptr [edi + 28]
L4:
    inc esi
    inc ecx
    cmp esi, dword ptr [edi + 4]
    jb L2
L5:
    mov eax, dword ptr [edi + 4]
    cmp esi, eax
    jb L6
    push 01010CBC8h
    mov esi, eax
    push 0000003EEh
    jmp L7
L6:
    cmp byte ptr [esi], 10
    jne L8
    push 01010CBA4h
    push 0000003EDh
L7:
    lea eax, [edi + 8]
    push eax
    push dword ptr [edi + 48]
    call sub_10067CF3
    add esp, 16
L8:
    mov ecx, dword ptr [edi + 44]
    mov dword ptr [ebp + 8], esi
    sub esi, ebx
    push 1
    push esi
    mov dword ptr [ebp - 8], esi
    call sub_10082788
    mov ebx, eax
    test ebx, ebx
    je L15
    mov eax, dword ptr [ebp + 12]
    mov esi, dword ptr [ebp - 4]
    mov dword ptr [eax], ebx
L9:
    lea eax, [esi + 1]
    cmp eax, dword ptr [ebp + 8]
    jae L13
    mov edx, eax
    lea eax, [esi + 2]
L10:
    cmp byte ptr [esi], 92
    jne L13
    test byte ptr [edi + 40], 4
    jne L13
    mov cl, byte ptr [edx]
    cmp cl, 10
    jne L11
    inc esi
    inc esi
    inc eax
    inc eax
    inc edx
    inc edx
    jmp L12
L11:
    cmp cl, 13
    jne L13
    cmp eax, dword ptr [ebp + 8]
    jae L13
    cmp byte ptr [eax], 10
    jne L13
    add esi, 3
    add eax, 3
    add edx, 3
L12:
    cmp edx, dword ptr [ebp + 8]
    jb L10
L13:
    cmp esi, dword ptr [ebp + 8]
    jae L14
    lea eax, [ebp + 12]
    push eax
    push esi
    mov ecx, edi
    call sub_100683C3
    add esi, eax
    mov al, byte ptr [ebp + 12]
    mov byte ptr [ebx], al
    inc ebx
    jmp L9
L14:
    mov eax, dword ptr [ebp - 8]
    mov byte ptr [ebx], 0
    inc eax
    jmp L16
L15:
    xor eax, eax
L16:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_10068576 ENDP
END
