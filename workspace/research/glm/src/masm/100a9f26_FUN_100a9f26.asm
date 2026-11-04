.686
.MODEL FLAT, C
EXTRN sub_10086213:PROC
EXTRN sub_1008B202:PROC
EXTRN sub_100A6E5F:PROC
.CODE
FUN_100a9f26 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    xor ebx, ebx
    xor eax, eax
    cmp dword ptr [ebp + 12], ebx
    push esi
    mov edx, ecx
    push edi
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 16], eax
    jbe L9
L0:
    mov ecx, dword ptr [ebp + 8]
    mov edi, dword ptr [ecx + eax*4]
    cmp edi, ebx
    je L8
    mov eax, dword ptr [edi]
    cmp eax, ebx
    je L8
    mov ecx, eax
    and ecx, 0FFF00000h
    push ecx
    call sub_100A6E5F
    cmp ecx, 011000000h
    mov dword ptr [ebp - 12], eax
    jne L1
    mov dword ptr [ebp - 12], 1
L1:
    cmp dword ptr [edi + 4], ebx
    mov dword ptr [ebp - 4], ebx
    jbe L8
L2:
    mov esi, dword ptr [ebp - 4]
    mov ecx, dword ptr [edi + 8]
    mov ecx, dword ptr [ecx + esi*4]
    mov eax, dword ptr [edx + 20]
    mov esi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 4]
    cmp ecx, dword ptr [edx + 000000080h]
    jne L7
    mov ecx, dword ptr [esi + 108]
    and ecx, 0000000FFh
    cmp ecx, dword ptr [ebp + 16]
    jne L7
    movzx ecx, byte ptr [esi + 109]
    cmp dword ptr [ebp + 20], ecx
    jne L7
    cmp dword ptr [ebp - 12], ebx
    je L3
    cmp dword ptr [esi + 60], ebx
    je L7
L3:
    cmp dword ptr [ebp + 24], 0
    jbe L6
    mov ecx, dword ptr [esi + 16]
L4:
    mov edx, dword ptr [ebp + 28]
    mov edx, dword ptr [edx + ebx*4]
    mov edx, dword ptr [eax + edx*4]
    cmp ecx, dword ptr [edx + 16]
    je L5
    inc ebx
    cmp ebx, dword ptr [ebp + 24]
    jb L4
    jmp L6
L5:
    push ecx
    fldz
    push ecx
    fstp qword ptr [esp]
    push ecx
    mov ecx, dword ptr [ebp - 8]
    push 0
    push dword ptr [ecx + 000000088h]
    call sub_10086213
    cmp eax, -1
    je L11
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx + 20]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [esi + 60]
    mov dword ptr [ecx + 60], edx
    mov edx, dword ptr [ebp + 28]
    mov edx, dword ptr [edx + ebx*4]
    mov dword ptr [ecx + 56], edx
    mov ecx, dword ptr [edi + 8]
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
L6:
    cmp ebx, dword ptr [ebp + 24]
    je L12
    mov edx, dword ptr [ebp - 8]
    xor ebx, ebx
L7:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [edi + 4]
    jb L2
L8:
    mov eax, dword ptr [ebp - 16]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ebp - 16], eax
    jb L0
L9:
    xor eax, eax
L10:
    pop edi
    pop esi
    pop ebx
    leave
    ret 24
L11:
    mov eax, 08007000Eh
    jmp L10
L12:
    push 010116D20h
    push 0000012C1h
    push 0
    push dword ptr [ebp - 8]
    call sub_1008B202
    add esp, 16
    mov eax, 080004005h
    jmp L10
FUN_100a9f26 ENDP
END
