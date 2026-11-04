.686
.MODEL FLAT, C
EXTRN sub_10086AE2:PROC
EXTRN sub_10086ECB:PROC
EXTRN sub_10089A92:PROC
EXTRN sub_1008AB0D:PROC
EXTRN sub_1008AD01:PROC
EXTRN sub_1008AED9:PROC
EXTRN sub_100F79D3:PROC
EXTRN sub_100F79EB:PROC
EXTRN sub_100F7AA6:PROC
EXTRN sub_100F7ABE:PROC
EXTRN sub_100F7AD6:PROC
EXTRN sub_100F7B87:PROC
EXTRN sub_100F7B8F:PROC
EXTRN sub_100F7B97:PROC
EXTRN fp_10110450:DWORD
.CODE
FUN_100910df PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 112
    push ebx
    push esi
    push edi
    xor edi, edi
    mov ebx, ecx
    mov dword ptr [ebp - 16], edi
    mov dword ptr [ebp - 4], edi
    mov dword ptr [ebp - 8], edi
    call sub_10086ECB
    mov esi, eax
    cmp esi, edi
    jl L30
    mov ecx, ebx
    call sub_1008AD01
    mov esi, eax
    cmp esi, edi
    jl L30
    mov eax, dword ptr [ebx + 108]
    test eax, 00C000000h
    je L8
    xor eax, eax
    cmp dword ptr [ebx + 12], edi
    jbe L1
L0:
    mov ecx, dword ptr [ebx + 24]
    mov ecx, dword ptr [ecx + eax*4]
    inc eax
    mov dword ptr [ecx + 44], edi
    cmp eax, dword ptr [ebx + 12]
    jb L0
L1:
    mov edi, dword ptr [ebx + 12]
L2:
    test edi, edi
    jbe L7
    mov eax, dword ptr [ebx + 24]
    dec edi
    mov eax, dword ptr [eax + edi*4]
    mov ecx, dword ptr [eax]
    mov esi, ecx
    and esi, 0FFF00000h
    mov dword ptr [ebp - 24], edi
    je L2
    mov edx, dword ptr [eax + 44]
    and ecx, 0F0000000h
    cmp ecx, 060000000h
    je L3
    cmp esi, 011000000h
    jne L4
L3:
    lea ecx, [edx + 1]
    inc edx
    mov dword ptr [eax + 44], ecx
    inc edx
L4:
    xor esi, esi
    cmp dword ptr [eax + 20], esi
    jbe L2
L5:
    mov ecx, dword ptr [eax + 24]
    mov ecx, dword ptr [ecx + esi*4]
    mov edi, dword ptr [ebx + 24]
    mov ecx, dword ptr [edi + ecx*4]
    cmp dword ptr [ecx + 44], edx
    jae L6
    mov dword ptr [ecx + 44], edx
L6:
    inc esi
    cmp esi, dword ptr [eax + 20]
    jb L5
    mov edi, dword ptr [ebp - 24]
    jmp L2
L7:
    xor edi, edi
L8:
    cmp dword ptr [ebx + 12], edi
    mov dword ptr [ebp - 24], edi
    mov dword ptr [ebp - 12], edi
    jbe L14
L9:
    mov ecx, dword ptr [ebp - 12]
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [eax]
    and ecx, 0FFF00000h
    mov dword ptr [ebp - 20], ecx
    je L13
    mov ecx, dword ptr [eax + 16]
    mov ecx, dword ptr [ecx]
    mov edx, dword ptr [ebx + 20]
    mov esi, dword ptr [edx + ecx*4]
    mov edi, dword ptr [ebx + 16]
    mov dword ptr [ebp - 28], esi
    mov esi, dword ptr [esi + 4]
    mov esi, dword ptr [edi + esi*4]
    test byte ptr [esi + 4], 8
    jne L12
    cmp dword ptr [ebp - 20], 020700000h
    je L10
    cmp dword ptr [ebp - 20], 020800000h
    je L10
    cmp dword ptr [ebp - 20], 011500000h
    je L10
    mov ecx, dword ptr [ebp - 28]
    jmp L11
L10:
    mov ecx, dword ptr [eax + 8]
    mov ecx, dword ptr [ecx]
    mov ecx, dword ptr [edx + ecx*4]
L11:
    mov ecx, dword ptr [ecx + 20]
L12:
    xor edi, edi
    cmp ecx, -1
    mov dword ptr [eax + 52], ecx
    je L13
    mov dword ptr [ebp - 24], 1
L13:
    inc dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 12]
    cmp eax, dword ptr [ebx + 12]
    jb L9
