.686
.MODEL FLAT, C
.CODE
FUN_1008661b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    mov ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [ebp + 12]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 16]
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edx*4]
    mov edx, dword ptr [eax + 52]
    mov dword ptr [ebp - 16], ecx
    mov ecx, dword ptr [ecx + 52]
    push edi
    xor edi, edi
    cmp ecx, -1
    mov dword ptr [ebp - 20], eax
    mov dword ptr [ebp + 16], edi
    mov eax, ecx
    je L1
    mov ebx, dword ptr [esi + 20]
L0:
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 20]
    inc edi
    cmp eax, -1
    jne L0
L1:
    cmp edx, -1
    mov eax, edx
    je L3
L2:
    mov ebx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 20]
    inc dword ptr [ebp + 16]
    cmp eax, -1
    jne L2
L3:
    mov ebx, dword ptr [ebp + 16]
    cmp edi, ebx
    mov dword ptr [ebp - 8], edi
    mov dword ptr [ebp - 24], ebx
    jbe L5
    mov eax, edi
    sub eax, ebx
L4:
    mov ebx, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx + ecx*4]
    mov ecx, dword ptr [ecx + 20]
    dec edi
    dec eax
    jne L4
L5:
    mov eax, dword ptr [ebp + 16]
    cmp eax, edi
    jbe L7
    sub eax, edi
L6:
    mov ebx, dword ptr [esi + 20]
    mov edx, dword ptr [ebx + edx*4]
    dec dword ptr [ebp + 16]
    dec eax
    mov edx, dword ptr [edx + 20]
    jne L6
L7:
    cmp ecx, edx
    je L9
    mov eax, dword ptr [esi + 20]
L8:
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 20]
    mov edx, dword ptr [edx + 20]
    dec edi
    dec dword ptr [ebp + 16]
    cmp ecx, edx
    jne L8
L9:
    mov eax, dword ptr [ebp - 16]
    mov edx, dword ptr [eax + 52]
    mov eax, dword ptr [ebp - 20]
    mov ebx, dword ptr [eax + 52]
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [ebp - 8]
    cmp edi, eax
    jae L13
    mov ecx, dword ptr [esi + 20]
    sub eax, edi
    mov dword ptr [ebp - 8], eax
L10:
    mov edx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [edx + 72]
    cmp dword ptr [ebp - 4], eax
    jbe L11
    mov dword ptr [ebp - 4], eax
L11:
    mov eax, dword ptr [edx + 88]
    cmp dword ptr [ebp - 12], eax
    jae L12
    mov dword ptr [ebp - 12], eax
L12:
    dec dword ptr [ebp - 8]
    mov edx, dword ptr [edx + 20]
    jne L10
L13:
    mov eax, dword ptr [ebp - 24]
    cmp dword ptr [ebp + 16], eax
    mov edi, dword ptr [ebp + 12]
    mov dword ptr [ebp - 8], edi
    jae L17
    sub eax, dword ptr [ebp + 16]
    mov edx, dword ptr [esi + 20]
    mov dword ptr [ebp + 16], eax
L14:
    mov ecx, dword ptr [edx + ebx*4]
    mov eax, dword ptr [ecx + 72]
    cmp edi, eax
    jbe L15
    mov edi, eax
L15:
    mov eax, dword ptr [ecx + 88]
    cmp dword ptr [ebp - 8], eax
    jae L16
    mov dword ptr [ebp - 8], eax
L16:
    dec dword ptr [ebp + 16]
    mov ebx, dword ptr [ecx + 20]
    jne L14
L17:
    mov eax, dword ptr [ebp + 8]
    cmp eax, edi
    jb L18
    cmp eax, dword ptr [ebp - 8]
    jbe L19
L18:
    mov eax, dword ptr [ebp + 12]
    cmp eax, dword ptr [ebp - 4]
    jb L23
    cmp eax, dword ptr [ebp - 12]
    ja L23
L19:
    cmp dword ptr [ebp - 4], edi
    jae L21
L20:
    xor eax, eax
    inc eax
    jmp L37
L21:
    jbe L23
L22:
    or eax, 0FFFFFFFFh
    jmp L37
L23:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ecx + eax*4]
    mov eax, dword ptr [ecx + 24]
    mov edi, dword ptr [edx + 24]
    mov edx, dword ptr [edx + 20]
    and dword ptr [ebp - 12], 0
    and dword ptr [ebp + 16], 0
    cmp edx, -1
    mov ecx, dword ptr [ecx + 20]
    mov dword ptr [ebp - 24], eax
    mov eax, edx
    je L25
L24:
    mov ebx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 20]
    inc dword ptr [ebp - 12]
    cmp eax, -1
    jne L24
L25:
    cmp ecx, -1
    mov eax, ecx
    je L27
L26:
    mov ebx, dword ptr [esi + 20]
    mov eax, dword ptr [ebx + eax*4]
    mov eax, dword ptr [eax + 20]
    inc dword ptr [ebp + 16]
    cmp eax, -1
    jne L26
L27:
    mov ebx, dword ptr [ebp - 12]
    cmp ebx, dword ptr [ebp + 16]
    jbe L29
    mov eax, ebx
    sub eax, dword ptr [ebp + 16]
L28:
    mov edi, dword ptr [esi + 20]
    mov edx, dword ptr [edi + edx*4]
    mov edi, dword ptr [edx + 24]
    mov edx, dword ptr [edx + 20]
    dec ebx
    dec eax
    jne L28
L29:
    mov eax, dword ptr [ebp + 16]
    cmp eax, ebx
    jbe L31
    sub eax, ebx
    mov ebx, eax
L30:
    dec ebx
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx + 24]
    mov ecx, dword ptr [ecx + 20]
    jne L30
    jmp L32
L31:
    mov eax, dword ptr [ebp - 24]
L32:
    cmp edx, ecx
    je L34
    mov esi, dword ptr [esi + 20]
L33:
    mov edx, dword ptr [esi + edx*4]
    mov ecx, dword ptr [esi + ecx*4]
    mov edi, dword ptr [edx + 24]
    mov eax, dword ptr [ecx + 24]
    mov edx, dword ptr [edx + 20]
    mov ecx, dword ptr [ecx + 20]
    cmp edx, ecx
    jne L33
L34:
    test edi, edi
    je L35
    test eax, eax
    jne L36
    jmp L22
L35:
    test eax, eax
    jne L20
L36:
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [ebp + 12], eax
    ja L22
    sbb eax, eax
    neg eax
L37:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_1008661b ENDP
END
