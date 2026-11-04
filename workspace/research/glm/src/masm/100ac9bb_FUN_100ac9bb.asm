.686
.MODEL FLAT, C
EXTRN sub_1008B20A:PROC
.CODE
FUN_100ac9bb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    mov eax, dword ptr [ebp + 12]
    push ebx
    push esi
    push edi
    mov dword ptr [ebp - 16], ecx
    jmp L15
L0:
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + eax*4]
    test ecx, ecx
    mov dword ptr [ebp - 28], ecx
    je L14
    mov eax, dword ptr [ecx]
    mov esi, eax
    and esi, 0000FFFFFh
    test eax, eax
    mov dword ptr [ebp - 20], esi
    je L14
    mov eax, dword ptr [ecx + 4]
    xor edx, edx
    div esi
    and dword ptr [ebp - 12], 0
    test eax, eax
    mov dword ptr [ebp - 32], eax
    jbe L14
    and dword ptr [ebp + 12], 0
L1:
    and dword ptr [ebp - 4], 0
    test esi, esi
    jbe L13
    mov eax, dword ptr [ebp - 16]
    mov edx, dword ptr [ecx + 8]
    mov edi, dword ptr [eax + 20]
    add edx, dword ptr [ebp + 12]
    mov dword ptr [ebp - 8], esi
L2:
    mov esi, dword ptr [edx]
    mov ebx, dword ptr [edi + esi*4]
    xor eax, eax
    cmp dword ptr [ebp + 24], eax
    jbe L6
L3:
    mov ecx, dword ptr [ebp + 20]
    mov ecx, dword ptr [ecx + eax*4]
    cmp esi, ecx
    je L4
    cmp dword ptr [ebx + 56], ecx
    jne L5
L4:
    cmp dword ptr [ebx + 12], -1
    jne L5
    mov dword ptr [ebp - 4], 1
L5:
    inc eax
    cmp eax, dword ptr [ebp + 24]
    jb L3
    mov ecx, dword ptr [ebp - 28]
L6:
    add edx, 4
    dec dword ptr [ebp - 8]
    jne L2
    cmp dword ptr [ebp - 4], 0
    je L12
    mov eax, dword ptr [ebp + 12]
    and dword ptr [ebp - 8], 0
    mov dword ptr [ebp - 4], eax
L7:
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [ebp - 4]
    mov edx, dword ptr [edx + eax]
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 20]
    mov esi, dword ptr [eax + edx*4]
    mov esi, dword ptr [esi + 56]
    cmp esi, -1
    jne L8
    mov esi, edx
L8:
    mov eax, dword ptr [ebp + 32]
    mov edx, dword ptr [eax]
    xor edi, edi
    test edx, edx
    jbe L10
L9:
    mov ebx, dword ptr [ebp + 28]
    cmp dword ptr [ebx + edi*4], esi
    je L10
    inc edi
    cmp edi, dword ptr [eax]
    jb L9
L10:
    cmp edi, edx
    jne L11
    cmp edi, 32
    je L17
    mov edi, dword ptr [ebp + 28]
    mov dword ptr [edi + edx*4], esi
    inc dword ptr [eax]
L11:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    cmp eax, dword ptr [ebp - 20]
    jb L7
L12:
    mov esi, dword ptr [ebp - 20]
L13:
    inc dword ptr [ebp - 12]
    mov eax, esi
    shl eax, 2
    add dword ptr [ebp + 12], eax
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebp - 32]
    jb L1
L14:
    mov eax, dword ptr [ebp - 24]
    inc eax
L15:
    cmp eax, dword ptr [ebp + 16]
    mov dword ptr [ebp - 24], eax
    jb L0
    xor eax, eax
L16:
    pop edi
    pop esi
    pop ebx
    leave
    ret 28
L17:
    push 01011721Ch
    push 0000012C3h
    push 0
    push dword ptr [ebp - 16]
    call sub_1008B20A
    add esp, 16
    mov eax, 080004005h
    jmp L16
FUN_100ac9bb ENDP
END
