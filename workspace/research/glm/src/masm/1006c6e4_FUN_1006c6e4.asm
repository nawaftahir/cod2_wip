.686
.MODEL FLAT, C
EXTRN sub_10082732:PROC
EXTRN sub_1008274D:PROC
EXTRN g_101AC95C:DWORD
.CODE
FUN_1006c6e4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 20]
    xor edx, edx
    cmp eax, edx
    mov ebx, ecx
    push edi
    mov dword ptr [ebp - 4], ebx
    je L7
    cmp dword ptr [esi + 40], edx
    je L7
    cmp dword ptr [esi + 56], edx
    jne L7
    cmp eax, edx
    mov dword ptr [esi + 52], edx
    jbe L2
    mov ecx, dword ptr [esi + 16]
    shl ecx, 2
L0:
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [ecx + eax]
    mov edi, dword ptr [ebx + 8]
    mov edi, dword ptr [edi + 20]
    mov eax, dword ptr [edi + eax*4]
    mov eax, dword ptr [eax + 112]
    inc eax
    cmp dword ptr [esi + 52], eax
    jae L1
    mov dword ptr [esi + 52], eax
L1:
    inc edx
    add ecx, 4
    cmp edx, dword ptr [esi + 20]
    jb L0
L2:
    mov eax, dword ptr [esi + 52]
    mov ecx, dword ptr [g_101AC95C]
    shl eax, 2
    push 16
    push eax
    call sub_10082732
    test eax, eax
    mov dword ptr [esi + 56], eax
    je L3
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [g_101AC95C]
    shl eax, 2
    push 16
    push eax
    call sub_1008274D
    test eax, eax
    mov dword ptr [esi + 60], eax
    jne L4
L3:
    mov eax, 08007000Eh
    jmp L8
L4:
    mov ecx, dword ptr [esi + 52]
    mov edi, dword ptr [esi + 56]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    and dword ptr [ebp + 8], 0
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esi + 20]
    mov edi, dword ptr [esi + 60]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    cmp dword ptr [esi + 20], 0
    mov eax, dword ptr [esi + 40]
    mov eax, dword ptr [eax + 32]
    jbe L7
L5:
    test eax, eax
    je L7
    mov ecx, dword ptr [esi + 16]
    add ecx, dword ptr [ebp + 8]
    mov edi, dword ptr [ebx + 24]
    mov edx, dword ptr [ebx + 8]
    mov ecx, dword ptr [edi + ecx*4]
    mov edi, dword ptr [edx + 20]
    mov ecx, dword ptr [edi + ecx*4]
    mov edi, dword ptr [ecx + 4]
    mov edx, dword ptr [edx + 16]
    mov edx, dword ptr [edx + edi*4]
    test byte ptr [edx + 4], 000000080h
    jne L6
    mov edx, dword ptr [eax + 8]
    mov edi, dword ptr [ecx + 112]
    mov ebx, dword ptr [esi + 56]
    add edx, 16
    mov dword ptr [ebx + edi*4], edx
    mov edx, dword ptr [eax + 8]
    mov ecx, dword ptr [ecx + 100]
    mov edi, dword ptr [esi + 60]
    mov ebx, dword ptr [ebp - 4]
    add edx, 16
    mov dword ptr [edi + ecx*4], edx
L6:
    inc dword ptr [ebp + 8]
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, dword ptr [esi + 20]
    mov eax, dword ptr [eax + 12]
    jb L5
L7:
    xor eax, eax
L8:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_1006c6e4 ENDP
END
