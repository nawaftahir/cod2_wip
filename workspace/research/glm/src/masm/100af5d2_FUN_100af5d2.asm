.686
.MODEL FLAT, C
EXTRN sub_1008B12C:PROC
EXTRN sub_1008B187:PROC
EXTRN sub_1008B226:PROC
.CODE
FUN_100af5d2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    push edi
    xor eax, eax
    lea edi, [ebp - 32]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    mov ebx, ecx
    xor eax, eax
    lea edi, [ebx + 000000218h]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    xor esi, esi
    push 8
    xor eax, eax
    pop ecx
    lea edi, [ebx + 0000001F8h]
    xor edx, edx
    rep stosd dword ptr es:[edi], eax
    cmp dword ptr [ebx + 8], esi
    mov dword ptr [ebp - 8], esi
    mov dword ptr [ebp - 12], esi
    mov dword ptr [ebp - 16], esi
    mov dword ptr [ebp - 4], esi
    jbe L9
L0:
    mov eax, dword ptr [ebx + 20]
    mov ecx, dword ptr [ebp - 4]
    mov esi, dword ptr [eax + ecx*4]
    cmp dword ptr [esi + 8], -1
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [ebx + 16]
    mov edi, dword ptr [ecx + eax*4]
    je L1
    cmp dword ptr [ebp - 8], 0
    jne L1
    push 0101176ECh
    push 00000119Fh
    push dword ptr [esi + 96]
    push ebx
    call sub_1008B12C
    xor ecx, ecx
    add esp, 16
    inc ecx
    mov dword ptr [ebp - 8], ecx
    mov edx, ecx
    jmp L2
L1:
    xor ecx, ecx
    inc ecx
L2:
    mov eax, dword ptr [edi + 4]
    test al, 32
    je L4
    movzx edi, byte ptr [esi + 109]
    cmp edi, 3
    ja L8
    mov eax, dword ptr [esi + 108]
    and eax, 0000000FFh
    dec eax
    je L3
    dec eax
    jne L7
    test edi, edi
    jne L7
    cmp dword ptr [esi + 16], edi
    je L7
    cmp dword ptr [ebp - 12], edi
    jne L7
    push 010115BE8h
    push 0000011B0h
    push dword ptr [esi + 96]
    push ebx
    call sub_1008B187
    xor eax, eax
    add esp, 16
    inc eax
    mov dword ptr [ebp - 12], eax
    mov edx, eax
    jmp L7
L3:
    test edi, edi
    jne L7
    mov eax, dword ptr [esi + 16]
    mov dword ptr [ebp + eax*4 - 32], ecx
    mov eax, dword ptr [esi + 96]
    mov dword ptr [ebp - 16], eax
    jmp L7
L4:
    test al, 16
    je L7
    test ah, 2
    jne L7
    mov ecx, dword ptr [esi + 108]
    movzx eax, byte ptr [esi + 109]
    and ecx, 0000000FFh
    dec ecx
    je L5
    dec ecx
    dec ecx
    jne L7
    cmp eax, 8
    jae L7
    lea eax, [ebx + eax*4 + 0000001F8h]
    jmp L6
L5:
    cmp eax, 2
    jae L7
    lea eax, [ebx + eax*4 + 000000218h]
L6:
    mov esi, dword ptr [esi + 16]
    lea ecx, [esi + 1]
    cmp dword ptr [eax], ecx
    jae L7
    mov dword ptr [eax], ecx
L7:
    inc dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 4]
    cmp eax, dword ptr [ebx + 8]
    jb L0
L8:
    xor esi, esi
L9:
    xor eax, eax
L10:
    xor ecx, ecx
    cmp dword ptr [ebp + eax*4 - 32], ecx
    setne cl
    add esi, ecx
    inc eax
    cmp eax, 4
    jb L10
    cmp esi, 4
    je L11
    push 010115BA8h
    push 0000011B2h
    push dword ptr [ebp - 16]
    push ebx
    call sub_1008B226
    xor edx, edx
    add esp, 16
    inc edx
L11:
    mov eax, edx
    neg eax
    pop edi
    sbb eax, eax
    pop esi
    and eax, 080004005h
    pop ebx
    leave
    ret
FUN_100af5d2 ENDP
END
