.686
.MODEL FLAT, C
EXTRN sub_10085482:PROC
EXTRN sub_100854F9:PROC
EXTRN sub_10085912:PROC
EXTRN sub_10085997:PROC
.CODE
FUN_100b3f9f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push ebx
    push esi
    mov esi, ecx
    xor ecx, ecx
    cmp ecx, dword ptr [ebp + 16]
    push edi
    jae L3
    mov eax, dword ptr [esi + 000000100h]
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov dword ptr [ebp - 8], edx
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 4], ecx
L0:
    mov edi, dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + edi]
    mov eax, dword ptr [edx + eax*4]
    mov edi, dword ptr [ebp - 12]
    cmp edi, dword ptr [eax + 4]
    jne L1
    mov eax, dword ptr [esi + 000000100h]
    mov edi, dword ptr [eax + 8]
    mov eax, dword ptr [eax + 16]
    mov ebx, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebx + edi]
    mov edi, dword ptr [esi + 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [edi + eax*4]
    mov ebx, dword ptr [edi + ebx*4]
    mov eax, dword ptr [eax + 12]
    cmp eax, dword ptr [ebx + 12]
    je L2
L1:
    mov eax, dword ptr [ebp + 12]
    shl eax, 2
    add dword ptr [ebp - 4], eax
    inc ecx
    cmp ecx, dword ptr [ebp + 16]
    jb L0
L2:
    cmp ecx, dword ptr [ebp + 16]
L3:
    je L13
    imul ecx, dword ptr [ebp + 12]
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    lea edx, [eax + ecx*4]
    or eax, 0FFFFFFFFh
    lea edi, [ebp - 28]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor ecx, ecx
    xor ebx, ebx
    cmp dword ptr [ebp + 12], ecx
    mov dword ptr [ebp + 16], edx
    stosd dword ptr es:[edi], eax
    jbe L5
L4:
    mov eax, dword ptr [edx + ecx*4]
    mov edi, dword ptr [esi + 20]
    mov edi, dword ptr [edi + eax*4]
    mov edi, dword ptr [edi + 16]
    inc ecx
    cmp ecx, dword ptr [ebp + 12]
    mov dword ptr [ebp + edi*4 - 28], eax
    jb L4
L5:
    xor eax, eax
L6:
    xor ecx, ecx
    cmp dword ptr [ebp + eax*4 - 28], -1
    setne cl
    add ebx, ecx
    inc eax
    cmp eax, 4
    jb L6
    mov eax, dword ptr [esi]
    push 0
    push 0
    push 4
    lea ecx, [ebp - 44]
    push ecx
    push dword ptr [esi + 0000000FCh]
    mov ecx, esi
    call dword ptr [eax + 0x80]
    test eax, eax
    jl L14
    push 116
    call sub_10085912
    test eax, eax
    je L7
    mov ecx, eax
    call sub_10085482
    jmp L8
L7:
    xor eax, eax
L8:
    test eax, eax
    mov edi, dword ptr [ebp + 8]
    mov dword ptr [edi], eax
    jne L9
    mov eax, 08007000Eh
    jmp L14
L9:
    push 0
    push ebx
    push ebx
    and ebx, 0000FFFFFh
    or ebx, 010000000h
    push ebx
    mov ecx, eax
    call sub_10085997
    test eax, eax
    jl L14
    push dword ptr [esi + 000000100h]
    mov ecx, dword ptr [edi]
    call sub_100854F9
    test eax, eax
    jl L14
    xor eax, eax
    xor ecx, ecx
L10:
    cmp dword ptr [ebp + ecx - 28], -1
    je L11
    mov edx, dword ptr [edi]
    mov edx, dword ptr [edx + 16]
    mov ebx, dword ptr [ebp + ecx - 44]
    mov dword ptr [eax + edx], ebx
    mov edx, dword ptr [edi]
    mov ebx, dword ptr [edx + 8]
    mov edx, dword ptr [ebp + ecx - 28]
    mov dword ptr [eax + ebx], edx
    add eax, 4
L11:
    add ecx, 4
    cmp ecx, 16
    jb L10
    xor eax, eax
    cmp dword ptr [ebp + 12], eax
    jbe L13
L12:
    mov ecx, dword ptr [ebp + 16]
    mov edi, dword ptr [esi + 20]
    lea ecx, [ecx + eax*4]
    mov edx, dword ptr [ecx]
    mov edx, dword ptr [edi + edx*4]
    mov edx, dword ptr [edx + 16]
    mov edx, dword ptr [ebp + edx*4 - 44]
    inc eax
    cmp eax, dword ptr [ebp + 12]
    mov dword ptr [ecx], edx
    jb L12
L13:
    xor eax, eax
L14:
    pop edi
    pop esi
    pop ebx
    leave
    ret 12
FUN_100b3f9f ENDP
END
