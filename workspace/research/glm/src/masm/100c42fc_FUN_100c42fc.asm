.686
.MODEL FLAT, C
EXTRN sub_1008B19B:PROC
.CODE
FUN_100c42fc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [edx]
    push ebx
    push esi
    mov esi, ecx
    push edi
    mov edi, dword ptr [esi + 20]
    mov eax, dword ptr [edi + eax*4]
    mov eax, dword ptr [eax + 60]
    xor ecx, ecx
    test ah, 4
    mov dword ptr [ebp - 8], ecx
    mov dword ptr [ebp - 4], ecx
    je L0
    mov dword ptr [ebp - 4], 001000000h
    jmp L5
L0:
    test ah, 8
    je L1
    mov dword ptr [ebp - 4], 002000000h
    jmp L5
L1:
    test ah, 16
    je L2
    mov dword ptr [ebp - 4], 003000000h
    jmp L5
L2:
    test ah, 32
    je L3
    mov dword ptr [ebp - 4], 00F000000h
    jmp L5
L3:
    test ah, 64
    je L4
    mov dword ptr [ebp - 4], 00E000000h
    jmp L5
L4:
    test ah, ah
    jns L5
    mov dword ptr [ebp - 4], 00D000000h
L5:
    test ah, 2
    je L6
    or byte ptr [ebp - 2], 16
L6:
    cmp dword ptr [ebp + 20], ecx
    je L7
    mov dword ptr [ebp - 8], 0000F0000h
    jmp L14
L7:
    xor edi, edi
    cmp dword ptr [ebp + 12], ecx
    jbe L14
L8:
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + edi*4]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 16]
    xor ecx, ecx
    xor ebx, ebx
    sub eax, ecx
    je L11
    dec eax
    je L10
    dec eax
    je L9
    dec eax
    jne L12
    mov ebx, 000080000h
    jmp L12
L9:
    mov ebx, 000040000h
    jmp L12
L10:
    mov ebx, 000020000h
    jmp L12
L11:
    mov ebx, 000010000h
L12:
    test dword ptr [ebp - 8], ebx
    je L13
    mov eax, dword ptr [esi + 000000100h]
    push 010115D0Ch
    push 0000012D5h
    push dword ptr [eax + 60]
    push esi
    call sub_1008B19B
    mov edx, dword ptr [ebp + 8]
    add esp, 16
    xor ecx, ecx
L13:
    or dword ptr [ebp - 8], ebx
    inc edi
    cmp edi, dword ptr [ebp + 12]
    jb L8
L14:
    test byte ptr [esi + 110], 000000080h
    je L16
    test byte ptr [ebp - 6], 8
    jne L15
    mov dword ptr [ebp - 8], 000070000h
    jmp L16
L15:
    test byte ptr [ebp - 6], 7
    je L16
    mov dword ptr [ebp - 8], 0000F0000h
L16:
    test byte ptr [esi + 0000000CCh], 1
    je L18
    cmp dword ptr [esi + 000000124h], ecx
    je L18
    cmp dword ptr [ebp + 12], ecx
    jbe L18
L17:
    mov eax, dword ptr [esi + 000000128h]
    mov ebx, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 000000124h]
    lea eax, [eax + eax*2]
    lea eax, [ecx + eax*2]
    inc ecx
    cmp ecx, dword ptr [ebp + 12]
    mov dword ptr [edi + eax*4 - 16], ebx
    jb L17
L18:
    mov eax, dword ptr [ebp - 4]
    or eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp + 16]
    pop edi
    pop esi
    mov dword ptr [ecx], eax
    xor eax, eax
    pop ebx
    leave
    ret 16
FUN_100c42fc ENDP
END
