.686
.MODEL FLAT, C
EXTRN sub_10085519:PROC
.CODE
FUN_1008b1b3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    mov ebx, dword ptr [ebp + 12]
    mov eax, dword ptr [ebx + 24]
    push esi
    mov esi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [edi]
    cmp eax, ecx
    jb L12
    ja L13
    mov eax, dword ptr [esi + 12]
    and dword ptr [ebp - 4], 0
    test eax, eax
    jbe L2
    mov ecx, dword ptr [edi + 16]
    mov eax, dword ptr [esi + 16]
    sub eax, ecx
    mov dword ptr [ebp + 8], ecx
    mov dword ptr [ebp - 8], eax
    jmp L1
L0:
    mov eax, dword ptr [ebp - 8]
L1:
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + edx]
    mov ecx, dword ptr [ebx + 20]
    mov edx, dword ptr [edx]
    mov eax, dword ptr [ecx + eax*4]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [eax + 4]
    mov ebx, dword ptr [ecx + 4]
    cmp edx, ebx
    jb L12
    ja L13
    mov edx, dword ptr [eax + 20]
    mov ebx, dword ptr [ecx + 20]
    cmp edx, ebx
    jb L12
    ja L13
    mov eax, dword ptr [eax + 24]
    mov ecx, dword ptr [ecx + 24]
    cmp eax, ecx
    jl L12
    jg L13
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    add dword ptr [ebp + 8], 4
    cmp eax, dword ptr [esi + 12]
    mov ebx, dword ptr [ebp + 12]
    jb L0
L2:
    mov ecx, esi
    call sub_10085519
    test eax, eax
    je L10
    mov ecx, dword ptr [esi]
    and ecx, 0000FFFFFh
    mov dword ptr [ebp - 20], ecx
    mov dword ptr [ebp - 8], 0
    jbe L8
    mov edi, dword ptr [edi + 8]
    mov esi, dword ptr [esi + 8]
    mov eax, dword ptr [ebx + 20]
    mov dword ptr [ebp - 4], edi
    lea ecx, [edi + ecx*4]
    sub esi, edi
L3:
    mov edx, dword ptr [ebp - 4]
    mov edi, dword ptr [esi + edx]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [eax + edx*4]
    mov edi, dword ptr [eax + edi*4]
    mov ebx, dword ptr [edi + 48]
    mov edx, dword ptr [edx + 48]
    mov edi, dword ptr [esi + ecx]
    mov edi, dword ptr [eax + edi*4]
    mov edi, dword ptr [edi + 48]
    cmp ebx, edi
    mov dword ptr [ebp - 12], edx
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [eax + edx*4]
    mov edx, dword ptr [edx + 48]
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp + 12], ebx
    jb L4
    mov dword ptr [ebp + 12], edi
    mov dword ptr [ebp + 8], ebx
    ja L5
L4:
    mov dword ptr [ebp + 8], edi
L5:
    mov edi, dword ptr [ebp - 12]
    mov ebx, dword ptr [ebp - 16]
    cmp edi, ebx
    mov edx, edi
    jb L6
    mov edx, ebx
    ja L7
L6:
    mov edi, ebx
L7:
    cmp dword ptr [ebp + 12], edx
    jb L12
    ja L13
    cmp dword ptr [ebp + 8], edi
    jb L12
    ja L13
    inc dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    add ecx, 4
    cmp edx, dword ptr [ebp - 20]
    jb L3
L8:
    xor eax, eax
L9:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
L10:
    mov edx, dword ptr [esi + 4]
    and dword ptr [ebp + 12], 0
    test edx, edx
    jbe L8
    mov edi, dword ptr [edi + 8]
    mov esi, dword ptr [esi + 8]
    mov ebx, dword ptr [ebx + 20]
    mov eax, edi
    sub esi, edi
L11:
    mov ecx, dword ptr [esi + eax]
    mov edi, dword ptr [eax]
    mov ecx, dword ptr [ebx + ecx*4]
    mov edi, dword ptr [ebx + edi*4]
    mov ecx, dword ptr [ecx + 48]
    mov edi, dword ptr [edi + 48]
    cmp ecx, edi
    jb L12
    ja L13
    inc dword ptr [ebp + 12]
    add eax, 4
    cmp dword ptr [ebp + 12], edx
    jb L11
    jmp L8
L12:
    or eax, 0FFFFFFFFh
    jmp L9
L13:
    xor eax, eax
    inc eax
    jmp L9
FUN_1008b1b3 ENDP
END
