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
EXTRN sub_1008C83B:PROC
EXTRN sub_1008C842:PROC
EXTRN sub_1008C8B1:PROC
EXTRN sub_1008C8D5:PROC
EXTRN sub_1008C975:PROC
EXTRN sub_1008C98A:PROC
EXTRN sub_1008C99D:PROC
EXTRN sub_1008C9AC:PROC
EXTRN sub_1008C9AD:PROC
EXTRN sub_1008C9B0:PROC
EXTRN sub_1008C9B2:PROC
EXTRN sub_1008C9B6:PROC
EXTRN sub_1008C9B9:PROC
EXTRN sub_1008C9BB:PROC
EXTRN sub_1008C9CA:PROC
EXTRN sub_1008C9D3:PROC
EXTRN sub_1008C9D6:PROC
EXTRN sub_1008C9D9:PROC
EXTRN sub_1008C9DB:PROC
EXTRN sub_1008C9DF:PROC
EXTRN sub_1008C9EB:PROC
EXTRN sub_1008C9F7:PROC
EXTRN sub_1008CA03:PROC
EXTRN sub_1008CA07:PROC
EXTRN sub_1008CA1B:PROC
EXTRN sub_1008CA3B:PROC
EXTRN sub_1008CA70:PROC
EXTRN sub_1008CACD:PROC
EXTRN sub_1008CB00:PROC
EXTRN sub_1008CB01:PROC
EXTRN sub_1008CB0A:PROC
EXTRN sub_1008CB26:PROC
EXTRN sub_1008CB2A:PROC
EXTRN sub_1008CB2B:PROC
EXTRN sub_1008CB57:PROC
EXTRN sub_1008CC4D:PROC
EXTRN sub_1008CC56:PROC
EXTRN sub_1008CC58:PROC
EXTRN sub_1008CC59:PROC
EXTRN sub_1008CC60:PROC
EXTRN sub_100F7882:PROC
EXTRN sub_100F7D0D:PROC
.CODE
FUN_1008c376 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 84
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 8]
    shl shl eax, 2
    push push edi
    push push eax
    call sub_100F7882
    xor xor edi, edi
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 44], eax
    jne L0
    mov mov esi, 08007000Eh
    jmp sub_1008C842
    push push ebx
    mov mov dword ptr [ebp - 60], edi
    mov mov ecx, esi
    mov mov dword ptr [ebp - 80], edi
    mov mov dword ptr [ebp - 16], edi
    call sub_1008A9B6
    mov mov ecx, esi
    call sub_1008AF4F
    cmp cmp dword ptr [esi + 8], edi
    mov mov dword ptr [ebp - 4], edi
    jbe L2
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 8], -1
    mov mov dword ptr [ebp - 72], eax
    jne L3
    mov mov ecx, dword ptr [eax + 72]
    cmp cmp ecx, -1
    je L4
    mov mov eax, dword ptr [eax + 4]
    mov mov edx, dword ptr [esi + 16]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    test test al, 2
    je L6
    test test al, 32
    jne L7
    mov mov eax, dword ptr [esi + 24]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [edi]
    mov mov eax, ecx
    and and eax, 0F0000000h
    cmp cmp eax, 010000000h
    jb L8
    cmp cmp eax, 040000000h
    ja L9
    mov mov ebx, ecx
    and and ebx, 0FFF00000h
    mov mov eax, 011400000h
    cmp cmp ebx, eax
    ja L1
    je L10
    cmp cmp ebx, 010F00000h
    je L13
    cmp cmp ebx, 011100000h
    je L15
    cmp cmp ebx, 011200000h
    je L16
    cmp cmp ebx, 011300000h
    jmp L5
    cmp cmp ebx, 011500000h
    je L17
    cmp cmp ebx, 020700000h
    je L18
    cmp cmp ebx, 020800000h
    je L19
    cmp cmp ebx, 020900000h
    je L20
    and and dword ptr [ebp - 28], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe L11
    mov mov edx, dword ptr [edi + 16]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [edx]
    je L14
    inc inc dword ptr [ebp - 28]
    mov mov eax, dword ptr [edi + 12]
    add add edx, 4
    cmp cmp dword ptr [ebp - 28], eax
    jb L12
    mov mov eax, dword ptr [edi + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    mov mov ecx, edi
    mov mov dword ptr [ebp - 56], eax
    call sub_100855C4
    and and dword ptr [ebp - 24], 0
    cmp cmp dword ptr [ebp - 56], 0
    mov mov dword ptr [ebp - 76], eax
    jbe L21
    push push dword ptr [ebp - 76]
    mov mov ecx, esi
    push push dword ptr [ebp - 28]
    push push dword ptr [ebp - 24]
    push push edi
    call sub_10086E22
    imul imul ebx, ebx, 083Fh
    add add ebx, eax
    inc inc dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [ebp - 56]
    jb L21
    mov mov eax, dword ptr [ebp - 72]
    mov mov edx, dword ptr [ebp - 16]
    mov mov ecx, dword ptr [ebp - 44]
    inc inc dword ptr [ebp - 16]
    mov mov dword ptr [eax + 64], ebx
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ecx + edx*4], eax
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [esi + 8]
    jb L2
    mov mov edi, dword ptr [ebp - 16]
    mov mov ebx, dword ptr [ebp - 44]
    push push esi
    push push edi
    push push ebx
    push push 0100868F2h
    call sub_10086AE3
    test test edi, edi
    jbe sub_1008C9D6
    mov mov dword ptr [ebp - 56], 1
    mov mov dword ptr [ebp - 52], ebx
    mov mov dword ptr [ebp - 76], edi
    mov mov eax, dword ptr [ebp - 52]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 48], ecx
    mov mov edx, dword ptr [eax + 72]
    mov mov edi, dword ptr [esi + 24]
    mov mov edi, dword ptr [edi + edx*4]
    mov mov dword ptr [ebp - 36], eax
    mov mov dword ptr [ebp - 72], edi
    jne sub_1008C9B0
    mov mov ecx, dword ptr [ebp - 56]
    mov mov dword ptr [ebp - 40], ecx
    jmp sub_1008C9B2
    mov mov ecx, dword ptr [ebp - 44]
    mov mov edx, dword ptr [ebp - 40]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov ebx, dword ptr [eax + 64]
    cmp cmp ebx, dword ptr [ecx + 64]
    mov mov dword ptr [ebp - 64], ecx
    jne sub_1008C9D9
    cmp cmp dword ptr [ecx + 48], edx
