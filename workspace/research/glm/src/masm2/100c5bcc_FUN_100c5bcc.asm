.686
.MODEL FLAT, C
EXTRN sub_10086247:PROC
EXTRN sub_100C1BAF:PROC
EXTRN sub_100C6129:PROC
EXTRN sub_100C6139:PROC
EXTRN sub_100C6154:PROC
EXTRN sub_100C615D:PROC
EXTRN sub_100C6176:PROC
EXTRN sub_100C6179:PROC
EXTRN sub_100C6181:PROC
EXTRN sub_100C618C:PROC
EXTRN sub_100C6197:PROC
EXTRN sub_100C619B:PROC
EXTRN sub_100C61AD:PROC
EXTRN sub_100C61EF:PROC
EXTRN sub_100C61F7:PROC
EXTRN sub_100C6263:PROC
EXTRN sub_100C62DD:PROC
EXTRN sub_100C62F6:PROC
EXTRN sub_100C62F8:PROC
EXTRN sub_100C6307:PROC
EXTRN sub_100C631D:PROC
EXTRN sub_100C6331:PROC
EXTRN sub_100C633D:PROC
EXTRN sub_100C6345:PROC
EXTRN sub_100C634B:PROC
EXTRN sub_100C634C:PROC
EXTRN sub_100C636A:PROC
EXTRN sub_100C6371:PROC
EXTRN sub_100C63E4:PROC
EXTRN sub_100C63F9:PROC
EXTRN sub_100C63FD:PROC
EXTRN sub_100C6401:PROC
EXTRN sub_100C6409:PROC
EXTRN sub_100C640A:PROC
EXTRN sub_100C6416:PROC
EXTRN sub_100C641D:PROC
EXTRN sub_100C642A:PROC
EXTRN sub_100C642B:PROC
EXTRN sub_100C6455:PROC
EXTRN sub_100C64E4:PROC
EXTRN sub_100C64E9:PROC
EXTRN sub_100C65B5:PROC
EXTRN sub_100C65BD:PROC
EXTRN sub_100C65CC:PROC
EXTRN sub_100C65E3:PROC
EXTRN sub_100C65E7:PROC
EXTRN sub_100C65F8:PROC
EXTRN sub_100C6609:PROC
EXTRN sub_100C6656:PROC
.CODE
FUN_100c5bcc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0A4h
    push push ebx
    mov mov ebx, dword ptr [ebp + 24]
    test test ebx, ebx
    push push esi
    push push edi
    mov mov esi, ecx
    jne L0
    mov mov ebx, dword ptr [esi + 0100h]
    mov mov dword ptr [ebp + 24], ebx
    mov mov edi, dword ptr [ebx + 16]
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edi]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov ecx, dword ptr [esi + 088h]
    cmp cmp ecx, dword ptr [eax + 4]
    jne L17
    mov mov eax, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [eax + 12]
    and and dword ptr [ebp - 12], 0
    mov mov dword ptr [ebp - 20], ecx
    and and ecx, 0FFFFFh
    cmp cmp ecx, eax
    jne L18
    and and dword ptr [ebp - 4], 0
    test test eax, eax
    jbe L6
    mov mov ecx, dword ptr [esi + 108]
    mov mov eax, dword ptr [ebp + 16]
    shl shl ecx, 14
    sar sar ecx, 31
    sub sub eax, edi
    mov mov dword ptr [ebp - 8], edi
    mov mov dword ptr [ebp - 16], eax
    jmp L1
    mov mov eax, dword ptr [ebp - 16]
    test test ecx, ecx
    mov mov edi, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax + edi]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov edi, dword ptr [eax + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov edx, dword ptr [edx + edi*4]
    mov mov dword ptr [ebp - 32], edx
    je L2
    test test byte ptr [eax + 61], 2
    je L3
    cmp cmp dword ptr [ebp + 8], 080000h
    jne L4
    mov mov dword ptr [ebp - 12], 1
    mov mov eax, dword ptr [eax + 60]
    mov mov edx, 01F0000h
    test test edx, eax
    je L5
    mov mov edi, dword ptr [ebp + 12]
    not not edi
    and and edi, eax
    test test edx, edi
    je L7
    cmp cmp dword ptr [ebp + 8], 080000h
    jne sub_100C615D
    mov mov dword ptr [ebp - 12], 1
    mov mov eax, dword ptr [ebp - 8]
    mov mov eax, dword ptr [eax]
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 61], 0FEh
    jne sub_100C6179
    test test byte ptr [esi + 108], 16
    je L9
    mov mov eax, dword ptr [ebp - 32]
    test test byte ptr [eax + 5], 2
