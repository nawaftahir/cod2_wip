.686
.MODEL FLAT, C
EXTRN sub_1008B151:PROC
EXTRN sub_1008B22A:PROC
EXTRN sub_1008B29E:PROC
EXTRN sub_1008B2CD:PROC
EXTRN sub_1008B302:PROC
.CODE
FUN_100a4a2e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 96
    push esi
    mov esi, ecx
    xor edx, edx
    xor eax, eax
    cmp dword ptr [esi + 000000158h], edx
    jne L17
    test byte ptr [esi + 112], 64
    push ebx
    push edi
    mov dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 16], edx
    je L6
    cmp dword ptr [esi + 8], edx
    lea edi, [ebp - 32]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov dword ptr [ebp - 12], edx
    stosd dword ptr es:[edi], eax
    jbe L3
L0:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp - 8]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 32
    je L2
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    push dword ptr [edi + 108]
    mov ebx, eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    mov ecx, ebx
    dec ecx
    je L1
    sub ecx, 4
    jne L2
    test eax, eax
    jne L2
    cmp dword ptr [edi + 16], eax
    jbe L2
    cmp dword ptr [ebp - 12], eax
    jne L2
    push 010115C44h
    push 0000011BCh
    push dword ptr [edi + 96]
    push esi
    call sub_1008B151
    xor eax, eax
    add esp, 16
    inc eax
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 4], eax
    jmp L2
L1:
    test eax, eax
    jne L2
    mov eax, dword ptr [edi + 16]
    mov dword ptr [ebp + eax*4 - 32], 1
    mov eax, dword ptr [edi + 96]
    mov dword ptr [ebp - 16], eax
L2:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 8]
    jb L0
    xor edx, edx
L3:
    xor ecx, ecx
    xor eax, eax
L4:
    cmp dword ptr [ebp + eax*4 - 32], edx
    je L5
    inc ecx
L5:
    inc eax
    cmp eax, 4
    jb L4
    cmp ecx, 4
    je L16
    push 010115C00h
    push 0000011BDh
    push dword ptr [ebp - 16]
    jmp L15
L6:
    push 16
    pop ecx
    lea edi, [ebp - 96]
    rep stosd dword ptr es:[edi], eax
    xor eax, eax
    lea edi, [ebp - 32]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor ebx, ebx
    stosd dword ptr es:[edi], eax
    inc ebx
    cmp dword ptr [esi + 8], edx
    stosd dword ptr es:[edi], eax
    jbe L10
L7:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp - 8]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    test byte ptr [eax + 4], 32
    je L9
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    push dword ptr [edi + 108]
    mov dword ptr [ebp - 12], eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    mov ecx, dword ptr [ebp - 12]
    sub ecx, 11
    je L8
    dec ecx
    dec ecx
    jne L9
    test eax, eax
    jne L9
    cmp dword ptr [edi + 16], eax
    je L9
    cmp dword ptr [ebp - 16], eax
    jne L9
    push 010115BE8h
    push 0000011B0h
    push dword ptr [edi + 96]
    push esi
    call sub_1008B22A
    add esp, 16
    mov dword ptr [ebp - 16], ebx
    mov dword ptr [ebp - 4], ebx
    jmp L9
L8:
    cmp eax, 4
    jae L9
    mov ecx, dword ptr [edi + 16]
    shl eax, 2
    add ecx, eax
    mov dword ptr [ebp + ecx*4 - 96], ebx
    mov ecx, dword ptr [edi + 96]
    mov dword ptr [ebp + eax - 32], ecx
L9:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 8]
    jb L7
    xor edx, edx
L10:
    mov dword ptr [ebp - 16], edx
    mov dword ptr [ebp - 12], ebx
    xor edi, edi
L11:
    mov eax, edi
    xor ecx, ecx
    shl eax, 4
    push 4
    lea eax, [ebp + eax - 96]
    pop edx
L12:
    xor ebx, ebx
    cmp dword ptr [eax], ebx
    setne bl
    add eax, 4
    add ecx, ebx
    dec edx
    jne L12
    test ecx, ecx
    jne L18
    test edi, edi
    jne L13
    push 010115BA8h
    push 0000011B2h
    push dword ptr [ebp - 32]
    push esi
    call sub_1008B29E
    add esp, 16
    mov dword ptr [ebp - 4], 1
L13:
    mov dword ptr [ebp - 16], 1
L14:
    inc edi
    cmp edi, 4
    jb L11
    cmp dword ptr [ebp - 12], 0
    jne L16
    push 010115B70h
    push 0000011BAh
    push 0
L15:
    push esi
    call sub_1008B2CD
    add esp, 16
    mov dword ptr [ebp - 4], 1
L16:
    mov eax, dword ptr [ebp - 4]
    neg eax
    sbb eax, eax
    pop edi
    and eax, 080004005h
    pop ebx
L17:
    pop esi
    leave
    ret
L18:
    cmp ecx, 4
    je L19
    push edi
    push 010115B48h
    push 0000011B1h
    push dword ptr [ebp + edi*4 - 32]
    push esi
    call sub_1008B302
    add esp, 20
    mov dword ptr [ebp - 4], 1
L19:
    cmp dword ptr [ebp - 16], 0
    je L14
    and dword ptr [ebp - 12], 0
    jmp L14
FUN_100a4a2e ENDP
END
