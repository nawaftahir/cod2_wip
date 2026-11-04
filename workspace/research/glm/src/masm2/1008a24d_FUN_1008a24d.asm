.686
.MODEL FLAT, C
EXTRN sub_10085465:PROC
EXTRN sub_1008A4C6:PROC
EXTRN sub_1008A51D:PROC
EXTRN sub_1008A52D:PROC
EXTRN sub_1008A52E:PROC
EXTRN sub_1008A532:PROC
EXTRN sub_1008A538:PROC
EXTRN sub_1008A609:PROC
EXTRN sub_1008A60A:PROC
EXTRN sub_1008A612:PROC
EXTRN sub_1008A61C:PROC
EXTRN sub_1008A626:PROC
EXTRN sub_1008A627:PROC
EXTRN sub_1008A62F:PROC
EXTRN sub_1008A630:PROC
EXTRN sub_1008A638:PROC
EXTRN sub_1008A63D:PROC
EXTRN sub_1008A64B:PROC
EXTRN sub_1008A661:PROC
EXTRN sub_1008A67D:PROC
EXTRN sub_1008A68D:PROC
EXTRN sub_1008A6B7:PROC
EXTRN sub_1008A6CF:PROC
EXTRN sub_1008A6E4:PROC
EXTRN sub_1008A6E7:PROC
EXTRN sub_1008A6FD:PROC
EXTRN sub_1008A716:PROC
EXTRN sub_1008A72D:PROC
.CODE
FUN_1008a24d PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 72
    mov mov eax, dword ptr [ecx + 20]
    mov mov edx, dword ptr [ebp + 12]
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
L0:
    push push esi
    mov mov esi, dword ptr [eax + edx*4]
    test test byte ptr [esi + 3], 080h
    mov mov eax, dword ptr [esi + 12]
    mov mov edx, dword ptr [ebx + 8]
    mov mov eax, dword ptr [edx + eax*4]
    push push edi
    mov mov dword ptr [ebp - 20], ecx
    mov mov dword ptr [ebp - 28], esi
    mov mov dword ptr [ebp - 32], eax
    mov mov dword ptr [ebp - 8], 4
    jne L3
    cmp cmp eax, 1
    jne L1
    test test byte ptr [ecx + 108], 4
    jne L4
    cmp cmp eax, eax
    jbe L2
    test test byte ptr [ecx + 108], 2
    jne L5
    mov mov eax, dword ptr [esi + 72]
    mov mov ecx, dword ptr [ecx + 24]
    mov mov ecx, dword ptr [ecx + eax*4]
    call sub_10085465
    test test eax, eax
    je L6
    mov mov dword ptr [ebp - 8], 1
    or or eax, -1
    mov mov esi, dword ptr [esi + 12]
    lea lea edi, [ebp - 56]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or eax, -1
    lea lea edi, [ebp - 72]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor edi, edi
    mov mov dword ptr [ebp - 4], 4
    mov mov dword ptr [ebp + 12], edi
    shl shl esi, 4
    mov mov eax, dword ptr [ebx + 24]
    mov mov eax, dword ptr [esi + eax]
L2:
    cmp cmp eax, -1
