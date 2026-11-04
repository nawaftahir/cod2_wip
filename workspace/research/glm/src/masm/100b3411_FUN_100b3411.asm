.686
.MODEL FLAT, C
EXTRN sub_1008B175:PROC
EXTRN sub_1008B24A:PROC
EXTRN sub_1008B271:PROC
EXTRN sub_1008B2A2:PROC
.CODE
FUN_100b3411 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 96
    push esi
    mov esi, ecx
    xor edx, edx
    xor eax, eax
    cmp dword ptr [esi + 000000158h], edx
    jne L12
    push ebx
    push edi
    push 16
    pop ecx
    lea edi, [ebp - 96]
    rep stosd dword ptr es:[edi], eax
    lea edi, [ebp - 32]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor eax, eax
    lea edi, [esi + 000000218h]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    push 8
    xor eax, eax
    pop ecx
    lea edi, [esi + 0000001F8h]
    rep stosd dword ptr es:[edi], eax
    cmp dword ptr [esi + 8], edx
    mov dword ptr [ebp - 4], edx
    mov dword ptr [ebp - 12], edx
    mov dword ptr [ebp - 8], edx
    jbe L6
L0:
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp - 8]
    mov edi, dword ptr [eax + ecx*4]
    mov eax, dword ptr [edi + 4]
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    test al, 32
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
    sub ecx, 11
    je L1
    dec ecx
    dec ecx
    jne L5
    test eax, eax
    jne L5
    cmp dword ptr [edi + 16], eax
    je L5
    cmp dword ptr [ebp - 12], eax
    jne L5
    push 010115BE8h
    push 0000011B0h
    push dword ptr [edi + 96]
    push esi
    call sub_1008B175
    xor eax, eax
    add esp, 16
    inc eax
    mov dword ptr [ebp - 12], eax
    mov dword ptr [ebp - 4], eax
    jmp L5
L1:
    cmp eax, 4
    jae L5
    mov ecx, dword ptr [edi + 16]
    shl eax, 2
    add ecx, eax
    mov dword ptr [ebp + ecx*4 - 96], 1
    mov ecx, dword ptr [edi + 96]
    mov dword ptr [ebp + eax - 32], ecx
    jmp L5
L2:
    test al, 16
    je L5
    test ah, 2
    jne L5
    push dword ptr [edi + 108]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x54]
    push dword ptr [edi + 108]
    mov ebx, eax
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x58]
    cmp ebx, 6
    je L3
    cmp ebx, 11
    jne L5
    cmp eax, 2
    jae L5
    lea eax, [esi + eax*4 + 000000218h]
    jmp L4
L3:
    cmp eax, 8
    jae L5
    lea eax, [esi + eax*4 + 0000001F8h]
L4:
    mov edi, dword ptr [edi + 16]
    lea ecx, [edi + 1]
    cmp dword ptr [eax], ecx
    jae L5
    mov dword ptr [eax], ecx
L5:
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    cmp eax, dword ptr [esi + 8]
    jb L0
    xor edx, edx
L6:
    xor ebx, ebx
    inc ebx
    mov dword ptr [ebp - 8], edx
    mov dword ptr [ebp - 16], ebx
    xor edi, edi
L7:
    mov eax, edi
    xor ecx, ecx
    shl eax, 4
    lea eax, [ebp + eax - 96]
    mov dword ptr [ebp - 12], 4
L8:
    xor edx, edx
    cmp dword ptr [eax], edx
    setne dl
    add eax, 4
    add ecx, edx
    dec dword ptr [ebp - 12]
    jne L8
    test ecx, ecx
    jne L13
    test edi, edi
    jne L9
    push 010115BA8h
    push 0000011B2h
    push dword ptr [ebp - 32]
    push esi
    call sub_1008B24A
    add esp, 16
    mov dword ptr [ebp - 4], ebx
L9:
    mov dword ptr [ebp - 8], ebx
L10:
    inc edi
    cmp edi, 4
    jb L7
    cmp dword ptr [ebp - 16], 0
    jne L11
    push 010115B70h
    push 0000011BAh
    push 0
    push esi
    call sub_1008B271
    add esp, 16
    mov dword ptr [ebp - 4], ebx
L11:
    mov eax, dword ptr [ebp - 4]
    neg eax
    sbb eax, eax
    pop edi
    and eax, 080004005h
    pop ebx
L12:
    pop esi
    leave
    ret
L13:
    cmp ecx, 4
    je L14
    push edi
    push 010115B48h
    push 0000011B1h
    push dword ptr [ebp + edi*4 - 32]
    push esi
    call sub_1008B2A2
    add esp, 20
    mov dword ptr [ebp - 4], ebx
L14:
    cmp dword ptr [ebp - 8], 0
    je L10
    and dword ptr [ebp - 16], 0
    jmp L10
FUN_100b3411 ENDP
END
