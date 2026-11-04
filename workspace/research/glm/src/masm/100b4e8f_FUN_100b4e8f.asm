.686
.MODEL FLAT, C
EXTRN sub_1008B20D:PROC
EXTRN sub_100B403E:PROC
.CODE
FUN_100b4e8f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax]
    push ebx
    mov ebx, ecx
    push esi
    mov esi, dword ptr [ebx + 20]
    shl eax, 2
    mov edx, dword ptr [esi + eax]
    mov dword ptr [ebp - 4], edx
    mov edx, dword ptr [edx + 4]
    push edi
    mov edi, dword ptr [ebx + 16]
    mov edx, dword ptr [edi + edx*4]
    xor ecx, ecx
    test byte ptr [edx + 4], 000000080h
    je L0
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [eax], 000E40000h
    jmp L21
L0:
    mov edi, dword ptr [ebp + 16]
    xor edx, edx
    inc edx
    test edi, 000010000h
    je L1
    and dword ptr [ebp - 20], 0
    mov ecx, edx
L1:
    test edi, 000020000h
    je L2
    mov dword ptr [ebp + ecx*4 - 20], edx
    inc ecx
L2:
    test edi, 000040000h
    je L3
    mov dword ptr [ebp + ecx*4 - 20], 2
    inc ecx
L3:
    test edi, 000080000h
    je L4
    mov dword ptr [ebp + ecx*4 - 20], 3
    inc ecx
L4:
    cmp dword ptr [ebp + 12], ecx
    jbe L5
    mov dword ptr [ebp + 12], ecx
L5:
    mov ecx, dword ptr [ebx + 108]
    shl ecx, 30
    sar ecx, 31
    mov dword ptr [ebp + 16], ecx
    je L6
    or eax, 0FFFFFFFFh
    jmp L11
L6:
    xor edx, edx
    cmp dword ptr [ebp + 12], edx
    jbe L10
    mov ecx, dword ptr [ebx + 20]
    mov eax, dword ptr [ecx + eax]
    mov eax, dword ptr [eax + 16]
L7:
    mov edi, dword ptr [ebp + 8]
    mov edi, dword ptr [edi + edx*4]
    mov edi, dword ptr [ecx + edi*4]
    cmp eax, dword ptr [edi + 16]
    jne L8
    inc edx
    cmp edx, dword ptr [ebp + 12]
    jb L7
L8:
    cmp edx, dword ptr [ebp + 12]
    jae L10
    xor eax, eax
L9:
    mov dword ptr [ebp + eax*4 - 36], eax
    inc eax
    cmp eax, 4
    jb L9
    jmp L12
L10:
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 16]
L11:
    lea edi, [ebp - 36]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
L12:
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    jbe L14
    mov ecx, dword ptr [ebp + 8]
    lea edx, [ebp - 20]
    sub ecx, edx
L13:
    mov edi, dword ptr [ebp + eax*4 - 20]
    lea edx, [ecx + eax*4]
    mov edx, dword ptr [ebp + edx - 20]
    mov edx, dword ptr [esi + edx*4]
    mov edx, dword ptr [edx + 16]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp + edi*4 - 36], edx
    jb L13
L14:
    xor esi, esi
    cmp dword ptr [ebp + 16], esi
    je L18
    mov edi, 0101A4218h
    mov dword ptr [ebp + 12], edi
L15:
    push dword ptr [ebp + 12]
    lea eax, [ebp - 36]
    push eax
    mov ecx, ebx
    call sub_100B403E
    test eax, eax
    jne L16
    add dword ptr [ebp + 12], 16
    inc esi
    cmp esi, 8
    jb L15
    jmp L17
L16:
    shl esi, 4
    add esi, edi
    mov eax, esi
    jne L19
L17:
    mov eax, dword ptr [ebx + 000000100h]
    push 010117C18h
    push 0000012D2h
    push dword ptr [eax + 60]
    push ebx
    call sub_1008B20D
    add esp, 16
    mov eax, 080004005h
    jmp L22
L18:
    lea eax, [ebp - 36]
L19:
    push 16
    xor edx, edx
    pop ecx
L20:
    mov esi, dword ptr [eax]
    shl esi, cl
    add eax, 4
    or edx, esi
    inc ecx
    inc ecx
    cmp ecx, 24
    jb L20
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [eax], edx
L21:
    xor eax, eax
L22:
    pop edi
    pop esi
    pop ebx
    leave
    ret 16
FUN_100b4e8f ENDP
END
