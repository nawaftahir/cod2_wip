.686
.MODEL FLAT, C
EXTRN sub_1008B256:PROC
.CODE
FUN_100ad1c2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    xor eax, eax
    cmp dword ptr [ebp + 16], eax
    push esi
    push edi
    mov dword ptr [ebp - 16], ecx
    mov dword ptr [ebp - 4], eax
    jbe L16
L0:
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ecx + eax*4]
    xor edi, edi
    cmp ecx, edi
    mov dword ptr [ebp - 8], ecx
    je L15
    mov eax, dword ptr [ecx]
    cmp eax, edi
    je L15
    mov edx, eax
    and edx, 0FFF00000h
    and eax, 0000FFFFFh
    cmp edx, 060000000h
    je L6
    cmp edx, 060500000h
    je L6
    cmp edx, 060A00000h
    je L6
    cmp edx, 060F00000h
    je L6
    cmp edx, 072100000h
    je L7
    cmp dword ptr [ebp + 24], edi
    jbe L15
    mov eax, dword ptr [ecx + 4]
L1:
    and dword ptr [ebp - 8], 0
    test eax, eax
    jbe L5
    mov eax, dword ptr [ebp + 20]
    mov esi, dword ptr [eax + edi*4]
    mov edx, dword ptr [ecx + 8]
L2:
    mov eax, dword ptr [edx]
    cmp eax, esi
    je L3
    mov ebx, dword ptr [ebp - 16]
    mov ebx, dword ptr [ebx + 20]
    mov eax, dword ptr [ebx + eax*4]
    cmp dword ptr [eax + 56], esi
    jne L4
L3:
    mov eax, dword ptr [ebp + 12]
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ebx*4]
    test eax, eax
    je L4
    mov ebx, dword ptr [ebp - 4]
    cmp dword ptr [ebp + 8], ebx
    jae L4
    mov eax, dword ptr [eax]
    test eax, eax
    je L4
    and eax, 0FFF00000h
    cmp eax, 011000000h
    jne L18
L4:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ecx + 4]
    add edx, 4
    cmp dword ptr [ebp - 8], eax
    jb L2
L5:
    inc edi
    cmp edi, dword ptr [ebp + 24]
    jb L1
    jmp L15
L6:
    cmp edx, 072100000h
    jne L8
L7:
    xor ebx, ebx
    jmp L9
L8:
    mov ebx, eax
L9:
    xor edx, edx
    cmp dword ptr [ebp + 24], edi
    mov dword ptr [ebp - 20], edx
    jbe L15
    mov eax, dword ptr [ecx + 4]
L10:
    cmp ebx, eax
    mov dword ptr [ebp - 12], ebx
    jae L14
    mov eax, dword ptr [ebp + 20]
    mov edi, dword ptr [eax + edx*4]
    mov eax, dword ptr [ecx + 8]
    lea edx, [eax + ebx*4]
L11:
    mov esi, dword ptr [edx]
    cmp esi, edi
    jne L13
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ecx*4]
    test eax, eax
    je L12
    mov ecx, dword ptr [ebp - 4]
    cmp dword ptr [ebp + 8], ecx
    jae L12
    cmp dword ptr [eax], 0
    jne L18
L12:
    mov ecx, dword ptr [ebp - 8]
L13:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 20]
    mov eax, dword ptr [eax + esi*4]
    test byte ptr [eax + 62], 31
    jne L19
    cmp dword ptr [eax + 56], -1
    jne L19
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ecx + 4]
    add edx, 4
    cmp dword ptr [ebp - 12], eax
    jb L11
    mov edx, dword ptr [ebp - 20]
L14:
    inc edx
    cmp edx, dword ptr [ebp + 24]
    mov dword ptr [ebp - 20], edx
    jb L10
L15:
    mov eax, dword ptr [ebp - 4]
    inc eax
    cmp eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 4], eax
    jb L0
L16:
    xor eax, eax
L17:
    pop edi
    pop esi
    pop ebx
    leave
    ret 20
L18:
    xor eax, eax
    inc eax
    jmp L17
L19:
    push 0101172FCh
    push 0000012C6h
    push 0
    push dword ptr [ebp - 16]
    call sub_1008B256
    add esp, 16
    mov eax, 080004005h
    jmp L17
FUN_100ad1c2 ENDP
END