L6:
    jne sub_1008C9D3
    mov mov edx, dword ptr [ecx + 72]
    cmp cmp dword ptr [eax + 72], edx
    je sub_1008C9DF
    mov mov ebx, dword ptr [eax + 4]
    cmp cmp ebx, dword ptr [ecx + 4]
    jne sub_1008C9EB
    mov mov ebx, dword ptr [eax + 20]
    cmp cmp ebx, dword ptr [ecx + 20]
    jne sub_1008C9F7
    mov mov ebx, dword ptr [eax + 24]
L9:
    cmp cmp ebx, dword ptr [ecx + 24]
    jne sub_1008CA03
    mov mov ebx, dword ptr [esi + 24]
    mov mov edx, dword ptr [ebx + edx*4]
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [edx]
    xor xor edx, ecx
    test test edx, 0FFF00000h
    jne sub_1008CA1B
    mov mov eax, dword ptr [edi + 4]
    and and ecx, 0FFFFFh
    xor xor edx, edx
    div div ecx
    mov mov ecx, edi
    mov mov dword ptr [ebp - 12], eax
    call sub_100856F5
    and and dword ptr [ebp - 28], 0
    mov mov dword ptr [ebp - 32], eax
    cmp cmp dword ptr [ebp - 28], 0
    mov mov eax, dword ptr [ebp - 64]
    jne sub_1008C8B1
    mov mov eax, dword ptr [ebp - 36]
    cmp cmp dword ptr [ebp - 28], 0
