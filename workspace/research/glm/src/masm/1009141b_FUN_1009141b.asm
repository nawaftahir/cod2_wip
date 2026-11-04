.686
.MODEL FLAT, C
EXTRN sub_10085558:PROC
EXTRN sub_1008A778:PROC
EXTRN sub_1008A789:PROC
EXTRN sub_1008A7B2:PROC
EXTRN sub_1008A7D8:PROC
EXTRN sub_1008A989:PROC
.CODE
FUN_1009141b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 48
    push edi
    mov edi, ecx
    call sub_1008A989
    and dword ptr [ebp - 8], 0
    cmp dword ptr [edi + 12], 0
    jbe L11
    push ebx
    push esi
L0:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [edi + 24]
    mov esi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi]
    mov dword ptr [ebp - 4], ecx
    and dword ptr [ebp - 4], 0FFF00000h
    je L10
    mov eax, dword ptr [esi + 4]
    mov ebx, ecx
    and ebx, 0000FFFFFh
    xor edx, edx
    div ebx
    cmp dword ptr [ebp - 4], 050000000h
    mov dword ptr [ebp - 24], eax
    jne L1
    push 1
    push ebx
    lea eax, [ebp - 48]
    push eax
    mov eax, dword ptr [esi + 8]
    lea eax, [eax + ebx*4]
    push eax
    mov ecx, edi
    call sub_1008A778
    push 0
    push ebx
    lea eax, [ebp - 48]
    push eax
    push dword ptr [esi + 8]
    mov ecx, edi
    call sub_1008A789
    jmp L3
L1:
    and ecx, 0F0000000h
    cmp ecx, 010000000h
    jb L3
    cmp ecx, 040000000h
    ja L3
    push 1
    push ebx
    lea eax, [ebp - 48]
    push eax
    push dword ptr [esi + 16]
    mov ecx, edi
    call sub_1008A7B2
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 24], 0
    jbe L3
L2:
    mov ecx, dword ptr [esi + 8]
    push 0
    push ebx
    lea eax, [ebp - 48]
    push eax
    mov eax, dword ptr [esi + 12]
    imul eax, dword ptr [ebp - 4]
    lea eax, [ecx + eax*4]
    push eax
    mov ecx, edi
    call sub_1008A7D8
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 24]
    jb L2
L3:
    mov eax, dword ptr [esi]
    and eax, 0F0000000h
    cmp eax, 020000000h
    jne L10
    mov ecx, esi
    call sub_10085558
    test eax, eax
    je L10
    mov eax, dword ptr [esi + 8]
    mov edx, dword ptr [eax]
    mov ecx, dword ptr [edi + 20]
    mov eax, dword ptr [eax + ebx*4]
    mov edx, dword ptr [ecx + edx*4]
    mov eax, dword ptr [ecx + eax*4]
    or dword ptr [ebp - 20], 0FFFFFFFFh
    or dword ptr [ebp - 4], 0FFFFFFFFh
    test ebx, ebx
    mov dword ptr [ebp - 32], edx
    mov dword ptr [ebp - 24], eax
    jbe L7
    mov eax, dword ptr [esi + 8]
    mov dword ptr [ebp - 12], eax
    lea eax, [eax + ebx*4]
    mov edx, ecx
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 28], ebx
L4:
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 72]
    cmp eax, dword ptr [ebp - 20]
    jae L5
    mov dword ptr [ebp - 20], eax
L5:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 72]
    cmp eax, dword ptr [ebp - 4]
    jae L6
    mov dword ptr [ebp - 4], eax
L6:
    add dword ptr [ebp - 12], 4
    add dword ptr [ebp - 16], 4
    dec dword ptr [ebp - 28]
    jne L4
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebp - 4]
    jb L10
    jne L8
L7:
    mov eax, dword ptr [ebp - 24]
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [ebp - 32]
    mov edx, dword ptr [edx + 4]
    shl edx, 2
    mov ecx, eax
    mov eax, dword ptr [edi + 16]
    mov dword ptr [ebp - 28], edx
    mov edx, dword ptr [edx + eax]
    mov edx, dword ptr [edx + 4]
    shl ecx, 2
    mov eax, dword ptr [eax + ecx]
    cmp edx, dword ptr [eax + 4]
    jb L10
    mov eax, dword ptr [edi + 16]
    mov edx, dword ptr [ebp - 28]
    mov edx, dword ptr [eax + edx]
    mov eax, dword ptr [eax + ecx]
    mov ecx, dword ptr [edx + 4]
    cmp ecx, dword ptr [eax + 4]
    jne L8
    mov eax, dword ptr [ebp - 24]
    mov edx, dword ptr [ebp - 32]
    mov eax, dword ptr [eax + 4]
    mov ecx, dword ptr [edx + 4]
    cmp ecx, eax
    jb L10
    jne L8
    mov eax, dword ptr [edx + 12]
    mov ecx, dword ptr [ebp - 24]
    cmp eax, dword ptr [ecx + 12]
    jb L10
L8:
    and dword ptr [ebp - 4], 0
    test ebx, ebx
    jbe L10
    mov eax, ebx
    shl eax, 2
    mov dword ptr [ebp - 32], eax
L9:
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [ebp - 4]
    inc dword ptr [ebp - 4]
    lea ecx, [eax + ecx*4]
    mov edx, dword ptr [ecx]
    mov dword ptr [ebp - 28], edx
    mov edx, dword ptr [ebp - 32]
    mov eax, dword ptr [edx + eax]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [ebp - 28]
    mov dword ptr [edx + eax], ecx
    add edx, 4
    cmp dword ptr [ebp - 4], ebx
    mov dword ptr [ebp - 32], edx
    jb L9
L10:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [edi + 12]
    jb L0
    pop esi
    pop ebx
L11:
    xor eax, eax
    pop edi
    leave
    ret
FUN_1009141b ENDP
END
