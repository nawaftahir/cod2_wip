.686
.MODEL FLAT, C
.CODE
FUN_1008a4c3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 12]
    push edi
L0:
    mov edx, dword ptr [ecx + 20]
    mov edi, dword ptr [edx + esi*4]
    mov edi, dword ptr [edi + 56]
    cmp edi, -1
    je L1
    mov esi, edi
L1:
    mov esi, dword ptr [edx + esi*4]
    mov edx, dword ptr [esi + 4]
    cmp edx, dword ptr [eax]
    jne L9
    cmp dword ptr [eax + 88], 0
    mov edx, dword ptr [esi + 116]
    mov dword ptr [ebp - 8], edx
    je L8
    mov ebx, dword ptr [eax + 76]
    mov edi, edx
    mov edx, dword ptr [eax + 80]
    shl edi, 2
    mov edx, dword ptr [edx + edi]
    add edx, dword ptr [ebx + edi]
    mov edi, dword ptr [eax + 84]
    mov dword ptr [edi + edx*4], edx
    mov ebx, dword ptr [eax + 88]
    mov edi, dword ptr [ebp + 16]
    lea edx, [edx + edx*2]
    shl edx, 2
    mov dword ptr [edx + ebx], edi
    mov ebx, dword ptr [ecx + 24]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [edi]
    and edi, 0FFF00000h
    cmp edi, 020700000h
    je L2
    cmp edi, 020800000h
    je L2
    cmp edi, 011500000h
    jne L3
L2:
    mov edi, dword ptr [eax + 88]
    mov ebx, dword ptr [esi + 20]
    mov dword ptr [edx + edi + 4], ebx
    mov edi, dword ptr [eax + 88]
    mov ebx, dword ptr [esi + 24]
    mov dword ptr [edx + edi + 8], ebx
    jmp L4
L3:
    mov edi, dword ptr [ecx + 24]
    mov ebx, dword ptr [ebp + 16]
    mov edi, dword ptr [edi + ebx*4]
    mov edi, dword ptr [edi + 16]
    mov edi, dword ptr [edi]
    mov ebx, dword ptr [ecx + 20]
    mov edi, dword ptr [ebx + edi*4]
    mov edi, dword ptr [edi + 20]
    mov ebx, dword ptr [eax + 88]
    mov dword ptr [edx + ebx + 4], edi
    mov edi, dword ptr [ecx + 24]
    mov ebx, dword ptr [ebp + 16]
    mov edi, dword ptr [edi + ebx*4]
    mov edi, dword ptr [edi + 16]
    mov edi, dword ptr [edi]
    mov ebx, dword ptr [ecx + 20]
    mov edi, dword ptr [ebx + edi*4]
    mov ebx, dword ptr [eax + 88]
    mov edi, dword ptr [edi + 24]
    mov dword ptr [edx + ebx + 8], edi
L4:
    mov edi, dword ptr [eax + 88]
    lea ebx, [edx + edi]
    mov edi, dword ptr [ebx + 4]
    mov ebx, dword ptr [ebx + 8]
    jmp L7
L5:
    mov ebx, dword ptr [ecx + 20]
    shl edi, 2
    mov dword ptr [ebp + 8], edi
    mov edi, dword ptr [edi + ebx]
    mov edi, dword ptr [edi + 4]
    mov ebx, dword ptr [ecx + 16]
    mov edi, dword ptr [ebx + edi*4]
    test byte ptr [edi + 5], 000000080h
    je L6
    mov edi, dword ptr [eax + 88]
    mov ebx, dword ptr [ebp - 4]
    mov dword ptr [edx + edi + 4], ebx
    mov edi, dword ptr [eax + 88]
    mov ebx, dword ptr [ebp + 12]
    mov dword ptr [edx + edi + 8], ebx
    mov edi, dword ptr [ecx + 20]
    mov ebx, dword ptr [ebp + 8]
    mov edi, dword ptr [ebx + edi]
    mov edi, dword ptr [edi + 88]
    mov ebx, dword ptr [eax + 88]
    mov dword ptr [edx + ebx], edi
    mov ebx, dword ptr [ebp + 8]
    mov edi, dword ptr [ecx + 20]
    mov edi, dword ptr [ebx + edi]
    mov ebx, dword ptr [esi + 88]
    cmp ebx, dword ptr [edi + 88]
    jae L6
    mov edi, dword ptr [ecx + 20]
    mov ebx, dword ptr [ebp + 8]
    mov edi, dword ptr [ebx + edi]
    mov edi, dword ptr [edi + 88]
    mov dword ptr [esi + 88], edi
L6:
    mov ebx, dword ptr [ebp + 8]
    mov edi, dword ptr [ecx + 20]
    mov edi, dword ptr [ebx + edi]
    mov ebx, dword ptr [edi + 24]
    mov edi, dword ptr [edi + 20]
L7:
    cmp edi, dword ptr [esi + 20]
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp + 12], ebx
    jne L5
L8:
    mov edx, dword ptr [eax + 76]
    mov edi, dword ptr [ebp - 8]
    lea edx, [edx + edi*4]
    inc dword ptr [edx]
L9:
    mov esi, dword ptr [esi + 8]
    cmp esi, -1
    jne L0
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_1008a4c3 ENDP
END
