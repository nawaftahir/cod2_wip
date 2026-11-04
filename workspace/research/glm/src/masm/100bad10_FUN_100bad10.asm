.686
.MODEL FLAT, C
EXTRN sub_10086250:PROC
EXTRN sub_1008634F:PROC
.CODE
FUN_100bad10 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax]
    push edi
    mov edi, eax
    and edi, 0000FFFFFh
    and eax, 0FFF00000h
    cmp eax, 020800000h
    mov dword ptr [ebp - 20], edi
    je L0
    xor eax, eax
    inc eax
    jmp L10
L0:
    xor eax, eax
    mov dword ptr [ebp - 24], eax
    mov dword ptr [ebp - 16], eax
    mov dword ptr [ebp - 12], eax
    push ebx
L1:
    and dword ptr [ebp - 4], 0
    test edi, edi
    jbe L3
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax + 16]
    mov eax, dword ptr [eax + 8]
    add eax, dword ptr [ebp - 12]
    mov dword ptr [ebp - 8], ecx
L2:
    mov ecx, dword ptr [ebp - 8]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx]
    mov ebx, dword ptr [eax]
    mov ecx, dword ptr [edx + ecx*4]
    mov edx, dword ptr [edx + ebx*4]
    mov ebx, dword ptr [edx + 4]
    cmp ebx, dword ptr [ecx + 4]
    jne L3
    mov ebx, dword ptr [edx + 8]
    cmp ebx, dword ptr [ecx + 8]
    jne L3
    mov ebx, dword ptr [edx + 12]
    cmp ebx, dword ptr [ecx + 12]
    jne L3
    mov edx, dword ptr [edx + 16]
    cmp edx, dword ptr [ecx + 16]
    jne L3
    inc dword ptr [ebp - 4]
    add dword ptr [ebp - 8], 4
    add eax, 4
    cmp dword ptr [ebp - 4], edi
    jb L2
L3:
    cmp dword ptr [ebp - 4], edi
    je L8
    push edi
    mov eax, edi
    and eax, 0000FFFFFh
    push edi
    or eax, 010000000h
    push eax
    mov ecx, esi
    call sub_10086250
    cmp eax, -1
    mov dword ptr [ebp - 24], eax
    je L11
    mov ecx, dword ptr [esi + 24]
    and dword ptr [ebp - 8], 0
    test edi, edi
    mov ebx, dword ptr [ecx + eax*4]
    jbe L5
    mov eax, dword ptr [ebp - 12]
    mov dword ptr [ebp - 4], eax
L4:
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [edx + eax]
    mov edi, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebx + 8]
    shl edi, 2
    mov dword ptr [edi + ecx], eax
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 16]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edi + eax]
    push dword ptr [ecx + eax*4]
    mov ecx, esi
    call sub_1008634F
    mov ecx, dword ptr [esi + 000000100h]
    mov edx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx], eax
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [ecx + eax]
    mov edx, dword ptr [ebx + 16]
    mov dword ptr [edi + edx], eax
    mov eax, dword ptr [ebx + 16]
    cmp dword ptr [edi + eax], -1
    je L11
    mov ecx, dword ptr [ebx + 8]
    mov ecx, dword ptr [edi + ecx]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebx + 16]
    mov edx, dword ptr [edi + edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 20]
    inc dword ptr [ebp - 8]
    add dword ptr [ebp - 4], 4
    mov dword ptr [eax + 20], ecx
    mov ecx, dword ptr [ebx + 8]
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [edi + ecx]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebx + 16]
    mov edx, dword ptr [edi + edx]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 24]
    mov dword ptr [eax + 24], ecx
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [ebp - 20]
    jb L4
    mov eax, dword ptr [ebp - 24]
    mov edi, dword ptr [ebp - 20]
L5:
    cmp eax, dword ptr [esi + 0000000FCh]
    ja L6
    test eax, eax
    jbe L7
    mov ecx, dword ptr [esi + 24]
    mov ecx, dword ptr [ecx + eax*4 - 4]
    mov ecx, dword ptr [ecx]
    and ecx, 0FFF00000h
    cmp ecx, 020800000h
    jne L7
L6:
    mov ecx, dword ptr [esi + 24]
    lea ecx, [ecx + eax*4]
    mov edx, dword ptr [ecx - 4]
    mov dword ptr [ecx], edx
    dec eax
    jmp L5
L7:
    mov ecx, dword ptr [esi + 24]
    mov dword ptr [ecx + eax*4], ebx
    inc dword ptr [esi + 0000000FCh]
    mov dword ptr [ebp - 24], 1
L8:
    inc dword ptr [ebp - 16]
    mov eax, edi
    shl eax, 2
    add dword ptr [ebp - 12], eax
    cmp dword ptr [ebp - 16], 2
    jb L1
    xor eax, eax
    cmp dword ptr [ebp - 24], eax
    sete al
L9:
    pop ebx
L10:
    pop edi
    pop esi
    leave
    ret
L11:
    mov eax, 08007000Eh
    jmp L9
FUN_100bad10 ENDP
END
