.686
.MODEL FLAT, C
EXTRN sub_1008B14B:PROC
.CODE
FUN_100a5888 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    push edi
    xor edi, edi
    cmp dword ptr [ebp + 20], edi
    mov esi, ecx
    mov dword ptr [ebp - 4], edi
    je L0
    mov dword ptr [ebp - 4], 0000F0000h
    jmp L8
L0:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 61], 2
    je L1
    mov dword ptr [ebp - 4], 000100000h
L1:
    cmp dword ptr [ebp + 12], edi
    jbe L8
L2:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + edi*4]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 16]
    xor ebx, ebx
    sub eax, ebx
    je L5
    dec eax
    je L4
    dec eax
    je L3
    dec eax
    jne L6
    mov ebx, 000080000h
    jmp L6
L3:
    mov ebx, 000040000h
    jmp L6
L4:
    mov ebx, 000020000h
    jmp L6
L5:
    mov ebx, 000010000h
L6:
    mov eax, dword ptr [ebp - 4]
    test eax, ebx
    je L7
    mov eax, dword ptr [esi + 000000100h]
    push 010115D0Ch
    push 0000012D5h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B14B
    add esp, 16
L7:
    or dword ptr [ebp - 4], ebx
    inc edi
    cmp edi, dword ptr [ebp + 12]
    jb L2
L8:
    test byte ptr [esi + 112], 64
    jne L14
    test byte ptr [esi + 0000000CCh], 32
    jne L13
    xor ecx, ecx
    cmp ecx, dword ptr [ebp + 12]
    jae L12
    mov edi, dword ptr [esi + 20]
L9:
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + eax*4]
    test byte ptr [eax + 3], 2
    jne L10
    mov edx, dword ptr [eax + 4]
    mov ebx, dword ptr [esi + 16]
    mov edx, dword ptr [ebx + edx*4]
    test byte ptr [edx + 4], 1
    je L11
    cmp dword ptr [eax + 72], -1
    je L11
    cmp dword ptr [eax + 84], -1
    jne L11
L10:
    inc ecx
    cmp ecx, dword ptr [ebp + 12]
    jb L9
L11:
    cmp ecx, dword ptr [ebp + 12]
L12:
    jne L14
L13:
    or byte ptr [ebp - 2], 32
L14:
    test byte ptr [esi + 0000000CCh], 1
    je L16
    xor ecx, ecx
    cmp dword ptr [esi + 000000124h], ecx
    je L16
    cmp dword ptr [ebp + 12], ecx
    jbe L16
L15:
    mov eax, dword ptr [esi + 000000128h]
    mov edi, dword ptr [ebp + 8]
    mov edi, dword ptr [edi + ecx*4]
    mov edx, dword ptr [esi + 000000124h]
    lea eax, [eax + eax*2]
    lea eax, [ecx + eax*2]
    inc ecx
    cmp ecx, dword ptr [ebp + 12]
    mov dword ptr [edx + eax*4 - 16], edi
    jb L15
L16:
    mov eax, dword ptr [ebp + 16]
    mov ecx, dword ptr [ebp - 4]
    pop edi
    pop esi
    mov dword ptr [eax], ecx
    xor eax, eax
    pop ebx
    leave
    ret 16
FUN_100a5888 ENDP
END
