.686
.MODEL FLAT, C
EXTRN sub_1008B1A4:PROC
EXTRN sub_100A7E81:PROC
EXTRN sub_100A7ECE:PROC
EXTRN sub_100A7EE3:PROC
EXTRN sub_100A7EF8:PROC
.CODE
FUN_100b0b4e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    mov edx, dword ptr [ebp + 16]
    push ebx
    mov ebx, ecx
    xor ecx, ecx
    push esi
    xor eax, eax
    inc ecx
    test edx, 000010000h
    push edi
    mov dword ptr [ebp - 4], ebx
    je L0
    mov dword ptr [ebp - 20], eax
    mov eax, ecx
L0:
    test edx, 000020000h
    je L1
    mov dword ptr [ebp + eax*4 - 20], ecx
    inc eax
L1:
    test edx, 000040000h
    je L2
    mov dword ptr [ebp + eax*4 - 20], 2
    inc eax
L2:
    test edx, 000080000h
    je L3
    mov dword ptr [ebp + eax*4 - 20], 3
    inc eax
L3:
    mov esi, dword ptr [ebp + 12]
    cmp esi, eax
    jbe L4
    mov esi, eax
L4:
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 36]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor ecx, ecx
    test esi, esi
    stosd dword ptr es:[edi], eax
    jbe L6
    mov eax, dword ptr [ebp + 8]
    mov edx, dword ptr [ebx + 20]
    lea edi, [ebp - 20]
    sub eax, edi
L5:
    mov ebx, dword ptr [ebp + ecx*4 - 20]
    lea edi, [eax + ecx*4]
    mov edi, dword ptr [ebp + edi - 20]
    mov edi, dword ptr [edx + edi*4]
    mov edi, dword ptr [edi + 16]
    inc ecx
    cmp ecx, esi
    mov dword ptr [ebp + ebx*4 - 36], edi
    jb L5
    mov ebx, dword ptr [ebp - 4]
L6:
    mov eax, dword ptr [ebx + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000104h
    jne L10
    mov edi, 0101A3FD0h
    xor esi, esi
    mov ebx, edi
L7:
    mov ecx, dword ptr [ebp - 4]
    push ebx
    lea eax, [ebp - 36]
    push eax
    call sub_100A7E81
    test eax, eax
    jne L8
    inc esi
    add ebx, 16
    cmp esi, 5
    jb L7
    jmp L9
L8:
    shl esi, 4
    add esi, edi
    jne L11
L9:
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax + 000000100h]
    push 010117880h
    push 0000011B5h
    push dword ptr [ecx + 60]
    push eax
    call sub_1008B1A4
    add esp, 16
    mov eax, 080004005h
    jmp L13
L10:
    mov esi, 0101A4000h
    push esi
    lea eax, [ebp - 36]
    push eax
    mov ecx, ebx
    call sub_100A7ECE
    test eax, eax
    jne L11
    mov esi, 0101A4010h
    push esi
    lea eax, [ebp - 36]
    push eax
    mov ecx, ebx
    call sub_100A7EE3
    test eax, eax
    jne L11
    mov edi, 0101A3FF0h
    push edi
    lea eax, [ebp - 36]
    push eax
    mov ecx, ebx
    call sub_100A7EF8
    test eax, eax
    je L11
    mov eax, dword ptr [ebp + 16]
    and eax, 0000F0000h
    cmp eax, 000080000h
    jne L11
    mov esi, edi
L11:
    push 16
    xor edx, edx
    pop ecx
    mov eax, esi
L12:
    mov esi, dword ptr [eax]
    shl esi, cl
    add eax, 4
    or edx, esi
    inc ecx
    inc ecx
    cmp ecx, 24
    jb L12
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [eax], edx
    xor eax, eax
L13:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FUN_100b0b4e ENDP
END
