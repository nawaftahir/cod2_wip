.686
.MODEL FLAT, C
EXTRN sub_1006C63B:PROC
EXTRN sub_1006C65A:PROC
EXTRN sub_1008547C:PROC
EXTRN sub_10085509:PROC
EXTRN sub_1008590C:PROC
EXTRN sub_100859A0:PROC
EXTRN sub_100A97D6:PROC
EXTRN sub_100A97E2:PROC
EXTRN sub_100A984E:PROC
EXTRN sub_100A98B6:PROC
EXTRN sub_100A98D6:PROC
EXTRN sub_100A98DE:PROC
EXTRN sub_100A98E6:PROC
EXTRN sub_100A98F6:PROC
EXTRN sub_100A9904:PROC
EXTRN sub_100A991C:PROC
EXTRN sub_100A9976:PROC
EXTRN sub_100A999A:PROC
EXTRN sub_100A99B6:PROC
EXTRN sub_100A99C2:PROC
EXTRN sub_100A99FE:PROC
EXTRN sub_100B9A0F:PROC
EXTRN sub_100B9A3A:PROC
.CODE
FUN_100a9583 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0108h
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov eax, dword ptr [edi + 0100h]
    xor xor ebx, ebx
    push push ebx
    mov mov dword ptr [ebp - 16], ebx
    mov mov dword ptr [ebp - 40], ebx
    mov mov dword ptr [ebp - 36], 1
    mov mov dword ptr [ebp - 32], 2
    mov mov dword ptr [ebp - 28], 3
    mov mov esi, dword ptr [eax]
    and and esi, 0FFFFFh
    push push esi
    lea lea ecx, [ebp - 40]
    push push ecx
    lea lea ecx, [ebp - 0108h]
    push push ecx
    lea lea ecx, [ebp - 16]
    push push ecx
    lea lea ecx, [ebp - 104]
    push push ecx
    push push 010115DB0h
    push push eax
    mov mov ecx, edi
    mov mov dword ptr [ebp - 8], ebx
    call sub_100B9A0F
    test test eax, eax
    je L0
    push push ebx
    push push esi
    lea lea eax, [ebp - 40]
    push push eax
    lea lea eax, [ebp - 0108h]
    push push eax
    lea lea eax, [ebp - 16]
    push push eax
    lea lea eax, [ebp - 104]
    push push eax
    push push 010115E10h
    push push dword ptr [edi + 0100h]
    mov mov ecx, edi
    call sub_100B9A3A
    test test eax, eax
    mov mov dword ptr [ebp - 8], 1
    jne sub_100A984E
    and and dword ptr [ebp - 24], 0
    cmp cmp dword ptr [ebp - 8], 0
    je L1
    mov mov eax, dword ptr [edi + 20]
    mov mov edx, dword ptr [ebp - 0108h]
    mov mov edx, dword ptr [eax + edx*4]
    mov mov ebx, dword ptr [ebp - 0F8h]
    mov mov ecx, dword ptr [edi + 16]
    mov mov eax, dword ptr [eax + ebx*4]
    mov mov edx, dword ptr [edx + 4]
    mov mov edx, dword ptr [ecx + edx*4]
    mov mov eax, dword ptr [eax + 4]
    mov mov ecx, dword ptr [ecx + eax*4]
    mov mov ecx, dword ptr [ecx + 4]
    test test ch, 2
    je L2
    mov mov dword ptr [ebp - 24], 1
    mov mov eax, 0300h
    test test dword ptr [edx + 4], eax
    je L3
    test test eax, ecx
    je L4
    mov mov dword ptr [ebp - 4], 1
    jmp sub_100A98B6
    push push 116
    call sub_1008590C
    test test eax, eax
    je L5
    mov mov ecx, eax
L0:
    call sub_1008547C
    mov mov ebx, eax
    jmp L6
    xor xor ebx, ebx
    test test ebx, ebx
    jne L7
    mov mov dword ptr [ebp - 4], 08007000Eh
    jmp sub_100A98DE
    mov mov eax, esi
    and and eax, 0FFFFFh
    cmp cmp dword ptr [ebp - 8], 0
    je sub_100A97D6
    or or eax, 070400000h
    jmp sub_100A97E2
    or or eax, 070300000h
    push push 0
    push push esi
    lea lea ecx, [esi + esi*2]
    push push ecx
    push push eax
    mov mov ecx, ebx
    call sub_100859A0
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A9904
    push push dword ptr [edi + 0100h]
    mov mov ecx, ebx
    call sub_10085509
    test test eax, eax
    mov mov dword ptr [ebp - 4], eax
    jl sub_100A991C
    and and dword ptr [ebp - 8], 0
    test test esi, esi
    jbe sub_100A98D6
    mov mov eax, esi
    shl shl eax, 3
    mov mov dword ptr [ebp - 20], eax
    mov mov eax, esi
    shl shl eax, 2
    mov mov dword ptr [ebp - 12], eax
    mov mov ecx, dword ptr [edi + 0100h]
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov edx, dword ptr [ebx + 16]
    shl shl eax, 2
    cmp cmp dword ptr [ebp - 24], 0
    mov mov ecx, dword ptr [eax + ecx]
L1:
    mov mov dword ptr [eax + edx], ecx
    mov mov edx, dword ptr [ebx + 8]
    lea lea ecx, [ebp + eax - 0F8h]
    mov mov dword ptr [ebp - 4], ecx
    je sub_100A98DE
L2:
    mov mov ecx, dword ptr [ecx]
    mov mov dword ptr [eax + edx], ecx
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx - 16]
    jmp sub_100A98F6
    mov mov ecx, dword ptr [ecx - 16]
    mov mov dword ptr [eax + edx], ecx
    mov mov ecx, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [ecx]
    mov mov edx, dword ptr [ebp - 12]
    mov mov eax, dword ptr [ebx + 8]
    inc inc dword ptr [ebp - 8]
    add add dword ptr [ebp - 12], 4
    mov mov dword ptr [edx + eax], ecx
    mov mov ecx, dword ptr [ebp - 4]
L3:
    mov mov edx, dword ptr [ebp - 20]
    mov mov eax, dword ptr [ebx + 8]
    mov mov ecx, dword ptr [ecx + 16]
    add add dword ptr [ebp - 20], 4
    cmp cmp dword ptr [ebp - 8], esi
    mov mov dword ptr [edx + eax], ecx
    jb sub_100A98E6
    mov mov eax, dword ptr [edi]
    push push 0
    push push ebx
    mov mov ecx, edi
    call call dword ptr [eax + 32]
    test test eax, eax
    je sub_100A9976
    mov mov dword ptr [ebp - 4], 1
    jmp sub_100A99B6
    xor xor eax, eax
    cmp cmp dword ptr [ebp - 16], eax
L5:
    jbe sub_100A999A
    mov mov ecx, dword ptr [ebp + eax*4 - 104]
    and and dword ptr [ecx], 0
    inc inc eax
    cmp cmp eax, dword ptr [ebp - 16]
L6:
    jb sub_100A999A
    mov mov ecx, dword ptr [edi + 0100h]
    test test ecx, ecx
    je sub_100A99C2
    push push 1
    call sub_1006C63B
    mov mov eax, dword ptr [edi + 0FCh]
    mov mov ecx, dword ptr [edi + 24]
    mov mov dword ptr [ecx + eax*4], ebx
    xor xor ebx, ebx
    and and dword ptr [ebp - 4], 0
    test test ebx, ebx
    je sub_100A99FE
    push push 1
    mov mov ecx, ebx
    call sub_1006C65A
    mov mov eax, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
FUN_100a9583 ENDP
END
