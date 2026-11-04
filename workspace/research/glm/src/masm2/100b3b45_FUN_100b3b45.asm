.686
.MODEL FLAT, C
EXTRN sub_1006A7FE:PROC
EXTRN sub_1006A87D:PROC
EXTRN sub_100B3E57:PROC
EXTRN sub_100B3E7E:PROC
EXTRN sub_100B3E81:PROC
EXTRN sub_100B3E84:PROC
EXTRN sub_100B3E86:PROC
EXTRN sub_100B3E91:PROC
EXTRN sub_100B3E97:PROC
EXTRN sub_100B3E9D:PROC
EXTRN sub_100B3EA3:PROC
EXTRN sub_100B3EAD:PROC
EXTRN sub_100B3ED6:PROC
EXTRN sub_100B3EDB:PROC
EXTRN sub_100B3EE5:PROC
EXTRN sub_100B3EEB:PROC
EXTRN sub_100B3F00:PROC
EXTRN sub_100B3F0A:PROC
EXTRN sub_100B3F3A:PROC
EXTRN sub_100B3F42:PROC
EXTRN sub_100B3F4C:PROC
EXTRN sub_100B3F5F:PROC
EXTRN sub_100B3F7E:PROC
EXTRN sub_100B3F87:PROC
EXTRN sub_100B3FD7:PROC
EXTRN sub_100B3FD8:PROC
EXTRN sub_100B3FDE:PROC
EXTRN sub_100B3FDF:PROC
EXTRN sub_100B3FE7:PROC
EXTRN sub_100B3FF2:PROC
EXTRN sub_100B4018:PROC
EXTRN sub_100B402B:PROC
EXTRN sub_100B402C:PROC
EXTRN sub_100B402E:PROC
EXTRN sub_100B40B1:PROC
EXTRN sub_100B40E3:PROC
EXTRN sub_100B40EE:PROC
EXTRN sub_100B40F2:PROC
EXTRN sub_100C4F90:PROC
EXTRN sub_100C7D40:PROC
EXTRN sub_100C8CD9:PROC
EXTRN sub_100C9AA3:PROC
EXTRN sub_100F6004:PROC
EXTRN sub_100F78E4:PROC
EXTRN sub_100F793A:PROC
EXTRN sub_100F7975:PROC
.CODE
FUN_100b3b45 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 48
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    push push edi
    push push dword ptr [ebx + 108]
    mov mov esi, ecx
    mov mov eax, dword ptr [esi]
    call call dword ptr [eax + 84]
    push push dword ptr [ebx + 108]
    mov mov dword ptr [ebp + 8], eax
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 88]
    xor xor edx, edx
    cmp cmp dword ptr [esi + 0158h], edx
    mov mov edi, eax
    mov mov dword ptr [ebp - 16], edi
    je L0
    cmp cmp dword ptr [ebx + 108], -1
    je sub_100B3E57
    cmp cmp dword ptr [ebp + 8], 0FFFFh
    je L1
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    call sub_100C8CD9
    push push edi
    push push dword ptr [eax]
    lea lea eax, [ebp - 48]
    push push 010115CC8h
    push push 32
    push push eax
    call sub_100F78E4
    add add esp, 20
    push push 1
    push push dword ptr [ebx + 12]
    lea lea eax, [ebp - 48]
    lea lea ecx, [esi + 01D4h]
    push push eax
    mov mov byte ptr [ebp - 17], 0
    call sub_1006A7FE
    test test eax, eax
    jl sub_100B3EAD
    inc inc dword ptr [esi + 01F0h]
    test test byte ptr [esi + 0CCh], 1
    je L4
    mov mov eax, dword ptr [ebx + 96]
    test test eax, eax
    je L5
    cmp cmp dword ptr [eax + 4], 6
    jne L6
    mov mov edi, dword ptr [eax + 20]
    cmp cmp dword ptr [edi + 4], 3
    jne L7
    mov mov eax, dword ptr [edi + 24]
    lea lea edx, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L2
    sub sub eax, edx
    add add eax, 3
    push push eax
    call sub_100F793A
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [ebp + 8], eax
    jne L3
    mov mov eax, 08007000Eh
    jmp sub_100B3F00
    push push dword ptr [edi + 24]
    push push 010115CB8h
    push push eax
    call sub_100F6004
    add add esp, 12
    push push 1
    push push dword ptr [ebx + 12]
    lea lea ecx, [esi + 01D4h]
    push push dword ptr [ebp + 8]
    call sub_1006A87D
    push push dword ptr [ebp + 8]
    mov mov edi, eax
    call sub_100F7975
    test test edi, edi
    pop pop ecx
    jge L8
    mov mov eax, edi
    jmp sub_100B3F3A
    inc inc dword ptr [esi + 01F0h]
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_100B3F42
    mov mov ecx, dword ptr [ebx + 108]
    mov mov dword ptr [eax], ecx
    jmp sub_100B3F4C
    cmp cmp dword ptr [ebp + 8], 11
    jne L9
    cmp cmp edi, dword ptr [esi + 40]
    jae sub_100B3F5F
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [eax], edi
    mov mov eax, dword ptr [esi + edi*4 + 0218h]
    mov mov dword ptr [ebp - 4], 1
    jmp L10
    cmp cmp dword ptr [ebp + 8], 6
    jne sub_100B3F7E
    cmp cmp edi, 8
    jae sub_100B3F87
    mov mov ecx, dword ptr [ebp + 12]
