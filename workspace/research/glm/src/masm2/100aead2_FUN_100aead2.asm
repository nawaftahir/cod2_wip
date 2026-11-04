.686
.MODEL FLAT, C
EXTRN sub_1006C882:PROC
EXTRN sub_1008553E:PROC
EXTRN sub_100855FD:PROC
EXTRN sub_100859CC:PROC
EXTRN sub_10085A46:PROC
EXTRN sub_10085A8D:PROC
EXTRN sub_10085B15:PROC
EXTRN sub_10085FE2:PROC
EXTRN sub_10086050:PROC
EXTRN sub_1008645D:PROC
EXTRN sub_1008649A:PROC
EXTRN sub_100864EF:PROC
EXTRN sub_1008B557:PROC
EXTRN sub_1008B578:PROC
EXTRN sub_100AE908:PROC
EXTRN sub_100AE926:PROC
EXTRN sub_100AE9CD:PROC
EXTRN sub_100AEA53:PROC
EXTRN sub_100AEA7A:PROC
EXTRN sub_100AEFAE:PROC
EXTRN sub_100AEFD3:PROC
EXTRN sub_100AEFD8:PROC
EXTRN sub_100AEFDB:PROC
EXTRN sub_100AEFE8:PROC
EXTRN sub_100AF005:PROC
EXTRN sub_100AF02E:PROC
EXTRN sub_100AF03C:PROC
EXTRN sub_100AF046:PROC
EXTRN sub_100AF070:PROC
EXTRN sub_100AF076:PROC
EXTRN sub_100AF0B4:PROC
EXTRN sub_100AF0CD:PROC
EXTRN sub_100AF0FD:PROC
EXTRN sub_100AF10B:PROC
EXTRN sub_100AF10C:PROC
EXTRN sub_100AF11A:PROC
EXTRN sub_100AF11F:PROC
EXTRN sub_100AF12F:PROC
EXTRN sub_100AF136:PROC
EXTRN sub_100AF13B:PROC
EXTRN sub_100AF13E:PROC
EXTRN sub_100AF140:PROC
EXTRN sub_100AF148:PROC
EXTRN sub_100AF177:PROC
EXTRN sub_100AF18B:PROC
EXTRN sub_100AF1D7:PROC
EXTRN sub_100AF1EE:PROC
EXTRN sub_100AF236:PROC
EXTRN sub_100AF259:PROC
EXTRN sub_100AF290:PROC
EXTRN sub_100AF293:PROC
EXTRN sub_100AF30C:PROC
EXTRN sub_100AF363:PROC
EXTRN sub_100AF36B:PROC
EXTRN sub_100AF39F:PROC
EXTRN sub_100AF3F8:PROC
EXTRN sub_100AF402:PROC
EXTRN sub_100AF409:PROC
EXTRN sub_100AF43F:PROC
.CODE
FUN_100aead2 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 76
    push push ebx
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 12], eax
    push push esi
    push push edi
    mov mov esi, ecx
    mov mov dword ptr [ebp - 4], eax
    mov mov dword ptr [ebp - 12], eax
    jbe L10
    mov mov eax, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 8], eax
    mov mov eax, dword ptr [ebp - 8]
    mov mov edi, dword ptr [eax]
    test test edi, edi
    je L10
    mov mov ebx, dword ptr [edi]
    push push 1
    push push 1
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 36]
    push push eax
    lea lea eax, [ebp - 20]
    push push eax
    push push edi
    push push 4
    push push dword ptr [ebp + 16]
    mov mov dword ptr [ebp - 32], ebx
    and and ebx, 0FFFFFh
    mov mov ecx, esi
    mov mov dword ptr [ebp - 24], ebx
    call sub_100AE9CD
    cmp cmp dword ptr [ebp - 16], 0
    jne L0
    cmp cmp ebx, 2
    jne L15
    mov mov ebx, dword ptr [edi + 8]
    mov mov eax, dword ptr [esi + 0220h]
    mov mov ecx, dword ptr [esi + 022Ch]
    push push 0
    push push 1
    add add ebx, 8
    push push ebx
    push push eax
    push push ecx
    mov mov ecx, esi
    call sub_100AE908
    push push 0
    push push 1
    add add ebx, 4
    push push ebx
    push push dword ptr [esi + 0220h]
    mov mov ecx, esi
    push push dword ptr [esi + 022Ch]
    mov mov dword ptr [ebp - 28], eax
    call sub_100AE926
    cmp cmp dword ptr [ebp - 28], 0
    mov mov dword ptr [ebp - 44], eax
    je sub_100AEFD3
    test test eax, eax
    je sub_100AEFDB
    xor xor ebx, ebx
    inc inc ebx
    push push ebx
    push push ebx
    lea lea eax, [ebp - 40]
    push push eax
    lea lea eax, [ebp - 36]
    push push eax
    lea lea eax, [ebp - 20]
    push push eax
    push push dword ptr [ebp - 28]
    mov mov ecx, esi
    push push 4
    push push dword ptr [ebp + 16]
    call sub_100AEA53
    cmp cmp dword ptr [ebp - 40], 0
    je sub_100AF005
    push push ebx
    push push ebx
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 36]
    push push eax
    lea lea eax, [ebp - 20]
    push push eax
    push push dword ptr [ebp - 44]
    mov mov ecx, esi
    push push 4
    push push dword ptr [ebp + 16]
    call sub_100AEA7A
    mov mov eax, dword ptr [ebp - 40]
    cmp cmp eax, dword ptr [ebp - 16]
    jne sub_100AF02E
    mov mov ebx, dword ptr [ebp - 24]
    jmp L1
    cmp cmp ebx, 2
    je sub_100AF03C
    cmp cmp dword ptr [ebp - 16], 0
    je sub_100AF046
    push push 3
    xor xor edx, edx
    pop pop eax
    cmp cmp ebx, eax
    mov mov dword ptr [ebp - 4], edx
    jne L6
    mov mov eax, dword ptr [ebp - 32]
    and and eax, 0FFF00000h
    cmp cmp eax, 060F00000h
    je L2
    cmp cmp eax, 060A00000h
    jne sub_100AF070
    mov mov eax, dword ptr [edi + 8]
    mov mov ebx, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 36], 1
    add add eax, 12
    mov mov ecx, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + ecx*4]
    cmp cmp dword ptr [ecx + 16], edx
    je L3
    and and dword ptr [ebp - 36], 0
    mov mov ecx, dword ptr [ecx + 60]
    test test ecx, ecx
    je L5
    cmp cmp ecx, 060000h
    jne sub_100AF0CD
    inc inc edx
    add add eax, 4
    cmp cmp edx, 3
    jb L4
    cmp cmp dword ptr [ebp - 36], 0
    je sub_100AF0B4
    mov mov eax, dword ptr [esi + 0C8h]
    and and eax, 0FFFFh
    cmp cmp eax, 0102h
    jb sub_100AF0FD
    push push 116
    call sub_100859CC
    xor xor ebx, ebx
    cmp cmp eax, ebx
    je L7
    mov mov ecx, eax
    call sub_1008553E
    mov mov dword ptr [ebp - 4], eax
    jmp L8
    mov mov dword ptr [ebp - 4], ebx
    mov mov ecx, dword ptr [ebp - 4]
    cmp cmp ecx, ebx
    je sub_100AF177
    push push ebx
    push push 4
    push push 6
    push push 072600003h
    call sub_10085A46
    mov mov edi, eax
    cmp cmp edi, ebx
    jl sub_100AF11F
    jmp L16
    push push 2
    pop pop ecx
    cmp cmp ebx, ecx
    jne sub_100AF11A
    mov mov edx, dword ptr [ebp - 32]
    and and edx, 0FFF00000h
    cmp cmp edx, 060500000h
    jne sub_100AF12F
    xor xor ebx, ebx
    xor xor edi, edi
    inc inc edi
    mov mov dword ptr [ebp - 68], eax
    mov mov dword ptr [ebp - 64], ebx
    mov mov dword ptr [ebp - 76], edi
    mov mov dword ptr [ebp - 72], ecx
    mov mov dword ptr [ebp - 36], edi
    test test ebx, ebx
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ebp - 28]
    je L9
    mov mov eax, dword ptr [ebp - 44]
    mov mov eax, dword ptr [eax + 8]
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [eax + 16]
    cmp cmp ecx, dword ptr [ebp + ebx*4 - 68]
    je L13
    and and dword ptr [ebp - 36], 0
    cmp cmp ecx, dword ptr [ebp + ebx*4 - 76]
    je L14
    xor xor edi, edi
    cmp cmp dword ptr [eax + 60], 0
    jne sub_100AF1D7
    inc inc ebx
    cmp cmp ebx, 2
    jb L12
    cmp cmp dword ptr [ebp - 36], 0
    jne sub_100AEFAE
    test test edi, edi
    je sub_100AF18B
    push push 116
    call sub_10085A8D
    test test eax, eax
    je sub_100AEFD8
    mov mov ecx, eax
    call sub_100855FD
    mov mov dword ptr [ebp - 4], eax
    jmp sub_100AEFE8
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 4], 0
    je sub_100AF236
    mov mov ecx, dword ptr [ebp - 4]
    neg neg edi
    push push 0
    sbb sbb edi, edi
    push push 4
    and and edi, 0100000h
    push push 4
    add add edi, 072700002h
    push push edi
    call sub_10085B15
    mov mov edi, eax
    test test edi, edi
    jl sub_100AF1EE
    xor xor ebx, ebx
    xor xor eax, eax
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + ecx]
    mov mov edx, dword ptr [edx + 16]
    mov mov dword ptr [eax + edx], ecx
    add add eax, 4
    cmp cmp eax, 16
    jb sub_100AF076
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [ecx + 8]
    mov mov edx, dword ptr [ebp - 16]
    mov mov edx, dword ptr [edx + 8]
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ecx]
    mov mov ecx, dword ptr [eax + ecx*4]
    mov mov edx, dword ptr [edx + 12]
    mov mov eax, dword ptr [eax + edx*4]
    mov mov edx, dword ptr [esi + 16]
    mov mov dword ptr [ebp - 48], eax
    mov mov eax, dword ptr [ecx + 4]
    mov mov eax, dword ptr [edx + eax*4]
    test test byte ptr [eax + 5], 8
    je sub_100AF10B
    mov mov edi, dword ptr [ecx + 12]
    cmp cmp edi, 3
    mov mov dword ptr [ebp - 36], edi
    ja sub_100AF10C
    mov mov eax, dword ptr [ebp + 16]
    cmp cmp dword ptr [eax + edi*4], ebx
    je sub_100AF13E
    mov mov edi, 080004005h
    jmp sub_100AF259
    mov mov eax, dword ptr [ebp - 20]
    jmp sub_100AF13B
    mov mov edx, dword ptr [ebp + 16]
