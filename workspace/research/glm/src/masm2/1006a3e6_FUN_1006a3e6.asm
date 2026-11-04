.686
.MODEL FLAT, C
EXTRN sub_10067FC2:PROC
EXTRN sub_10069A8A:PROC
EXTRN sub_1006A6CE:PROC
EXTRN sub_1006A6F7:PROC
EXTRN sub_1006A756:PROC
EXTRN sub_1006A76A:PROC
EXTRN sub_1006A7B5:PROC
EXTRN sub_1006A7C9:PROC
EXTRN sub_1006A82E:PROC
EXTRN sub_1006A84D:PROC
EXTRN sub_1006A870:PROC
EXTRN sub_1006A891:PROC
EXTRN sub_1006A8AC:PROC
EXTRN sub_1006A8BF:PROC
EXTRN sub_1006A8C9:PROC
EXTRN sub_1006A8D3:PROC
EXTRN sub_1006A8D9:PROC
EXTRN sub_1006A8EE:PROC
EXTRN sub_1006A944:PROC
EXTRN sub_1006A94E:PROC
EXTRN sub_100840A0:PROC
EXTRN sub_1008411D:PROC
EXTRN sub_100841F2:PROC
EXTRN sub_10084254:PROC
EXTRN sub_10084273:PROC
EXTRN sub_10084296:PROC
EXTRN sub_100842BA:PROC
EXTRN sub_100842D5:PROC
EXTRN sub_100842F2:PROC
EXTRN sub_10084381:PROC
EXTRN sub_1008443B:PROC
EXTRN sub_100844B3:PROC
EXTRN sub_100F6A00:PROC
EXTRN sub_100F78F9:PROC
EXTRN sub_100F7916:PROC
EXTRN sub_100F7B31:PROC
EXTRN sub_100F7B39:PROC
.CODE
FUN_1006a3e6 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 80
    push push ebx
    push push esi
    push push edi
    mov mov esi, ecx
    push push 047554244h
    lea lea ecx, [ebp - 40]
    call sub_100840A0
    push push 10
    pop pop ecx
    push push 40
    xor xor eax, eax
    lea lea edi, [ebp - 80]
    rep stosd rep stosd dword ptr es:[edi], eax
    pop pop eax
    xor xor ebx, ebx
    push push ebx
    push push 1
    push push eax
    mov mov dword ptr [ebp - 80], eax
    lea lea eax, [ebp - 80]
    push push eax
    lea lea ecx, [ebp - 40]
    mov mov dword ptr [ebp - 12], ebx
    mov mov dword ptr [ebp - 8], ebx
    call sub_1008411D
    cmp cmp eax, ebx
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006A6F7
    mov mov eax, dword ptr [esi + 52]
    jmp L0
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L1
    cmp cmp dword ptr [ecx + 4], 18
    je L2
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
    jne L1
    jmp L3
    mov mov ebx, dword ptr [eax + 8]
    test test ebx, ebx
    mov mov eax, ebx
    je L4
    inc inc dword ptr [ebp - 60]
    mov mov eax, dword ptr [eax + 12]
    test test eax, eax
    jne L4
    mov mov eax, dword ptr [ebp - 60]
    test test eax, eax
    je L7
    shl shl eax, 2
    push push eax
    call sub_100F78F9
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 12], edi
    je L5
    mov mov ecx, dword ptr [ebp - 60]
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov eax, dword ptr [ebp - 60]
    shl shl eax, 3
    push push eax
    call sub_100F7916
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp - 8], eax
    jne L6
L0:
    mov mov dword ptr [ebp - 4], 08007000Eh
    jmp sub_1006A76A
    mov mov ecx, dword ptr [ebp - 60]
    mov mov edi, dword ptr [ebp - 8]
    shl shl ecx, 3
    mov mov dword ptr [ebp - 24], ecx
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
L3:
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    test test ebx, ebx
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov edi, ebx
    je L8
    mov mov eax, dword ptr [ebp - 60]
    mov mov ecx, dword ptr [ebp - 8]
    lea lea ebx, [ecx + eax*8 - 6]
