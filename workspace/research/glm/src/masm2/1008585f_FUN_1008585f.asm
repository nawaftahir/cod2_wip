.686
.MODEL FLAT, C
EXTRN sub_10085AC9:PROC
EXTRN sub_10085AD4:PROC
EXTRN sub_10085AD7:PROC
EXTRN sub_10085B3B:PROC
EXTRN sub_10085B3D:PROC
EXTRN sub_10085B49:PROC
EXTRN sub_10085B51:PROC
EXTRN sub_10085B67:PROC
EXTRN sub_10085B6B:PROC
EXTRN sub_10085B70:PROC
EXTRN sub_10085B75:PROC
EXTRN sub_10085B77:PROC
EXTRN sub_10085B7D:PROC
EXTRN sub_10085B89:PROC
EXTRN sub_10085B8E:PROC
EXTRN sub_10085BB6:PROC
EXTRN sub_10085BC6:PROC
EXTRN sub_10085BE6:PROC
EXTRN sub_10085BED:PROC
EXTRN sub_10085BF1:PROC
EXTRN sub_10085BFC:PROC
EXTRN sub_10085C1F:PROC
EXTRN sub_10085C34:PROC
EXTRN sub_10085C75:PROC
EXTRN sub_10085CA3:PROC
EXTRN sub_10085CA8:PROC
EXTRN sub_10085CB6:PROC
EXTRN sub_10085D02:PROC
.CODE
FUN_1008585f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov edx, dword ptr [ebp + 8]
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov ecx, dword ptr [ebp + 12]
    mov mov eax, edx
    push push edi
    mov mov edi, dword ptr [ebp + 16]
    xor xor ebx, ebx
    and and eax, 0FFFFFh
    cmp cmp dword ptr [ebp + 20], ebx
    mov mov dword ptr [esi], edx
    mov mov dword ptr [esi + 4], ecx
    mov mov dword ptr [esi + 12], edi
    jne L24
    mov mov ebx, edx
    and and ebx, 0F0000000h
    je L14
    cmp cmp ebx, 010000000h
    je L12
    cmp cmp ebx, 020000000h
    je L19
    cmp cmp ebx, 030000000h
    je L20
    cmp cmp ebx, 040000000h
    je L21
    cmp cmp ebx, 050000000h
    je L13
    mov mov eax, 060000000h
    cmp cmp ebx, eax
    jne L28
    and and edx, 0FFF00000h
    mov mov ebx, 060A00000h
    cmp cmp edx, ebx
    ja L7
    je L6
    mov mov ebx, 060500000h
    cmp cmp edx, ebx
    ja L2
    je L0
    cmp cmp edx, eax
    je L1
    cmp cmp edx, 060100000h
    je L2
    cmp cmp edx, 060200000h
    je L3
    cmp cmp edx, 060300000h
    je L5
    cmp cmp edx, 060400000h
    jne sub_10085AC9
    push push 8
    jmp L27
    push push 4
    pop pop edi
    mov mov ecx, edi
    jmp sub_10085AD7
    cmp cmp edx, 060600000h
    je L8
    cmp cmp edx, 060700000h
    je L9
    cmp cmp edx, 060800000h
    je L10
    cmp cmp edx, 060900000h
    jmp L11
    push push 6
    jmp L30
    mov mov eax, 060F00000h
    cmp cmp edx, eax
    ja L29
    je L22
    cmp cmp edx, 060B00000h
    je L31
    cmp cmp edx, 060C00000h
    je L15
    cmp cmp edx, 060D00000h
    je L16
    cmp cmp edx, 060E00000h
    jmp L17
    cmp cmp edx, 061000000h
    je sub_10085AD4
    cmp cmp edx, 061100000h
    je L23
    cmp cmp edx, 061200000h
    je L25
    cmp cmp edx, 061300000h
    jmp L26
    push push 12
    pop pop ecx
    push push 4
    pop pop edi
    jmp sub_10085B51
    and and edx, 0FFF00000h
    cmp cmp edx, 050000000h
    je sub_10085B3D
    cmp cmp edx, 050100000h
    je sub_10085B3B
    cmp cmp edx, 050200000h
L0:
    je sub_10085B49
    cmp cmp edx, 050300000h
L2:
    jne sub_10085B77
    mov mov ecx, eax
    mov mov edi, eax
    jmp sub_10085B7D
L3:
    mov mov ecx, eax
    jmp sub_10085B67
    cmp cmp edi, -1
    lea lea ecx, [eax + eax]
    jne sub_10085B89
    xor xor edi, edi
    inc inc edi
L6:
    jmp sub_10085B8E
L7:
    mov mov ecx, eax
    shl shl ecx, 2
    jmp sub_10085B6B
    lea lea ecx, [eax + eax*2]
    jmp sub_10085B70
    lea lea ecx, [eax + eax]
    jmp sub_10085B75
    xor xor ecx, ecx
    xor xor edi, edi
    or or ebx, -1
    cmp cmp dword ptr [esi + 4], ebx
    jne sub_10085BB6
    mov mov dword ptr [esi + 4], ecx
    cmp cmp dword ptr [esi + 12], ebx
    jne sub_10085BC6
    mov mov dword ptr [esi + 12], edi
    mov mov edx, dword ptr [esi + 4]
L11:
    cmp cmp edx, ecx
    jne sub_10085BE6
    mov mov eax, dword ptr [esi + 12]
    cmp cmp eax, edi
    jne sub_10085BED
    cmp cmp edx, ebx
    je sub_10085BF1
L13:
    cmp cmp eax, ebx
    jne sub_10085BFC
    mov mov eax, 080004005h
    jmp sub_10085C75
    xor xor ebx, ebx
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, 8
    ja sub_10085C1F
    lea lea eax, [esi + 64]
    mov mov dword ptr [esi + 8], eax
    jmp sub_10085C34
    push push eax
L16:
    call L4
    cmp cmp eax, ebx
L19:
    mov mov dword ptr [esi + 8], eax
    je sub_10085CA8
    mov mov eax, dword ptr [esi + 12]
    cmp cmp eax, 4
    ja sub_10085CA3
    lea lea eax, [esi + 96]
    mov mov dword ptr [esi + 16], eax
    mov mov ecx, dword ptr [esi + 4]
    mov mov edi, dword ptr [esi + 8]
L25:
    shl shl ecx, 2
    mov mov edx, ecx
L26:
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [esi + 12]
    mov mov edi, dword ptr [esi + 16]
    shl shl ecx, 2
    mov mov edx, ecx
    shr shr ecx, 2
    or or eax, -1
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov dword ptr [esi + 36], ebx
    mov mov dword ptr [esi + 40], ebx
    mov mov dword ptr [esi + 44], ebx
    mov mov dword ptr [esi + 56], ebx
    mov mov dword ptr [esi + 60], ebx
    xor xor eax, eax
L30:
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 16
    push push eax
    call L18
    cmp cmp eax, ebx
    mov mov dword ptr [esi + 16], eax
    jne sub_10085CB6
    mov mov eax, 08007000Eh
    jmp sub_10085D02
FUN_1008585f ENDP
END
