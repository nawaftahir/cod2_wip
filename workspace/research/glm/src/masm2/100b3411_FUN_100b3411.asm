.686
.MODEL FLAT, C
EXTRN sub_1008B175:PROC
EXTRN sub_1008B24A:PROC
EXTRN sub_1008B271:PROC
EXTRN sub_1008B2A2:PROC
EXTRN sub_100B361A:PROC
EXTRN sub_100B361F:PROC
EXTRN sub_100B3638:PROC
EXTRN sub_100B363C:PROC
EXTRN sub_100B3641:PROC
EXTRN sub_100B3644:PROC
EXTRN sub_100B3661:PROC
EXTRN sub_100B3663:PROC
EXTRN sub_100B3666:PROC
EXTRN sub_100B3674:PROC
EXTRN sub_100B3685:PROC
EXTRN sub_100B36F4:PROC
EXTRN sub_100B370C:PROC
EXTRN sub_100B372E:PROC
EXTRN sub_100B3762:PROC
EXTRN sub_100B377D:PROC
EXTRN sub_100B37A8:PROC
EXTRN sub_100B37AE:PROC
EXTRN sub_100B37DC:PROC
.CODE
FUN_100b3411 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 96
    push push esi
    mov mov esi, ecx
    xor xor edx, edx
    xor xor eax, eax
    cmp cmp dword ptr [esi + 0158h], edx
    jne L8
    push push ebx
    push push edi
    push push 16
    pop pop ecx
    lea lea edi, [ebp - 96]
    rep stosd rep stosd dword ptr es:[edi], eax
    lea lea edi, [ebp - 32]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor eax, eax
    lea lea edi, [esi + 0218h]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    push push 8
    xor xor eax, eax
    pop pop ecx
    lea lea edi, [esi + 01F8h]
    rep stosd rep stosd dword ptr es:[edi], eax
    cmp cmp dword ptr [esi + 8], edx
    mov mov dword ptr [ebp - 4], edx
    mov mov dword ptr [ebp - 12], edx
    mov mov dword ptr [ebp - 8], edx
    jbe L3
    mov mov eax, dword ptr [esi + 20]
    mov mov ecx, dword ptr [ebp - 8]
    mov mov edi, dword ptr [eax + ecx*4]
    mov mov eax, dword ptr [edi + 4]
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    test test al, 32
    je L1
    push push dword ptr [edi + 108]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 84]
    push push dword ptr [edi + 108]
    mov mov ebx, eax
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 88]
    mov mov ecx, ebx
    sub sub ecx, 11
    je L0
    dec dec ecx
    dec dec ecx
    jne L4
    test test eax, eax
    jne L5
    cmp cmp dword ptr [edi + 16], eax
    je L6
    cmp cmp dword ptr [ebp - 12], eax
    jne L7
    push push 010115BE8h
    push push 011B0h
    push push dword ptr [edi + 96]
    push push esi
    call sub_1008B175
    xor xor eax, eax
    add add esp, 16
    inc inc eax
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 4], eax
    jmp sub_100B361A
    cmp cmp eax, 4
    jae sub_100B361F
    mov mov ecx, dword ptr [edi + 16]
    shl shl eax, 2
    add add ecx, eax
    mov mov dword ptr [ebp + ecx*4 - 96], 1
    mov mov ecx, dword ptr [edi + 96]
    mov mov dword ptr [ebp + eax - 32], ecx
    jmp sub_100B3638
    test test al, 16
    je sub_100B363C
    test test ah, 2
    jne sub_100B3641
    push push dword ptr [edi + 108]
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 84]
    push push dword ptr [edi + 108]
    mov mov ebx, eax
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 88]
    cmp cmp ebx, 6
    je sub_100B3644
    cmp cmp ebx, 11
    jne sub_100B3661
    cmp cmp eax, 2
    jae sub_100B3666
    lea lea eax, [esi + eax*4 + 0218h]
    jmp sub_100B3663
    cmp cmp eax, 8
    jae sub_100B3674
    lea lea eax, [esi + eax*4 + 01F8h]
    mov mov edi, dword ptr [edi + 16]
    lea lea ecx, [edi + 1]
    cmp cmp dword ptr [eax], ecx
    jae sub_100B3685
    mov mov dword ptr [eax], ecx
    inc inc dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, dword ptr [esi + 8]
    jb L2
    xor xor edx, edx
    xor xor ebx, ebx
    inc inc ebx
    mov mov dword ptr [ebp - 8], edx
    mov mov dword ptr [ebp - 16], ebx
    xor xor edi, edi
    mov mov eax, edi
L0:
    xor xor ecx, ecx
    shl shl eax, 4
    lea lea eax, [ebp + eax - 96]
    mov mov dword ptr [ebp - 12], 4
    xor xor edx, edx
    cmp cmp dword ptr [eax], edx
    setne setne dl
    add add eax, 4
    add add ecx, edx
    dec dec dword ptr [ebp - 12]
    jne sub_100B36F4
    test test ecx, ecx
    jne sub_100B3762
    test test edi, edi
    jne sub_100B372E
    push push 010115BA8h
    push push 011B2h
    push push dword ptr [ebp - 32]
    push push esi
    call sub_1008B24A
    add add esp, 16
    mov mov dword ptr [ebp - 4], ebx
    mov mov dword ptr [ebp - 8], ebx
    inc inc edi
L2:
    cmp cmp edi, 4
    jb sub_100B370C
    cmp cmp dword ptr [ebp - 16], 0
    jne sub_100B377D
    push push 010115B70h
    push push 011BAh
    push push 0
    push push esi
    call sub_1008B271
    add add esp, 16
    mov mov dword ptr [ebp - 4], ebx
    mov mov eax, dword ptr [ebp - 4]
    neg neg eax
    sbb sbb eax, eax
    pop pop edi
    and and eax, 080004005h
    pop pop ebx
    pop pop esi
    leave leave
    ret ret
    cmp cmp ecx, 4
L5:
    je sub_100B37DC
    push push edi
    push push 010115B48h
    push push 011B1h
    push push dword ptr [ebp + edi*4 - 32]
    push push esi
L7:
    call sub_1008B2A2
    add add esp, 20
    mov mov dword ptr [ebp - 4], ebx
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100B37A8
    and and dword ptr [ebp - 16], 0
    jmp sub_100B37AE
FUN_100b3411 ENDP
END