L4:
    or or word ptr [ebx], 0FFFFh
    mov mov ax, word ptr [edi + 36]
    mov mov word ptr [ebx - 2], ax
    mov mov eax, dword ptr [edi + 88]
    mov mov dword ptr [ebx + 2], eax
    mov mov eax, dword ptr [edi + 32]
    test test eax, eax
    je L10
    lea lea ecx, [ebp - 20]
    push push ecx
    push push 7
    push push -1
    push push eax
    lea lea ecx, [ebp - 40]
    call sub_100841F2
    test test eax, eax
    jl sub_1006A7C9
    mov mov ecx, dword ptr [ebp - 20]
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 68], eax
    mov mov dword ptr [ebp - 16], eax
    jbe L11
    mov mov edx, dword ptr [ebp - 12]
    cmp cmp dword ptr [edx + eax*4], ecx
    je L12
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 68]
    mov mov dword ptr [ebp - 16], eax
    jb L11
    mov mov edx, dword ptr [ebp - 68]
    cmp cmp eax, edx
    jne L13
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [eax + edx*4], ecx
    inc inc dword ptr [ebp - 68]
L5:
    mov mov eax, dword ptr [ebp - 16]
    mov mov word ptr [ebx], ax
    mov mov edi, dword ptr [edi + 12]
    sub sub ebx, 8
    test test edi, edi
    jne L9
    mov mov eax, dword ptr [ebp - 68]
    test test eax, eax
    je sub_1006A6CE
    lea lea ecx, [ebp - 64]
    push push ecx
    push push 1
    shl shl eax, 2
    push push eax
    push push dword ptr [ebp - 12]
    lea lea ecx, [ebp - 40]
L6:
    call sub_10084254
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006A82E
    lea lea eax, [ebp - 56]
    push push eax
    push push 1
    push push dword ptr [ebp - 24]
    lea lea ecx, [ebp - 40]
    push push dword ptr [ebp - 8]
    call sub_10084273
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006A84D
    mov mov eax, dword ptr [esi + 116]
    test test eax, eax
    je sub_1006A756
    lea lea ecx, [ebp - 44]
    push push ecx
    push push 7
    push push -1
    push push eax
    lea lea ecx, [ebp - 40]
    call sub_10084296
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006A870
    mov mov eax, dword ptr [esi + 108]
    test test eax, eax
    je sub_1006A7B5
    lea lea ecx, [ebp - 72]
    push push ecx
    push push 5
    push push dword ptr [esi + 112]
    lea lea ecx, [ebp - 40]
    push push eax
    call sub_100842BA
    test test eax, eax
    jl sub_1006A891
    push push 0
    push push 5
    push push 1
    push push 01019166Eh
    lea lea ecx, [ebp - 40]
    call sub_100842D5
    test test eax, eax
    jl sub_1006A8AC
    lea lea eax, [ebp - 76]
    push push eax
    push push 5
    push push -1
    push push 01010F030h
    lea lea ecx, [ebp - 40]
    call sub_100842F2
    test test eax, eax
    jl sub_1006A8C9
    lea lea ecx, [ebp - 40]
    call sub_1008443B
    mov mov edi, eax
L7:
    cmp cmp edi, 08000h
    ja sub_1006A8BF
    push push edi
    mov mov ecx, esi
    call sub_10069A8A
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006A8EE
    mov mov ecx, dword ptr [esi + 92]
    mov mov eax, dword ptr [esi + 88]
    lea lea ecx, [ecx*4 - 4]
    push push ecx
    lea lea ecx, [eax + 4]
    push push ecx
    lea lea eax, [eax + edi*4 + 4]
    push push eax
    call sub_100F6A00
    xor xor ecx, ecx
    add add esp, 12
    cmp cmp dword ptr [ebp - 60], ecx
    jbe sub_1006A8D3
    mov mov eax, dword ptr [ebp - 8]
    add add eax, 4
    mov mov edx, dword ptr [esi + 104]
    add add edx, edi
    shl shl edx, 2
    add add dword ptr [eax], edx
    inc inc ecx
    add add eax, 8
    cmp cmp ecx, dword ptr [ebp - 60]
    jb sub_1006A8D9
    mov mov eax, dword ptr [esi + 88]
    push push edi
    add add eax, 4
    push push eax
    lea lea ecx, [ebp - 40]
    call sub_100844B3
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_1006A944
    add add dword ptr [esi + 92], edi
    mov mov eax, dword ptr [esi + 92]
    add add dword ptr [esi + 104], edi
    mov mov dword ptr [esi + 100], eax
    jmp sub_1006A94E
    push push 01010F064h
    push push 07EEh
    lea lea eax, [esi + 16]
    push push eax
    push push dword ptr [esi]
    call sub_10067FC2
    add add esp, 16
    and and dword ptr [ebp - 4], 0
    push push dword ptr [ebp - 12]
    call sub_100F7B31
    push push dword ptr [ebp - 8]
    call sub_100F7B39
    pop pop ecx
    pop pop ecx
    lea lea ecx, [ebp - 40]
    call sub_10084381
    mov mov eax, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_1006a3e6 ENDP
END