L17:
    mov mov edx, dword ptr [eax + 72]
    mov mov eax, dword ptr [ebp - 36]
    mov mov dword ptr [ebp - 68], edx
    jne sub_1008C8D5
    mov mov eax, dword ptr [ebp - 64]
    mov mov ecx, dword ptr [eax + 72]
    mov mov eax, dword ptr [esi + 24]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov ebx, dword ptr [eax + edx*4]
    and and dword ptr [ebp - 24], 0
    cmp cmp dword ptr [edi + 12], 0
    mov mov dword ptr [ebp - 8], ebx
    jbe sub_1008C9B0
    mov mov eax, dword ptr [edi + 16]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ebp - 48]
    mov mov ecx, dword ptr [eax]
    mov mov eax, dword ptr [esi + 20]
    mov mov eax, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [eax + 84], edx
    jbe sub_1008C9CA
    and and dword ptr [ebp - 20], 0
    cmp cmp dword ptr [ebx + 12], 0
    jbe sub_1008C9B9
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 12], 0
    jbe sub_1008C9AD
    jmp sub_1008C975
    mov mov ebx, dword ptr [ebp - 8]
    push push dword ptr [ebp - 32]
    mov mov ecx, esi
    push push dword ptr [ebp - 24]
    push push dword ptr [ebp - 4]
    push push edi
    call sub_10086FBB
    push push dword ptr [ebp - 32]
    mov mov ecx, esi
    push push dword ptr [ebp - 20]
    mov mov dword ptr [ebp - 84], eax
    push push dword ptr [ebp - 4]
    push push ebx
    call sub_10086FCF
    mov mov ecx, dword ptr [ebp - 84]
    cmp cmp eax, ecx
    jne sub_1008C9DB
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 12]
    jb sub_1008C9AC
    mov mov ebx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 4], eax
    je sub_1008CA07
    inc inc dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_1008C9B6
    mov mov edx, dword ptr [ebp - 68]
    mov mov eax, dword ptr [ebp - 20]
    cmp cmp eax, dword ptr [ebx + 12]
    je sub_1008CA3B
    inc inc dword ptr [ebp - 24]
    mov mov eax, dword ptr [ebp - 24]
    add add dword ptr [ebp - 48], 4
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1008C9B6
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [edi + 12]
    jae sub_1008CA70
    inc inc dword ptr [ebp - 28]
    cmp cmp dword ptr [ebp - 28], 2
    jb sub_1008C98A
    jmp sub_1008CB26
    and and dword ptr [ebp - 24], 0
    cmp cmp dword ptr [edi + 12], 0
    jbe sub_1008CB2A
    and and dword ptr [ebp - 28], 0
    cmp cmp dword ptr [ebx + 12], 0
    jbe sub_1008CB0A
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 12], 0
    jbe sub_1008CB01
    jmp sub_1008CACD
    mov mov ebx, dword ptr [ebp - 8]
    push push dword ptr [ebp - 32]
    mov mov ecx, esi
    push push dword ptr [ebp - 28]
    push push dword ptr [ebp - 4]
    push push ebx
    call sub_10087067
    push push dword ptr [ebp - 32]
    mov mov ecx, esi
    push push dword ptr [ebp - 24]
    mov mov ebx, eax
    push push dword ptr [ebp - 4]
    push push edi
    call sub_1008707A
    cmp cmp ebx, eax
    jne sub_1008CB2B
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 12]
    jb sub_1008CB00
    mov mov ebx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 12]
    cmp cmp dword ptr [ebp - 4], eax
    je sub_1008CB57
    inc inc dword ptr [ebp - 28]
    mov mov eax, dword ptr [ebp - 28]
    cmp cmp eax, dword ptr [ebx + 12]
    jb sub_1008CB0A
    mov mov edx, dword ptr [ebp - 24]
    mov mov ecx, dword ptr [edi + 16]
    mov mov ecx, dword ptr [ecx + edx*4]
    mov mov edx, dword ptr [esi + 20]
    mov mov ecx, dword ptr [edx + ecx*4]
    mov mov eax, dword ptr [ebx + 16]
    mov mov edx, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + edx*4]
    inc inc dword ptr [ebp - 24]
    mov mov dword ptr [ecx + 48], eax
    mov mov eax, dword ptr [ebp - 24]
    cmp cmp eax, dword ptr [edi + 12]
    jb sub_1008CB2A
    and and dword ptr [edi], 0
    mov mov dword ptr [ebp - 80], 1
    mov mov eax, dword ptr [ebp - 36]
    mov mov edi, dword ptr [ebp - 72]
    inc inc dword ptr [ebp - 40]
    mov mov ecx, dword ptr [ebp - 40]
    cmp cmp ecx, dword ptr [ebp - 16]
    jb sub_1008C9BB
    add add dword ptr [ebp - 52], 4
    inc inc dword ptr [ebp - 56]
    dec dec dword ptr [ebp - 76]
    jne sub_1008C99D
    cmp cmp dword ptr [ebp - 80], 0
    je sub_1008CC60
    xor xor edi, edi
    cmp cmp dword ptr [esi + 8], edi
    jbe sub_1008CC56
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [eax + edi*4]
    jmp sub_1008CC4D
    mov mov edx, dword ptr [ecx + 48]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov eax, dword ptr [eax + 48]
    mov mov dword ptr [ecx + 48], eax
    mov mov eax, dword ptr [esi + 20]
    mov mov edx, dword ptr [ecx + 48]
    mov mov ebx, dword ptr [eax + edx*4]
    cmp cmp edx, dword ptr [ebx + 48]
    jne sub_1008CC58
    inc inc edi
    cmp cmp edi, dword ptr [esi + 8]
    jb sub_1008CC59
    mov mov ecx, esi
    call sub_1008B3AF
    inc inc dword ptr [ebp - 60]
    xor xor edi, edi
    jmp sub_1008C83B
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 60], eax
    pop pop ebx
    sete sete al
    mov mov esi, eax
    push push dword ptr [ebp - 44]
    call sub_100F7D0D
    pop pop ecx
    pop pop edi
    mov mov eax, esi
    pop pop esi
    leave leave
    ret ret
FUN_1008c376 ENDP
END