L1:
    je L10
    mov mov eax, dword ptr [ebp - 20]
    and and eax, 0FFF00000h
    cmp cmp eax, 010100000h
    jne sub_100C619B
    mov mov dword ptr [ebp - 12], 1
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [esi + 0100h]
    mov mov edi, dword ptr [ebp - 4]
    add add dword ptr [ebp - 8], 4
    cmp cmp edi, dword ptr [eax + 12]
    jb L8
    and and dword ptr [ebp + 8], 0
    cmp cmp dword ptr [ebx + 12], 0
    jbe L11
    mov mov eax, dword ptr [ebp + 20]
    not not eax
    mov mov dword ptr [ebp + 12], eax
L2:
    mov mov eax, dword ptr [ebp + 16]
    lea lea ecx, [ebp - 52]
L3:
    sub sub eax, ecx
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, dword ptr [ebx + 16]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ebp - 20]
    shl shl ecx, 2
    cmp cmp dword ptr [ebp - 12], 0
    mov mov eax, dword ptr [ecx + eax]
    mov mov eax, dword ptr [edx + eax*4]
    lea lea edi, [ebp + ecx - 52]
    mov mov ebx, dword ptr [edi + ebx]
    mov mov edx, dword ptr [edx + ebx*4]
    mov mov ebx, dword ptr [eax + 8]
    mov mov dword ptr [edi], ebx
    mov mov edi, dword ptr [eax + 12]
    mov mov ebx, dword ptr [eax + 72]
    mov mov dword ptr [ebp + ecx - 84], edi
    mov mov edi, dword ptr [eax + 16]
    mov mov dword ptr [ebp + ecx - 68], edi
    mov mov edi, dword ptr [eax + 20]
    mov mov dword ptr [ebp + ecx - 094h], edi
    mov mov edi, dword ptr [eax + 24]
    mov mov dword ptr [ebp + ecx - 100], edi
    mov mov edi, dword ptr [eax + 60]
L7:
    mov mov dword ptr [ebp + ecx - 084h], ebx
    mov mov ebx, dword ptr [eax + 104]
    mov mov dword ptr [ebp + ecx - 116], edi
