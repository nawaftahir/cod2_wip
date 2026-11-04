.686
.MODEL FLAT, C
EXTRN sub_1008B12C:PROC
EXTRN sub_1008B187:PROC
EXTRN sub_1008B226:PROC
EXTRN sub_100AF75C:PROC
EXTRN sub_100AF75E:PROC
EXTRN sub_100AF7B1:PROC
EXTRN sub_100AF7B4:PROC
EXTRN sub_100AF7BC:PROC
EXTRN sub_100AF7C1:PROC
EXTRN sub_100AF7C6:PROC
EXTRN sub_100AF7E6:PROC
EXTRN sub_100AF7EA:PROC
EXTRN sub_100AF7F9:PROC
EXTRN sub_100AF7FA:PROC
EXTRN sub_100AF7FD:PROC
EXTRN sub_100AF802:PROC
EXTRN sub_100AF816:PROC
EXTRN sub_100AF818:PROC
EXTRN sub_100AF81B:PROC
EXTRN sub_100AF829:PROC
EXTRN sub_100AF83A:PROC
EXTRN sub_100AF873:PROC
EXTRN sub_100AF8A7:PROC
.CODE
FUN_100af5d2 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    push push esi
    push push edi
    xor xor eax, eax
    lea lea edi, [ebp - 32]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    mov mov ebx, ecx
    xor xor eax, eax
    lea lea edi, [ebx + 0218h]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    xor xor esi, esi
    push push 8
    xor xor eax, eax
    pop pop ecx
    lea lea edi, [ebx + 01F8h]
    xor xor edx, edx
    rep stosd rep stosd dword ptr es:[edi], eax
    cmp cmp dword ptr [ebx + 8], esi
    mov mov dword ptr [ebp - 8], esi
    mov mov dword ptr [ebp - 12], esi
    mov mov dword ptr [ebp - 16], esi
    mov mov dword ptr [ebp - 4], esi
    jbe sub_100AF75E
    mov mov eax, dword ptr [ebx + 20]
    mov mov ecx, dword ptr [ebp - 4]
    mov mov esi, dword ptr [eax + ecx*4]
    cmp cmp dword ptr [esi + 8], -1
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, dword ptr [ebx + 16]
    mov mov edi, dword ptr [ecx + eax*4]
    je L0
    cmp cmp dword ptr [ebp - 8], 0
    jne L1
    push push 0101176ECh
    push push 0119Fh
    push push dword ptr [esi + 96]
    push push ebx
    call sub_1008B12C
    xor xor ecx, ecx
    add add esp, 16
    inc inc ecx
    mov mov dword ptr [ebp - 8], ecx
    mov mov edx, ecx
    jmp L2
    xor xor ecx, ecx
    inc inc ecx
    mov mov eax, dword ptr [edi + 4]
    test test al, 32
    je L3
    movzx movzx edi, byte ptr [esi + 109]
    cmp cmp edi, 3
    ja sub_100AF7B1
    mov mov eax, dword ptr [esi + 108]
    and and eax, 0FFh
    dec dec eax
    je L4
    dec dec eax
    jne sub_100AF7B4
    test test edi, edi
    jne sub_100AF7BC
    cmp cmp dword ptr [esi + 16], edi
    je sub_100AF7C1
    cmp cmp dword ptr [ebp - 12], edi
    jne sub_100AF7C6
    push push 010115BE8h
    push push 011B0h
    push push dword ptr [esi + 96]
    push push ebx
    call sub_1008B187
    xor xor eax, eax
    add add esp, 16
    inc inc eax
    mov mov dword ptr [ebp - 12], eax
    mov mov edx, eax
    jmp sub_100AF7E6
    test test edi, edi
    jne sub_100AF7EA
    mov mov eax, dword ptr [esi + 16]
    mov mov dword ptr [ebp + eax*4 - 32], ecx
    mov mov eax, dword ptr [esi + 96]
    mov mov dword ptr [ebp - 16], eax
    jmp sub_100AF7F9
    test test al, 16
    je sub_100AF7FD
    test test ah, 2
    jne sub_100AF802
    mov mov ecx, dword ptr [esi + 108]
    movzx movzx eax, byte ptr [esi + 109]
    and and ecx, 0FFh
    dec dec ecx
    je sub_100AF7FA
L2:
    dec dec ecx
    dec dec ecx
    jne sub_100AF816
    cmp cmp eax, 8
    jae sub_100AF81B
    lea lea eax, [ebx + eax*4 + 01F8h]
    jmp sub_100AF818
    cmp cmp eax, 2
    jae sub_100AF829
    lea lea eax, [ebx + eax*4 + 0218h]
    mov mov esi, dword ptr [esi + 16]
    lea lea ecx, [esi + 1]
    cmp cmp dword ptr [eax], ecx
    jae sub_100AF83A
    mov mov dword ptr [eax], ecx
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebx + 8]
    jb sub_100AF75C
    xor xor esi, esi
    xor xor eax, eax
    xor xor ecx, ecx
    cmp cmp dword ptr [ebp + eax*4 - 32], ecx
    setne setne cl
    add add esi, ecx
    inc inc eax
    cmp cmp eax, 4
    jb sub_100AF873
    cmp cmp esi, 4
    je sub_100AF8A7
    push push 010115BA8h
    push push 011B2h
    push push dword ptr [ebp - 16]
    push push ebx
    call sub_1008B226
    xor xor edx, edx
    add add esp, 16
    inc inc edx
    mov mov eax, edx
    neg neg eax
    pop pop edi
    sbb sbb eax, eax
    pop pop esi
    and and eax, 080004005h
    pop pop ebx
L4:
    leave leave
    ret ret
FUN_100af5d2 ENDP
END
