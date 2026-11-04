.686
.MODEL FLAT, C
EXTRN sub_100855C4:PROC
EXTRN sub_100856F5:PROC
EXTRN sub_10086AE3:PROC
EXTRN sub_10086E22:PROC
EXTRN sub_10086FBB:PROC
EXTRN sub_10086FCF:PROC
EXTRN sub_10087067:PROC
EXTRN sub_1008707A:PROC
EXTRN sub_1008A9B6:PROC
EXTRN sub_1008AF4F:PROC
EXTRN sub_1008B3AF:PROC
EXTRN sub_100F7882:PROC
EXTRN sub_100F7D0D:PROC
.CODE
FUN_1008c376 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 84
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 8]
    shl eax, 2
    push edi
    push eax
    call sub_100F7882
    xor edi, edi
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 44], eax
    jne L0
    mov esi, 08007000Eh
    jmp L43
L0:
    push ebx
    mov dword ptr [ebp - 60], edi
L1:
    mov ecx, esi
    mov dword ptr [ebp - 80], edi
    mov dword ptr [ebp - 16], edi
    call sub_1008A9B6
    mov ecx, esi
    call sub_1008AF4F
    cmp dword ptr [esi + 8], edi
    mov dword ptr [ebp - 4], edi
    jbe L10
L2:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 8], -1
    mov dword ptr [ebp - 72], eax
    jne L9
    mov ecx, dword ptr [eax + 72]
    cmp ecx, -1
    je L9
    mov eax, dword ptr [eax + 4]
    mov edx, dword ptr [esi + 16]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    test al, 2
    je L9
    test al, 32
    jne L9
    mov eax, dword ptr [esi + 24]
    mov edi, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [edi]
    mov eax, ecx
    and eax, 0F0000000h
    cmp eax, 010000000h
    jb L9
    cmp eax, 040000000h
    ja L9
    mov ebx, ecx
    and ebx, 0FFF00000h
    mov eax, 011400000h
    cmp ebx, eax
    ja L3
    je L9
    cmp ebx, 010F00000h
    je L9
    cmp ebx, 011100000h
    je L9
    cmp ebx, 011200000h
    je L9
    cmp ebx, 011300000h
    jmp L4
L3:
    cmp ebx, 011500000h
    je L9
    cmp ebx, 020700000h
    je L9
    cmp ebx, 020800000h
    je L9
    cmp ebx, 020900000h
L4:
    je L9
    and dword ptr [ebp - 28], 0
    cmp dword ptr [edi + 12], 0
    jbe L6
    mov edx, dword ptr [edi + 16]
L5:
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [edx]
    je L6
    inc dword ptr [ebp - 28]
    mov eax, dword ptr [edi + 12]
    add edx, 4
    cmp dword ptr [ebp - 28], eax
    jb L5
L6:
    mov eax, dword ptr [edi + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    mov ecx, edi
    mov dword ptr [ebp - 56], eax
    call sub_100855C4
    and dword ptr [ebp - 24], 0
    cmp dword ptr [ebp - 56], 0
    mov dword ptr [ebp - 76], eax
    jbe L8
L7:
    push dword ptr [ebp - 76]
    mov ecx, esi
    push dword ptr [ebp - 28]
    push dword ptr [ebp - 24]
    push edi
    call sub_10086E22
    imul ebx, ebx, 00000083Fh
    add ebx, eax
    inc dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [ebp - 56]
    jb L7
L8:
    mov eax, dword ptr [ebp - 72]
    mov edx, dword ptr [ebp - 16]
    mov ecx, dword ptr [ebp - 44]
    inc dword ptr [ebp - 16]
    mov dword ptr [eax + 64], ebx
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ecx + edx*4], eax
L9:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [esi + 8]
    jb L2
L10:
    mov edi, dword ptr [ebp - 16]
    mov ebx, dword ptr [ebp - 44]
    push esi
    push edi
    push ebx
    push 0100868F2h
    call sub_10086AE3
    test edi, edi
    jbe L42
    mov dword ptr [ebp - 56], 1
    mov dword ptr [ebp - 52], ebx
    mov dword ptr [ebp - 76], edi