L3:
    mov mov dword ptr [ebp - 36], eax
    mov mov dword ptr [ebp - 24], edi
    je L10
    mov mov eax, dword ptr [ebx + 48]
    mov mov eax, dword ptr [esi + eax]
    cmp cmp eax, edi
    mov mov dword ptr [ebp - 16], edi
    mov mov dword ptr [ebp - 40], eax
    jbe L12
    mov mov eax, dword ptr [ebx + 52]
    mov mov eax, dword ptr [esi + eax]
    mov mov ecx, dword ptr [ebx + 56]
    lea lea eax, [ecx + eax*4]
    mov mov dword ptr [ebp - 12], eax
    mov mov eax, dword ptr [ebp - 12]
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edx, eax
    shr shr edx, 2
    mov mov ecx, dword ptr [ecx + edx*4]
    cmp cmp ecx, -1
    je L8
    mov mov dword ptr [ebp - 24], 1
    cmp cmp dword ptr [ebp + 16], ecx
    jne L13
    mov mov ecx, dword ptr [ebx + 20]
    mov mov edi, dword ptr [ecx + eax*4]
    cmp cmp edi, -1
    je L15
    cmp cmp dword ptr [ebp + edi*4 - 56], -1
    jne L16
    cmp cmp dword ptr [ebp - 8], 1
    jne L14
    cmp cmp dword ptr [ebp + 12], edi
    jne L17
    mov mov ecx, dword ptr [ebp - 20]
    push push edi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp - 36]
    push push ebx
    call L0
    cmp cmp eax, -1
    je L18
    inc inc dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 16]
    add add dword ptr [ebp - 12], 4
    cmp cmp eax, dword ptr [ebp - 40]
    jb L11
    jmp L19
    mov mov eax, dword ptr [ebp + 12]
    dec dec dword ptr [ebp - 4]
    mov mov dword ptr [ebp + edi*4 - 56], eax
    mov mov dword ptr [ebp + eax*4 - 72], edi
    xor xor edi, edi
    cmp cmp dword ptr [ebp - 24], edi
    jne sub_1008A4C6
    dec dec dword ptr [ebp - 4]
    inc inc dword ptr [ebp + 12]
    add add esi, 4
    cmp cmp dword ptr [ebp + 12], 4
    jb L9
    mov mov ecx, dword ptr [ebp - 4]
    shl shl ecx, 29
    cmp cmp ecx, dword ptr [ebp + 28]
    jae sub_1008A612
    xor xor eax, eax
    cmp cmp dword ptr [ebp + 20], edi
    jge sub_1008A51D
    test test byte ptr [ebp + 16], 1
    je sub_1008A52E
    jmp sub_1008A52D
    jle sub_1008A532
    test test byte ptr [ebp + 16], 1
    jne sub_1008A538
    xor xor eax, eax
    inc inc eax
    shl shl eax, 28
    or or ecx, eax
    cmp cmp ecx, dword ptr [ebp + 28]
    mov mov dword ptr [ebp + 20], ecx
    jae sub_1008A63D
    cmp cmp dword ptr [ebp + edi*4 - 72], -1
    jne sub_1008A630
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + 12]
    lea lea edx, [edi + eax*4]
    mov mov eax, dword ptr [ebx + 24]
    mov mov eax, dword ptr [eax + edx*4]
    cmp cmp eax, -1
    mov mov dword ptr [ebp + 12], eax
    je sub_1008A64B
    xor xor ebx, ebx
    cmp cmp dword ptr [ebp - 8], ebx
    jbe sub_1008A626
L8:
    mov mov ecx, dword ptr [ebp - 20]
    lea lea esi, [ebx + edi]
    and and esi, 3
    cmp cmp dword ptr [ebp - 32], 1
    jne sub_1008A60A
    test test byte ptr [ecx + 112], 2
    je sub_1008A609
    mov mov eax, dword ptr [ebp - 28]
    mov mov eax, dword ptr [eax + 72]
    mov mov edx, dword ptr [ecx + 24]
    mov mov eax, dword ptr [edx + eax*4]
    mov mov eax, dword ptr [eax]
L9:
    mov mov edx, eax
L10:
    and and edx, 0FFF00000h
    cmp cmp edx, 050000000h
L11:
    jne sub_1008A627
    and and eax, 0FFFFFh
    cmp cmp eax, 4
    jb sub_1008A638
    push push 3
    pop pop eax
    sub sub eax, esi
    mov mov esi, eax
    cmp cmp dword ptr [ebp + esi*4 - 56], -1
    jne sub_1008A661
    push push esi
    push push dword ptr [ebp + 16]
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
L16:
    call L7
    cmp cmp eax, -1
    je sub_1008A67D
    inc inc ebx
L17:
    cmp cmp ebx, dword ptr [ebp - 8]
    jb sub_1008A61C
    jmp sub_1008A68D
    mov mov dword ptr [ebp + esi*4 - 56], edi
    mov mov dword ptr [ebp + edi*4 - 72], esi
    cmp cmp dword ptr [ebp - 8], ebx
    je sub_1008A6E7
    mov mov eax, dword ptr [ebp + 8]
    test test byte ptr [eax + 96], 1
    je sub_1008A6B7
    cmp cmp dword ptr [ebp - 32], 1
    jbe sub_1008A6CF
    mov mov ecx, dword ptr [ebp + 20]
L18:
    shl shl ebx, 24
    add add ecx, ebx
    cmp cmp ecx, dword ptr [ebp + 28]
    mov mov dword ptr [ebp + 20], ecx
    jae sub_1008A6FD
    jmp sub_1008A6E4
    mov mov ecx, dword ptr [ebp + 20]
    mov mov ebx, dword ptr [ebp + 8]
    inc inc edi
    cmp cmp edi, 4
    jb sub_1008A62F
L19:
    mov mov edi, dword ptr [ebp + 24]
    test test edi, edi
    je sub_1008A716
    lea lea esi, [ebp - 72]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    mov mov eax, ecx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 24
    or or eax, -1
    jmp sub_1008A72D
FUN_1008a24d ENDP
END