L6:
    cmp cmp dword ptr [edx + eax*4], ebx
    je sub_100AF148
    inc inc eax
    cmp cmp eax, 4
    jb sub_100AF140
    cmp cmp eax, 4
    je sub_100AF136
    mov mov dword ptr [ebp - 36], eax
    mov mov dword ptr [ecx + 12], eax
    mov mov edi, eax
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push edi
    push push dword ptr [esi + 080h]
    mov mov ecx, esi
    call sub_1008649A
    cmp cmp eax, -1
    mov mov dword ptr [ebp - 56], eax
    je sub_100AF30C
    mov mov ecx, dword ptr [esi + 20]
    mov mov ebx, dword ptr [ecx + eax*4]
    push push dword ptr [ebp - 48]
    mov mov ecx, ebx
    call sub_10085FE2
    mov mov eax, edi
    shl shl eax, 8
    or or eax, 3
    mov mov dword ptr [ebx + 108], eax
L7:
    mov mov eax, dword ptr [ebp - 24]
    mov mov dword ptr [ebx + 12], edi
    xor xor ebx, ebx
    test test eax, eax
    jbe sub_100AF290
    shl shl eax, 2
    mov mov dword ptr [ebp - 32], eax
    push push ecx
    fldz fldz
    push push ecx
    fstp fstp qword ptr [esp]
    push push ebx
    push push dword ptr [ebp - 20]
    mov mov ecx, esi
    push push dword ptr [esi + 080h]
    call sub_100864EF
    mov mov ecx, eax
    cmp cmp ecx, -1
    mov mov dword ptr [ebp - 60], ecx
    je sub_100AF363
    mov mov eax, dword ptr [esi + 20]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ecx + 8]
    mov mov ecx, dword ptr [ebp - 24]
    push push dword ptr [ebp - 48]
    shl shl ecx, 2
    mov mov ecx, dword ptr [ecx + edx]
    mov mov eax, dword ptr [eax + ecx*4]
    mov mov ecx, edi
    mov mov dword ptr [ebp - 52], eax
    call sub_10086050
    mov mov eax, dword ptr [ebp - 20]
    mov mov edx, dword ptr [ebp - 56]
    mov mov dword ptr [edi + 12], eax
    mov mov eax, dword ptr [ebp - 52]
    mov mov dword ptr [edi + 16], ebx
    mov mov eax, dword ptr [eax + 60]
    mov mov dword ptr [edi + 60], eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax + 8]
    mov mov dword ptr [ecx + ebx*4], edx
    mov mov edx, dword ptr [ebp - 32]
    mov mov eax, dword ptr [eax + 8]
    mov mov ecx, dword ptr [ebp - 60]
    add add dword ptr [ebp - 32], 4
    inc inc ebx
    cmp cmp ebx, dword ptr [ebp - 24]
    mov mov dword ptr [edx + eax], ecx
    jb sub_100AF293
    mov mov edi, dword ptr [ebp - 36]
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ebp + 16]
    mov mov dword ptr [ecx + edi*4], eax
    push push eax
    mov mov ecx, esi
    call sub_1008645D
    mov mov edi, eax
    test test edi, edi
    jl sub_100AF36B
    mov mov eax, dword ptr [ebp - 8]
    and and dword ptr [eax], 0
    and and dword ptr [ebp - 4], 0
    inc inc dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp - 12]
    add add dword ptr [ebp - 8], 4
    cmp cmp eax, dword ptr [ebp + 12]
    jb L11
    xor xor edi, edi
    mov mov ecx, dword ptr [ebp - 4]
    test test ecx, ecx
    je sub_100AF39F
    push push 1
    call sub_1006C882
    mov mov eax, edi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
    push push 010117458h
L10:
    jmp sub_100AF3F8
    mov mov eax, dword ptr [esi + 0C8h]
    mov mov ecx, dword ptr [ebp - 12]
    and and eax, 0FFh
    push push eax
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    push push 010117400h
L13:
    push push 011B8h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B557
    add add esp, 20
    jmp sub_100AF43F
    push push 0101173A8h
    mov mov ecx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebp + 8]
    mov mov eax, dword ptr [eax + ecx*4]
    push push 011B7h
    push push dword ptr [eax + 60]
    push push esi
    call sub_1008B578
    add add esp, 16
    mov mov edi, 080004005h
    jmp sub_100AF409
    mov mov edi, 08007000Eh
    jmp sub_100AF402
FUN_100aead2 ENDP
END