L11:
    mov eax, dword ptr [ebp - 52]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 48], ecx
    mov edx, dword ptr [eax + 72]
    mov edi, dword ptr [esi + 24]
    mov edi, dword ptr [edi + edx*4]
    mov dword ptr [ebp - 36], eax
    mov dword ptr [ebp - 72], edi
    jne L37
    mov ecx, dword ptr [ebp - 56]
    mov dword ptr [ebp - 40], ecx
    jmp L36
L12:
    mov ecx, dword ptr [ebp - 44]
    mov edx, dword ptr [ebp - 40]
    mov edx, dword ptr [ecx + edx*4]
    mov ecx, dword ptr [esi + 20]
    mov ecx, dword ptr [ecx + edx*4]
    mov ebx, dword ptr [eax + 64]
    cmp ebx, dword ptr [ecx + 64]
    mov dword ptr [ebp - 64], ecx
    jne L37
    cmp dword ptr [ecx + 48], edx
    jne L35
    mov edx, dword ptr [ecx + 72]
    cmp dword ptr [eax + 72], edx
    je L35
    mov ebx, dword ptr [eax + 4]
    cmp ebx, dword ptr [ecx + 4]
    jne L35
    mov ebx, dword ptr [eax + 20]
    cmp ebx, dword ptr [ecx + 20]
    jne L35
    mov ebx, dword ptr [eax + 24]
    cmp ebx, dword ptr [ecx + 24]
    jne L35
    mov ebx, dword ptr [esi + 24]
    mov edx, dword ptr [ebx + edx*4]
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [edx]
    xor edx, ecx
    test edx, 0FFF00000h
    jne L35
    mov eax, dword ptr [edi + 4]
    and ecx, 0000FFFFFh
    xor edx, edx
    div ecx
    mov ecx, edi
    mov dword ptr [ebp - 12], eax
    call sub_100856F5
    and dword ptr [ebp - 28], 0
    mov dword ptr [ebp - 32], eax
L13:
    cmp dword ptr [ebp - 28], 0
    mov eax, dword ptr [ebp - 64]
    jne L14
    mov eax, dword ptr [ebp - 36]
L14:
    cmp dword ptr [ebp - 28], 0
    mov edx, dword ptr [eax + 72]
    mov eax, dword ptr [ebp - 36]
    mov dword ptr [ebp - 68], edx
    jne L15
    mov eax, dword ptr [ebp - 64]
L15:
    mov ecx, dword ptr [eax + 72]
    mov eax, dword ptr [esi + 24]
    mov edi, dword ptr [eax + ecx*4]
    mov ebx, dword ptr [eax + edx*4]
    and dword ptr [ebp - 24], 0
    cmp dword ptr [edi + 12], 0
    mov dword ptr [ebp - 8], ebx
    jbe L24
    mov eax, dword ptr [edi + 16]
    mov dword ptr [ebp - 48], eax
L16:
    mov eax, dword ptr [ebp - 48]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [esi + 20]
    mov eax, dword ptr [eax + ecx*4]
    cmp dword ptr [eax + 84], edx
    jbe L24
    and dword ptr [ebp - 20], 0
    cmp dword ptr [ebx + 12], 0
    jbe L23
L17:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 12], 0
    jbe L21
    jmp L19
L18:
    mov ebx, dword ptr [ebp - 8]
L19:
    push dword ptr [ebp - 32]
    mov ecx, esi
    push dword ptr [ebp - 24]
    push dword ptr [ebp - 4]
    push edi
    call sub_10086FBB
    push dword ptr [ebp - 32]
    mov ecx, esi
    push dword ptr [ebp - 20]
    mov dword ptr [ebp - 84], eax
    push dword ptr [ebp - 4]
    push ebx
    call sub_10086FCF
    mov ecx, dword ptr [ebp - 84]
    cmp eax, ecx
    jne L20
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 12]
    jb L18
L20:
    mov ebx, dword ptr [ebp - 8]
L21:
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [ebp - 4], eax
    je L22
    inc dword ptr [ebp - 20]
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebx + 12]
    jb L17