L14:
    test byte ptr [ebx + 0000000CCh], 4
    je L15
    xor eax, eax
    inc eax
    jmp L31
L15:
    mov eax, dword ptr [ebx + 12]
    shl eax, 2
    cmp dword ptr [ebp - 24], edi
    push eax
    je L20
    call sub_100F79D3
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L29
    mov eax, dword ptr [ebx + 12]
    shl eax, 2
    push eax
    call sub_100F79EB
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 8], eax
    je L29
    mov ecx, ebx
    call sub_1008AB0D
    mov esi, eax
    cmp esi, edi
    jl L30
    xor eax, eax
    cmp dword ptr [ebx + 12], edi
    jbe L17
L16:
    mov ecx, dword ptr [ebp - 4]
    mov dword ptr [ecx + eax*4], eax
    inc eax
    cmp eax, dword ptr [ebx + 12]
    jb L16
L17:
    push ebx
    push dword ptr [ebx + 12]
    push dword ptr [ebp - 4]
    push 01008661Bh
    call sub_10086AE2
    xor edx, edx
    cmp dword ptr [ebx + 12], edi
    jbe L19
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    sub ecx, eax
L18:
    mov esi, dword ptr [ecx + eax]
    mov edi, dword ptr [ebx + 24]
    mov esi, dword ptr [edi + esi*4]
    mov dword ptr [eax], esi
    inc edx
    add eax, 4
    cmp edx, dword ptr [ebx + 12]
    jb L18
L19:
    mov ecx, dword ptr [ebx + 12]
    mov edi, dword ptr [ebx + 24]
    mov esi, dword ptr [ebp - 8]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, ebx
    call sub_1008AED9
    mov esi, eax
    test esi, esi
    jl L30
    push 1
    lea ecx, [ebp - 112]
    mov dword ptr [ebp - 108], ebx
    mov dword ptr [ebp - 112], 010110448h
    call dword ptr [fp_10110450]
    mov esi, eax
    test esi, esi
    jl L30
    jmp L28
L20:
    mov dword ptr [ebp - 12], edi
    call sub_100F7AA6
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 16], eax
    je L29
    mov eax, dword ptr [ebx + 12]
    shl eax, 2
    push eax
    call sub_100F7ABE
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 4], eax
    je L29
    mov eax, dword ptr [ebx + 12]
    shl eax, 2
    push eax
    call sub_100F7AD6
    cmp eax, edi
    pop ecx
    mov dword ptr [ebp - 8], eax
    je L29
    xor ecx, ecx
    cmp dword ptr [ebx + 12], edi
    jbe L23
L21:
    mov eax, dword ptr [ebx + 24]
    mov eax, dword ptr [eax + ecx*4]
    or dword ptr [eax + 56], 0FFFFFFFFh
    test word ptr [eax + 2], 00000FFF0h
    mov dword ptr [eax + 36], edi
    je L22
    cmp dword ptr [eax + 28], edi
    jne L22
    mov edx, dword ptr [ebp - 12]
    mov eax, dword ptr [ebp - 16]
    inc dword ptr [ebp - 12]
    mov dword ptr [eax + edx*4], ecx
L22:
    inc ecx
    cmp ecx, dword ptr [ebx + 12]
    jb L21
L23:
    cmp dword ptr [ebp - 12], 0
    mov dword ptr [ebp - 28], edi
    jbe L25
L24:
    lea eax, [ebp - 28]
    push eax
    push dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 16]
    push dword ptr [eax + edi*4]
    mov ecx, ebx
    call sub_10089A92
    mov esi, eax
    test esi, esi
    jl L30
    inc edi
    cmp edi, dword ptr [ebp - 12]
    jb L24
L25:
    xor edx, edx
    cmp dword ptr [ebx + 12], edx
    jbe L27
    mov eax, dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    sub ecx, eax
L26:
    mov esi, dword ptr [eax + ecx]
    mov edi, dword ptr [ebx + 24]
    mov esi, dword ptr [edi + esi*4]
    mov dword ptr [eax], esi
    inc edx
    add eax, 4
    cmp edx, dword ptr [ebx + 12]
    jb L26
L27:
    mov ecx, dword ptr [ebx + 12]
    mov edi, dword ptr [ebx + 24]
    mov esi, dword ptr [ebp - 8]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
L28:
    xor esi, esi
    jmp L30
L29:
    mov esi, 08007000Eh
L30:
    push dword ptr [ebp - 16]
    call sub_100F7B87
    push dword ptr [ebp - 4]
    call sub_100F7B8F
    push dword ptr [ebp - 8]
    call sub_100F7B97
    add esp, 12
    mov eax, esi
L31:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100910df ENDP
END