L8:
    mov mov dword ptr [ebp + ecx - 0A4h], ebx
    jne L13
    mov mov ecx, dword ptr [edx + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov ecx, dword ptr [edx + 8]
    mov mov dword ptr [eax + 8], ecx
    mov mov ecx, dword ptr [edx + 12]
    mov mov dword ptr [eax + 12], ecx
    mov mov ecx, dword ptr [edx + 16]
    mov mov dword ptr [eax + 16], ecx
    mov mov ecx, dword ptr [edx + 20]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, dword ptr [edx + 24]
    mov mov dword ptr [eax + 24], ecx
    mov mov ecx, dword ptr [edx + 72]
    mov mov dword ptr [eax + 72], ecx
    mov mov ecx, dword ptr [edx + 104]
    mov mov dword ptr [eax + 104], ecx
    mov mov edx, dword ptr [edx + 60]
    mov mov ecx, edx
    xor xor ecx, dword ptr [ebp + 20]
    and and edx, dword ptr [ebp + 12]
    or or ecx, edx
    or or ecx, edi
    jmp L14
    mov mov edx, dword ptr [ebp + 12]
    mov mov ecx, edi
    xor xor ecx, dword ptr [ebp + 20]
    and and edx, edi
    or or ecx, edx
    inc inc dword ptr [ebp + 8]
    mov mov ebx, dword ptr [ebp + 24]
    mov mov dword ptr [eax + 60], ecx
L9:
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, dword ptr [ebx + 12]
    jb L12
    mov mov edi, dword ptr [ebx + 12]
    and and dword ptr [ebp + 12], 0
    test test edi, edi
    mov mov dword ptr [ebp - 20], edi
    jbe L15
    mov mov eax, dword ptr [ebx + 16]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [ebp + 8]
    push push dword ptr [eax]
    mov mov ecx, esi
    call sub_100C1BAF
    cmp cmp eax, 1
    je sub_100C6263
    inc inc dword ptr [ebp + 12]
    add add dword ptr [ebp + 8], 4
    cmp cmp dword ptr [ebp + 12], edi
    jb L16
    or or dword ptr [ebp - 4], -1
    and and dword ptr [ebp + 12], 0
    or or dword ptr [ebp + 8], -1
    test test edi, edi
    jbe sub_100C6129
    mov mov eax, dword ptr [ebp + 16]
    mov mov ebx, dword ptr [ebx + 16]
    mov mov edx, dword ptr [esi + 20]
    lea lea ecx, [ebp - 52]
    sub sub ecx, eax
    mov mov dword ptr [ebp - 36], ecx
    lea lea ecx, [ebp - 84]
    sub sub ecx, eax
    mov mov dword ptr [ebp - 28], ecx
    sub sub ebx, eax
    lea lea ecx, [ebp - 68]
    sub sub ecx, eax
    mov mov dword ptr [ebp - 24], ecx
    mov mov ecx, dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 32], ebx
    mov mov dword ptr [ebp - 16], ecx
    jmp L19
    mov mov ebx, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ebx + eax]
    mov mov edi, dword ptr [edx + ecx*4]
    mov mov ecx, dword ptr [eax]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov dword ptr [ebp - 8], edi
    mov mov edi, dword ptr [edi + 84]
    cmp cmp edi, dword ptr [ebp - 4]
    jae L20
    mov mov dword ptr [ebp - 4], edi
    mov mov edi, dword ptr [ebp - 8]
    mov mov edi, dword ptr [edi + 88]
    cmp cmp edi, dword ptr [ebp + 12]
    jbe sub_100C6139
    mov mov dword ptr [ebp + 12], edi
    mov mov edi, dword ptr [esi + 088h]
    cmp cmp edi, dword ptr [ecx + 4]
    jne sub_100C6176
    mov mov edi, dword ptr [ebp - 36]
    mov mov edi, dword ptr [edi + eax]
    cmp cmp edi, dword ptr [ecx + 8]
    jne sub_100C6181
    mov mov edi, dword ptr [ebp - 28]
    mov mov edi, dword ptr [edi + eax]
    cmp cmp edi, dword ptr [ecx + 12]
    jne sub_100C618C
    mov mov edi, dword ptr [ebp - 24]
    mov mov edi, dword ptr [edi + eax]
    cmp cmp edi, dword ptr [ecx + 16]
    jne sub_100C6197
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx + 80]
    cmp cmp ecx, dword ptr [ebp + 8]
    jae sub_100C61AD
    mov mov dword ptr [ebp + 8], ecx
    add add eax, 4
    dec dec dword ptr [ebp - 16]
    jne sub_100C6154
    mov mov ebx, dword ptr [ebp + 24]
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + 28], ecx
    mov mov eax, 010000000h
    jne sub_100C61EF
    mov mov edx, dword ptr [ebp + 8]
    cmp cmp edx, dword ptr [ebp + 12]
    jae sub_100C61F7
    test test dword ptr [esi + 108], eax
    je sub_100C633D
    cmp cmp dword ptr [ebp - 12], ecx
    jne sub_100C642B
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 8], eax
    ja sub_100C6345
    mov mov ecx, dword ptr [esi + 24]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax]
    mov mov edi, dword ptr [eax]
    test test edi, edi
    mov mov dword ptr [ebp - 12], edi
    je sub_100C634B
    mov mov ecx, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax + 4]
    and and dword ptr [ebp - 16], 0
    lea lea edx, [ecx + eax*4]
    mov mov eax, edi
    and and eax, 0FFFFFh
    cmp cmp ecx, edx
    mov mov dword ptr [ebp - 28], edx
    jae sub_100C636A
    and and dword ptr [ebp + 8], 0
    and and dword ptr [ebp + 24], 0
    test test eax, eax
    jbe sub_100C6331
    and and dword ptr [ebp + 28], 0
    cmp cmp dword ptr [ebx + 12], 0
    jbe sub_100C62F8
    mov mov edx, dword ptr [ebx + 16]
    jmp sub_100C62DD
    mov mov edx, dword ptr [ebp - 24]
    mov mov edi, dword ptr [ebp + 24]
    mov mov edi, dword ptr [ecx + edi*4]
    cmp cmp dword ptr [edx], edi
    je sub_100C6307
    inc inc dword ptr [ebp + 28]
    add add edx, 4
    mov mov dword ptr [ebp - 24], edx
    mov mov edx, dword ptr [ebp + 28]
    cmp cmp edx, dword ptr [ebx + 12]
    jb sub_100C62F8
    jmp sub_100C631D
    inc inc dword ptr [ebp + 8]
    inc inc dword ptr [ebp + 24]
    cmp cmp dword ptr [ebp + 24], eax
    jb sub_100C62F6
    cmp cmp dword ptr [ebp + 8], 0
    je sub_100C6371
    cmp cmp dword ptr [ebp + 8], eax
    jne sub_100C63E4
    mov mov edx, dword ptr [ebp - 12]
    and and edx, 0FFF00000h
    cmp cmp edx, 070500000h
    je sub_100C63F9
    cmp cmp edx, 070600000h
    je sub_100C6401
    cmp cmp edx, 070700000h
    je sub_100C6409
    mov mov dword ptr [ebp - 16], 1
    lea lea ecx, [ecx + eax*4]
    cmp cmp ecx, dword ptr [ebp - 28]
    jb sub_100C6331
    cmp cmp dword ptr [ebp - 16], 0
    je sub_100C63FD
    mov mov eax, dword ptr [ebp - 12]
    mov mov ecx, eax
    and and ecx, 0F0000000h
    cmp cmp ecx, 060000000h
    je sub_100C640A
    and and eax, 0FFF00000h
    cmp cmp eax, 010D00000h
    je sub_100C6416
    cmp cmp eax, 010E00000h
    je sub_100C641D
    cmp cmp eax, 011000000h
    jne sub_100C642A
    test test byte ptr [esi + 110], 080h
    je sub_100C6455
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    add add dword ptr [ebp - 4], 4
    cmp cmp eax, dword ptr [ebp + 12]
    jbe sub_100C634C
    xor xor ecx, ecx
    lea lea eax, [esi + 015Ch]
    cmp cmp dword ptr [eax], ecx
    je sub_100C64E4
    mov mov dword ptr [eax], 2
    xor xor edx, edx
    cmp cmp dword ptr [ebx + 12], edx
    jbe sub_100C64E9
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [esi + 20]
    mov mov eax, edx
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + ecx]
    mov mov ecx, dword ptr [edi + ecx*4]
    mov mov edi, dword ptr [esi + 088h]
    mov mov dword ptr [ecx + 4], edi
    mov mov edi, dword ptr [ebp + eax - 52]
    mov mov dword ptr [ecx + 8], edi
    mov mov edi, dword ptr [ebp + eax - 84]
    mov mov dword ptr [ecx + 12], edi
    mov mov edi, dword ptr [ebp + eax - 68]
    mov mov dword ptr [ecx + 16], edi
    mov mov edi, dword ptr [ebp + eax - 094h]
    mov mov dword ptr [ecx + 20], edi
    mov mov edi, dword ptr [ebp + eax - 100]
    mov mov dword ptr [ecx + 24], edi
    mov mov edi, dword ptr [ebp + eax - 116]
    mov mov dword ptr [ecx + 60], edi
    mov mov edi, dword ptr [ebp + eax - 084h]
    mov mov eax, dword ptr [ebp + eax - 0A4h]
    inc inc edx
    mov mov dword ptr [ecx + 72], edi
    mov mov dword ptr [ecx + 104], eax
    cmp cmp edx, dword ptr [ebx + 12]
    jb sub_100C64E9
    xor xor eax, eax
    inc inc eax
    jmp sub_100C65E3
    cmp cmp dword ptr [ebx + 12], ecx
    mov mov dword ptr [ebp + 24], ecx
    jbe sub_100C65CC
    mov mov edx, dword ptr [ebp + 24]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ebp + 16]
    mov mov eax, dword ptr [esi + 20]
    shl shl edx, 2
    mov mov ecx, dword ptr [edx + ecx]
    mov mov edx, dword ptr [edx + edi]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edi, dword ptr [eax + 56]
    cmp cmp edi, -1
    jne sub_100C65B5
    mov mov dword ptr [ecx + 56], edx
    jmp sub_100C65BD
    mov mov dword ptr [ecx + 56], edi
    cmp cmp dword ptr [ebp + 20], 080000h
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [ecx], edx
    jne sub_100C65E7
    test test dl, 4
    je sub_100C65F8
    and and edx, -5
    or or edx, 8
    mov mov dword ptr [ecx], edx
    cmp cmp dword ptr [ebp + 20], 0100000h
    jne sub_100C6609
    or or dword ptr [ecx], 4
    push push eax
    call sub_10086247
    inc inc dword ptr [ebp + 24]
    mov mov eax, dword ptr [ebp + 24]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_100C65CC
    mov mov eax, dword ptr [esi + 0100h]
    and and dword ptr [eax], 0
    jmp sub_100C6656
    mov mov esi, dword ptr [esi + 0100h]
    mov mov ecx, dword ptr [esi]
    and and ecx, 0FFFFFh
    or or ecx, eax
    mov mov dword ptr [esi], ecx
    xor xor eax, eax
    pop pop edi
L20:
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 24
FUN_100c5bcc ENDP
END
