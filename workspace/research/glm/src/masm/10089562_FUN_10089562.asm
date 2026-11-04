.686
.MODEL FLAT, C
EXTRN sub_100854C7:PROC
.CODE
FUN_10089562 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push esi
    mov esi, ecx
    xor ecx, ecx
    xor eax, eax
    cmp dword ptr [esi + 8], ecx
    mov dword ptr [ebp - 24], ecx
    jbe L1
L0:
    mov edx, dword ptr [esi + 20]
    mov edx, dword ptr [edx + eax*4]
    or dword ptr [edx + 48], 0FFFFFFFFh
    inc eax
    cmp eax, dword ptr [esi + 8]
    jb L0
L1:
    cmp dword ptr [esi + 12], ecx
    mov dword ptr [ebp - 16], ecx
    jbe L14
    push ebx
    push edi
L2:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 16]
    mov ebx, dword ptr [eax + ecx*4]
    test word ptr [ebx + 2], 00000FFF0h
    je L13
    and dword ptr [ebp - 20], 0
    lea eax, [ebp - 12]
    push eax
    push 0
    jmp L10
L3:
    mov eax, dword ptr [ebp - 12]
    mov edx, dword ptr [eax]
    mov eax, dword ptr [esi + 20]
    shl edx, 2
    mov eax, dword ptr [edx + eax]
    cmp dword ptr [eax + 48], -1
    je L9
    xor eax, eax
    inc eax
    cmp dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 8], eax
    jbe L6
L4:
    mov eax, dword ptr [ebp - 12]
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 20]
    shl ecx, 2
    mov eax, dword ptr [ecx + eax]
    cmp dword ptr [eax + 48], -1
    je L5
    mov edi, dword ptr [esi + 20]
    mov eax, dword ptr [edi + ecx]
    mov ecx, dword ptr [edi + edx]
    mov ecx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + 48]
    mov ecx, dword ptr [edi + ecx*4]
    mov eax, dword ptr [edi + eax*4]
    mov ecx, dword ptr [ecx + 12]
    cmp ecx, dword ptr [eax + 12]
    jne L5
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 4]
    jb L4
L5:
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 4]
    jb L9
L6:
    xor ecx, ecx
    cmp dword ptr [ebp - 4], ecx
    jbe L8
L7:
    mov eax, dword ptr [ebp - 12]
    mov edi, dword ptr [esi + 20]
    lea eax, [eax + ecx*4]
    mov edx, dword ptr [eax]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx + 48]
    inc ecx
    cmp ecx, dword ptr [ebp - 4]
    mov dword ptr [eax], edx
    jb L7
L8:
    mov dword ptr [ebp - 24], 1
L9:
    inc dword ptr [ebp - 20]
    lea eax, [ebp - 12]
    push eax
    push dword ptr [ebp - 20]
L10:
    mov ecx, ebx
    call sub_100854C7
    test eax, eax
    mov dword ptr [ebp - 4], eax
    jne L3
    mov eax, dword ptr [ebx]
    and eax, 0FFF00000h
    cmp eax, 010000000h
    jne L13
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ebx + 12], 0
    jbe L13
L11:
    mov edx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 16]
    mov edi, dword ptr [ebx + 8]
    shl edx, 2
    mov ecx, dword ptr [edx + eax]
    mov eax, dword ptr [esi + 20]
    mov edx, dword ptr [edx + edi]
    mov dword ptr [ebp - 20], ecx
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [ecx + 4]
    cmp edx, dword ptr [eax + 4]
    jne L12
    mov edx, dword ptr [ecx + 8]
    cmp edx, dword ptr [eax + 8]
    jne L12
    mov edx, dword ptr [ecx + 16]
    cmp edx, dword ptr [eax + 16]
    jne L12
    mov edx, dword ptr [ecx + 20]
    cmp edx, dword ptr [eax + 20]
    jne L12
    mov edx, dword ptr [ecx + 24]
    cmp edx, dword ptr [eax + 24]
    jne L12
    cmp dword ptr [eax + 56], -1
    jne L12
    cmp dword ptr [ecx + 60], 0
    jne L12
    mov ecx, dword ptr [ebp - 20]
    mov dword ptr [eax + 48], ecx
L12:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebx + 12]
    jb L11
L13:
    inc dword ptr [ebp - 16]
    mov eax, dword ptr [ebp - 16]
    cmp eax, dword ptr [esi + 12]
    jb L2
    pop edi
    pop ebx
L14:
    xor eax, eax
    cmp dword ptr [ebp - 24], eax
    pop esi
    sete al
    leave
    ret
FUN_10089562 ENDP
END
