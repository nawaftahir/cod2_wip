.686
.MODEL FLAT, C
EXTRN sub_100859E1:PROC
EXTRN sub_10085A48:PROC
.CODE
FUN_1008585f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, ecx
    mov ecx, dword ptr [ebp + 12]
    mov eax, edx
    push edi
    mov edi, dword ptr [ebp + 16]
    xor ebx, ebx
    and eax, 0000FFFFFh
    cmp dword ptr [ebp + 20], ebx
    mov dword ptr [esi], edx
    mov dword ptr [esi + 4], ecx
    mov dword ptr [esi + 12], edi
    jne L24
    mov ebx, edx
    and ebx, 0F0000000h
    je L18
    cmp ebx, 010000000h
    je L10
    cmp ebx, 020000000h
    je L17
    cmp ebx, 030000000h
    je L16
    cmp ebx, 040000000h
    je L15
    cmp ebx, 050000000h
    je L9
    mov eax, 060000000h
    cmp ebx, eax
    jne L19
    and edx, 0FFF00000h
    mov ebx, 060A00000h
    cmp edx, ebx
    ja L5
    je L4
    mov ebx, 060500000h
    cmp edx, ebx
    ja L3
    je L2
    cmp edx, eax
    je L2
    cmp edx, 060100000h
    je L1
    cmp edx, 060200000h
    je L1
    cmp edx, 060300000h
    je L1
    cmp edx, 060400000h
L0:
    jne L19
L1:
    push 8
    jmp L8
L2:
    push 4
    pop edi
    mov ecx, edi
    jmp L19
L3:
    cmp edx, 060600000h
    je L1
    cmp edx, 060700000h
    je L1
    cmp edx, 060800000h
    je L1
    cmp edx, 060900000h
    jmp L0
L4:
    push 6
    jmp L8
L5:
    mov eax, 060F00000h
    cmp edx, eax
    ja L6
    je L4
    cmp edx, 060B00000h
    je L7
    cmp edx, 060C00000h
    je L1
    cmp edx, 060D00000h
    je L1
    cmp edx, 060E00000h
    jmp L0
L6:
    cmp edx, 061000000h
    je L7
    cmp edx, 061100000h
    je L1
    cmp edx, 061200000h
    je L1
    cmp edx, 061300000h
    jmp L0
L7:
    push 12
L8:
    pop ecx
    push 4
    pop edi
    jmp L19
L9:
    and edx, 0FFF00000h
    cmp edx, 050000000h
    je L13
    cmp edx, 050100000h
    je L10
    cmp edx, 050200000h
    je L12
    cmp edx, 050300000h
    jne L19
L10:
    mov ecx, eax
L11:
    mov edi, eax
    jmp L19
L12:
    mov ecx, eax
    jmp L14
L13:
    cmp edi, -1
    lea ecx, [eax + eax]
    jne L19
L14:
    xor edi, edi
    inc edi
    jmp L19
L15:
    mov ecx, eax
    shl ecx, 2
    jmp L11
L16:
    lea ecx, [eax + eax*2]
    jmp L11
L17:
    lea ecx, [eax + eax]
    jmp L11
L18:
    xor ecx, ecx
    xor edi, edi
L19:
    or ebx, 0FFFFFFFFh
    cmp dword ptr [esi + 4], ebx
    jne L20
    mov dword ptr [esi + 4], ecx
L20:
    cmp dword ptr [esi + 12], ebx
    jne L21
    mov dword ptr [esi + 12], edi
L21:
    mov edx, dword ptr [esi + 4]
    cmp edx, ecx
    jne L22
    mov eax, dword ptr [esi + 12]
    cmp eax, edi
    jne L22
    cmp edx, ebx
    je L22
    cmp eax, ebx
    jne L23
L22:
    mov eax, 080004005h
    jmp L28
L23:
    xor ebx, ebx
L24:
    mov eax, dword ptr [esi + 4]
    cmp eax, 8
    ja L25
    lea eax, [esi + 64]
    mov dword ptr [esi + 8], eax
    jmp L26
L25:
    push eax
    call sub_100859E1
    cmp eax, ebx
    mov dword ptr [esi + 8], eax
    je L30
L26:
    mov eax, dword ptr [esi + 12]
    cmp eax, 4
    ja L29
    lea eax, [esi + 96]
    mov dword ptr [esi + 16], eax
L27:
    mov ecx, dword ptr [esi + 4]
    mov edi, dword ptr [esi + 8]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [esi + 12]
    mov edi, dword ptr [esi + 16]
    shl ecx, 2
    mov edx, ecx
    shr ecx, 2
    or eax, 0FFFFFFFFh
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    mov dword ptr [esi + 36], ebx
    mov dword ptr [esi + 40], ebx
    mov dword ptr [esi + 44], ebx
    mov dword ptr [esi + 56], ebx
    mov dword ptr [esi + 60], ebx
    xor eax, eax
L28:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 16
L29:
    push eax
    call sub_10085A48
    cmp eax, ebx
    mov dword ptr [esi + 16], eax
    jne L27
L30:
    mov eax, 08007000Eh
    jmp L28
FUN_1008585f ENDP
END