L1:
    lea lea eax, [edi + 2]
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [esi + edi*4 + 01F8h]
    mov mov dword ptr [ebp - 4], 3
    cmp cmp eax, edx
    mov mov dword ptr [ebp + 12], edx
    jbe sub_100B3E86
    mov mov ecx, edx
    sub sub ecx, 0
    je sub_100B3E84
    dec dec ecx
    je sub_100B3E81
    dec dec ecx
    je sub_100B3E7E
    dec dec ecx
    jne sub_100B3E91
    or or byte ptr [ebp + 14], 8
    jmp sub_100B3E97
    or or byte ptr [ebp + 14], 4
    jmp sub_100B3E9D
    or or byte ptr [ebp + 14], 2
    jmp sub_100B3EA3
    or or byte ptr [ebp + 14], 1
    inc inc edx
    cmp cmp edx, eax
    jb sub_100B3E86
    cmp cmp dword ptr [ebp - 4], 1
L3:
    je sub_100B3ED6
    test test byte ptr [esi + 0CCh], 32
    jne sub_100B3EDB
    cmp cmp dword ptr [ebp + 8], 6
    jne sub_100B3EE5
L5:
    test test byte ptr [ebx + 3], 2
    je sub_100B3EEB
L6:
    or or byte ptr [ebp + 14], 32
    and and dword ptr [ebp - 8], 0
    test test byte ptr [ebx + 3], 1
    je sub_100B3F0A
    mov mov dword ptr [ebp - 8], 0400000h
    push push 0200001Fh
    mov mov ecx, esi
    call sub_100C9AA3
    test test eax, eax
    jl sub_100B4018
    push push 080000000h
    mov mov ecx, esi
    call sub_100C7D40
    test test eax, eax
    jl sub_100B402C
    test test byte ptr [esi + 0CCh], 1
    je sub_100B3FF2
    and and dword ptr [ebp - 12], 0
    and and dword ptr [ebp + 8], 0
    or or eax, -1
    cmp cmp dword ptr [esi + 8], 0
    lea lea edi, [ebp - 32]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    jbe sub_100B3FD8
    mov mov edi, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [esi + 20]
    mov mov eax, dword ptr [ecx]
    cmp cmp edi, dword ptr [eax + 4]
    jne sub_100B3FD7
    mov mov edx, dword ptr [ebx + 8]
    cmp cmp edx, dword ptr [eax + 8]
    jne sub_100B3FDF
    mov mov edx, dword ptr [ebx + 12]
    cmp cmp edx, dword ptr [eax + 12]
    jne sub_100B3FE7
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [ebp + eax*4 - 32], edx
    inc inc dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebp + 8]
    add add ecx, 4
    cmp cmp eax, dword ptr [esi + 8]
    jb sub_100B3FDE
    mov mov edx, dword ptr [ebp - 12]
    xor xor ecx, ecx
    mov mov eax, dword ptr [ebp + ecx*4 - 32]
    cmp cmp eax, -1
    je sub_100B402E
    mov mov dword ptr [ebp + edx*4 - 32], eax
    inc inc edx
    inc inc ecx
    cmp cmp ecx, 4
    jb sub_100B402B
    mov mov eax, dword ptr [esi]
    push push 1
    lea lea ecx, [ebp + 8]
    push push ecx
    push push edx
    lea lea ecx, [ebp - 32]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100B40B1
    mov mov edi, dword ptr [ebp - 16]
    mov mov eax, dword ptr [ebp - 4]
    mov mov edx, dword ptr [esi]
    mov mov ecx, eax
    or or ecx, -8
    shl shl ecx, 20
    and and eax, 24
    or or ecx, eax
    shl shl ecx, 8
    push push 0
    push push dword ptr [ebp + 12]
    and and edi, 07FFh
    or or ecx, edi
    or or ecx, dword ptr [ebp - 8]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [edx + 100]
    test test eax, eax
    jl sub_100B40E3
    mov mov ecx, esi
    call sub_100C4F90
    test test eax, eax
    jl sub_100B40EE
    xor xor eax, eax
    jmp sub_100B40F2
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100b3b45 ENDP
END
