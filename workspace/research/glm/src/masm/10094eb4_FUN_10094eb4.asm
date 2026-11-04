.686
.MODEL FLAT, C
EXTRN sub_10086A44:PROC
EXTRN sub_1008B01C:PROC
EXTRN sub_1008B17E:PROC
EXTRN sub_1008B322:PROC
EXTRN sub_10094A7C:PROC
EXTRN sub_100F7887:PROC
EXTRN sub_100F7AE3:PROC
.CODE
FUN_10094eb4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 36
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 12]
    shl eax, 2
    xor ebx, ebx
    push eax
    mov dword ptr [ebp - 4], ebx
    call sub_100F7887
    cmp eax, ebx
    pop ecx
    mov dword ptr [ebp - 8], eax
    jne L0
    mov esi, 08007000Eh
    jmp L23
L0:
    cmp dword ptr [esi + 12], ebx
    push edi
    mov dword ptr [ebp - 12], ebx
    jbe L7
L1:
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    je L6
    cmp dword ptr [ebp + 8], ebx
    je L2
    cmp dword ptr [eax + 36], ebx
    jne L6
L2:
    cmp ecx, 010F00000h
    je L6
    cmp ecx, 020700000h
    je L6
    cmp ecx, 011100000h
    je L6
    cmp ecx, 011200000h
    je L6
    cmp ecx, 011300000h
    je L6
    cmp ecx, 011400000h
    je L6
    cmp ecx, 020800000h
    je L6
    cmp ecx, 020900000h
    je L6
    cmp ecx, 011500000h
    je L6
    mov edi, dword ptr [eax + 12]
    cmp edi, ebx
    mov dword ptr [ebp - 16], ebx
    jbe L4
    mov ecx, dword ptr [esi + 20]
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [eax + 16]
L3:
    mov ebx, dword ptr [eax]
    mov ebx, dword ptr [ecx + ebx*4]
    mov ebx, dword ptr [ebx + 4]
    mov ebx, dword ptr [edx + ebx*4]
    test word ptr [ebx + 4], 000001020h
    jne L4
    inc dword ptr [ebp - 16]
    add eax, 4
    cmp dword ptr [ebp - 16], edi
    jb L3
L4:
    cmp dword ptr [ebp - 16], edi
    jb L5
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 12]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + edx*4], ecx
L5:
    xor ebx, ebx
L6:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [esi + 12]
    jb L1
L7:
    mov dword ptr [ebp - 20], ebx
L8:
    and dword ptr [ebp + 8], 0
    mov ecx, esi
    call sub_1008B01C
    mov edi, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebp - 8]
    push esi
    push edi
    push ebx
    push 01008B352h
    call sub_10086A44
    xor eax, eax
    cmp edi, eax
    jbe L21
    mov dword ptr [ebp - 12], 1
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 32], edi
L9:
    mov eax, dword ptr [ebp - 16]
    mov eax, dword ptr [eax]
    cmp eax, -1
    mov dword ptr [ebp - 24], eax
    je L15
    mov eax, dword ptr [ebp - 12]
    jmp L14
L10:
    mov ecx, dword ptr [ebp - 8]
    lea ebx, [ecx + eax*4]
    mov edi, dword ptr [ebx]
    cmp edi, -1
    mov dword ptr [ebp - 36], ebx
    je L13
    mov ecx, dword ptr [ebp - 24]
    cmp ecx, edi
    jae L15
    push esi
    push edi
    call sub_1008B322
    test eax, eax
    jne L15
    mov eax, dword ptr [esi + 24]
    mov ecx, dword ptr [ebp - 24]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [eax + edi*4]
    xor edx, edx
    cmp dword ptr [ecx + 12], edx
    mov dword ptr [ebp + 8], edx
    jbe L12
L11:
    mov ebx, dword ptr [ebp + 8]
    mov edi, dword ptr [eax + 16]
    mov edi, dword ptr [edi + ebx*4]
    mov ebx, dword ptr [esi + 20]
    mov edi, dword ptr [ebx + edi*4]
    mov edx, dword ptr [ecx + 16]
    mov ebx, dword ptr [ebp + 8]
    mov edx, dword ptr [edx + ebx*4]
    inc dword ptr [ebp + 8]
    mov dword ptr [edi + 48], edx
    mov edx, dword ptr [ebp + 8]
    cmp edx, dword ptr [ecx + 12]
    jb L11
    mov ebx, dword ptr [ebp - 36]
    xor edx, edx
L12:
    or dword ptr [ebx], 0FFFFFFFFh
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 12], edx
    xor eax, eax
    inc eax
    mov dword ptr [ebp - 20], eax
    mov dword ptr [ebp + 8], eax
    mov eax, dword ptr [ebp - 28]
L13:
    inc eax
L14:
    cmp eax, dword ptr [ebp - 4]
    mov dword ptr [ebp - 28], eax
    jb L10
L15:
    add dword ptr [ebp - 16], 4
    inc dword ptr [ebp - 12]
    dec dword ptr [ebp - 32]
    jne L9
    xor eax, eax
    cmp dword ptr [ebp + 8], eax
    je L21
    mov ecx, dword ptr [ebp - 4]
    cmp ecx, eax
    mov dword ptr [ebp - 36], ecx
    mov dword ptr [ebp - 4], eax
    mov dword ptr [ebp - 32], eax
    jbe L20
L16:
    mov ecx, dword ptr [ebp - 8]
    mov ecx, dword ptr [ecx + eax*4]
    cmp ecx, -1
    je L19
    mov eax, dword ptr [esi + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov edi, dword ptr [eax + 4]
    and dword ptr [ebp + 8], 0
    test edi, edi
    jbe L18
    mov eax, dword ptr [eax + 8]
L17:
    mov edx, dword ptr [eax]
    mov ebx, dword ptr [esi + 20]
    mov ebx, dword ptr [ebx + edx*4]
    cmp dword ptr [ebx + 48], edx
    jne L18
    inc dword ptr [ebp + 8]
    add eax, 4
    cmp dword ptr [ebp + 8], edi
    jb L17
L18:
    cmp dword ptr [ebp + 8], edi
    je L19
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 8]
    inc dword ptr [ebp - 4]
    mov dword ptr [eax + edx*4], ecx
L19:
    mov eax, dword ptr [ebp - 32]
    inc eax
    cmp eax, dword ptr [ebp - 36]
    mov dword ptr [ebp - 32], eax
    jb L16
L20:
    mov ecx, esi
    call sub_1008B17E
    jmp L8
L21:
    cmp dword ptr [ebp - 20], eax
    pop edi
    je L22
    mov ecx, esi
    call sub_10094A7C
L22:
    xor eax, eax
    cmp dword ptr [ebp - 20], eax
    sete al
    mov esi, eax
L23:
    push dword ptr [ebp - 8]
    call sub_100F7AE3
    pop ecx
    mov eax, esi
    pop esi
    pop ebx
    leave
    ret 4
FUN_10094eb4 ENDP
END