L22:
    mov edx, dword ptr [ebp - 68]
L23:
    mov eax, dword ptr [ebp - 20]
    cmp eax, dword ptr [ebx + 12]
    je L24
    inc dword ptr [ebp - 24]
    mov eax, dword ptr [ebp - 24]
    add dword ptr [ebp - 48], 4
    cmp eax, dword ptr [edi + 12]
    jb L16
L24:
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [edi + 12]
    jae L25
    inc dword ptr [ebp - 28]
    cmp dword ptr [ebp - 28], 2
    jb L13
    jmp L34
L25:
    and dword ptr [ebp - 24], 0
    cmp dword ptr [edi + 12], 0
    jbe L33
L26:
    and dword ptr [ebp - 28], 0
    cmp dword ptr [ebx + 12], 0
    jbe L32
L27:
    and dword ptr [ebp - 4], 0
    cmp dword ptr [ebp - 12], 0
    jbe L31
    jmp L29
L28:
    mov ebx, dword ptr [ebp - 8]
L29:
    push dword ptr [ebp - 32]
    mov ecx, esi
    push dword ptr [ebp - 28]
    push dword ptr [ebp - 4]
    push ebx
    call sub_10087067
    push dword ptr [ebp - 32]
    mov ecx, esi
    push dword ptr [ebp - 24]
    mov ebx, eax
    push dword ptr [ebp - 4]
    push edi
    call sub_1008707A
    cmp ebx, eax
    jne L30
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebp - 12]
    jb L28
L30:
    mov ebx, dword ptr [ebp - 8]
L31:
    mov eax, dword ptr [ebp - 12]
    cmp dword ptr [ebp - 4], eax
    je L32
    inc dword ptr [ebp - 28]
    mov eax, dword ptr [ebp - 28]
    cmp eax, dword ptr [ebx + 12]
    jb L27
L32:
    mov edx, dword ptr [ebp - 24]
    mov ecx, dword ptr [edi + 16]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [esi + 20]
    mov ecx, dword ptr [edx + ecx*4]
    mov eax, dword ptr [ebx + 16]
    mov edx, dword ptr [ebp - 28]
    mov eax, dword ptr [eax + edx*4]
    inc dword ptr [ebp - 24]
    mov dword ptr [ecx + 48], eax
    mov eax, dword ptr [ebp - 24]
    cmp eax, dword ptr [edi + 12]
    jb L26
L33:
    and dword ptr [edi], 0
    mov dword ptr [ebp - 80], 1
L34:
    mov eax, dword ptr [ebp - 36]
    mov edi, dword ptr [ebp - 72]
L35:
    inc dword ptr [ebp - 40]
    mov ecx, dword ptr [ebp - 40]
L36:
    cmp ecx, dword ptr [ebp - 16]
    jb L12
L37:
    add dword ptr [ebp - 52], 4
    inc dword ptr [ebp - 56]
    dec dword ptr [ebp - 76]
    jne L11
    cmp dword ptr [ebp - 80], 0
    je L42
    xor edi, edi
    cmp dword ptr [esi + 8], edi
    jbe L41
    mov eax, dword ptr [esi + 20]
L38:
    mov ecx, dword ptr [eax + edi*4]
    jmp L40
L39:
    mov edx, dword ptr [ecx + 48]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 48]
    mov dword ptr [ecx + 48], eax
    mov eax, dword ptr [esi + 20]
L40:
    mov edx, dword ptr [ecx + 48]
    mov ebx, dword ptr [eax + edx*4]
    cmp edx, dword ptr [ebx + 48]
    jne L39
    inc edi
    cmp edi, dword ptr [esi + 8]
    jb L38
L41:
    mov ecx, esi
    call sub_1008B3AF
    inc dword ptr [ebp - 60]
    xor edi, edi
    jmp L1
L42:
    xor eax, eax
    cmp dword ptr [ebp - 60], eax
    pop ebx
    sete al
    mov esi, eax
L43:
    push dword ptr [ebp - 44]
    call sub_100F7D0D
    pop ecx
    pop edi
    mov eax, esi
    pop esi
    leave
    ret
FUN_1008c376 ENDP
END
