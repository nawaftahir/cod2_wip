.686
.MODEL FLAT, C
EXTRN sub_1006C596:PROC
EXTRN sub_1006C5C2:PROC
.CODE
FUN_100c10a5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    push edi
    mov esi, ecx
    mov eax, dword ptr [esi]
    push 0
    push ebx
    call dword ptr [eax + 0x20]
    test eax, eax
    jne L18
    and dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebx + 12]
    or dword ptr [ebp + 8], 0FFFFFFFFh
    test eax, eax
    jbe L3
    mov edi, dword ptr [esi + 20]
    mov ecx, dword ptr [ebx + 16]
    mov dword ptr [ebp - 16], eax
L0:
    mov eax, dword ptr [ecx]
    mov eax, dword ptr [edi + eax*4]
    mov edx, dword ptr [eax + 76]
    cmp dword ptr [ebp - 4], edx
    jae L1
    mov dword ptr [ebp - 4], edx
L1:
    mov eax, dword ptr [eax + 72]
    cmp dword ptr [ebp + 8], eax
    jbe L2
    mov dword ptr [ebp + 8], eax
L2:
    add ecx, 4
    dec dword ptr [ebp - 16]
    jne L0
L3:
    mov eax, dword ptr [ebx + 4]
    test eax, eax
    jbe L13
    mov ecx, dword ptr [ebx + 8]
    mov dword ptr [ebp - 16], ecx
    mov dword ptr [ebp - 20], eax
L4:
    mov eax, dword ptr [ebp - 16]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    mov edx, dword ptr [eax + 4]
    mov ecx, dword ptr [esi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    test byte ptr [ecx + 4], 2
    je L12
    mov ecx, dword ptr [eax + 72]
    cmp ecx, -1
    je L12
    inc ecx
    cmp dword ptr [ebp - 4], ecx
    jae L10
    mov dword ptr [ebp - 4], ecx
    jmp L10
L5:
    cmp ecx, -1
    je L11
    xor edx, edx
    cmp dword ptr [ebp + 16], edx
    jbe L11
    mov edi, dword ptr [esi + 24]
    mov ecx, dword ptr [edi + ecx*4]
L6:
    mov edi, dword ptr [ebp + 12]
    cmp dword ptr [edi + edx*4], ecx
    je L7
    inc edx
    cmp edx, dword ptr [ebp + 16]
    jb L6
L7:
    cmp edx, dword ptr [ebp + 16]
    jae L11
    mov ecx, dword ptr [edi + edx*4]
    and dword ptr [ebp - 8], 0
    cmp dword ptr [ecx + 12], 0
    jbe L9
    mov edx, dword ptr [ecx + 16]
    mov dword ptr [ebp - 12], edx
L8:
    mov edx, dword ptr [ebp - 12]
    mov edi, dword ptr [edx]
    mov edx, dword ptr [esi + 20]
    mov edi, dword ptr [edx + edi*4]
    mov edx, dword ptr [eax + 16]
    cmp edx, dword ptr [edi + 16]
    je L9
    inc dword ptr [ebp - 8]
    mov edx, dword ptr [ebp - 8]
    add dword ptr [ebp - 12], 4
    cmp edx, dword ptr [ecx + 12]
    jb L8
L9:
    mov edx, dword ptr [ebp - 8]
    cmp edx, dword ptr [ecx + 12]
    jae L11
    mov eax, dword ptr [ecx + 16]
    mov ecx, dword ptr [eax + edx*4]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
L10:
    mov ecx, dword ptr [eax + 80]
    cmp dword ptr [ebp + 8], ecx
    jae L5
    jmp L12
L11:
    mov eax, dword ptr [eax + 80]
    dec eax
    mov dword ptr [ebp + 8], eax
L12:
    add dword ptr [ebp - 16], 4
    dec dword ptr [ebp - 20]
    jne L4
L13:
    xor eax, eax
    cmp dword ptr [ebp + 16], eax
    jbe L16
    mov ecx, dword ptr [esi + 20]
L14:
    mov edx, dword ptr [ebp + 12]
    mov edx, dword ptr [edx + eax*4]
    mov edx, dword ptr [edx + 16]
    mov edx, dword ptr [edx]
    mov edx, dword ptr [ecx + edx*4]
    mov edi, dword ptr [edx + 72]
    cmp edi, dword ptr [ebp - 4]
    jb L15
    cmp edi, dword ptr [ebp + 8]
    jbe L17
L15:
    inc eax
    cmp eax, dword ptr [ebp + 16]
    jb L14
    jmp L17
L16:
    mov edi, dword ptr [ebp + 16]
L17:
    cmp eax, dword ptr [ebp + 16]
    je L18
    mov eax, dword ptr [esi]
    push edi
    push ebx
    mov ecx, esi
    call dword ptr [eax + 0x34]
    test eax, eax
    je L20
L18:
    test ebx, ebx
    je L19
    push 1
    mov ecx, ebx
    call sub_1006C596
L19:
    xor eax, eax
    inc eax
    jmp L26
L20:
    xor eax, eax
    cmp dword ptr [ebp + 16], eax
    jbe L22
L21:
    mov ecx, dword ptr [ebp + 12]
    mov ecx, dword ptr [ecx + eax*4]
    and dword ptr [ecx], 0
    inc eax
    cmp eax, dword ptr [ebp + 16]
    jb L21
L22:
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L23
    push 1
    call sub_1006C5C2
L23:
    mov eax, dword ptr [esi + 24]
    mov dword ptr [eax + edi*4], ebx
    xor eax, eax
    cmp dword ptr [ebx + 12], eax
    jbe L25
L24:
    mov ecx, dword ptr [ebx + 16]
    mov ecx, dword ptr [ecx + eax*4]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    inc eax
    mov dword ptr [ecx + 72], edi
    cmp eax, dword ptr [ebx + 12]
    jb L24
L25:
    xor eax, eax
L26:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_100c10a5 ENDP
END
