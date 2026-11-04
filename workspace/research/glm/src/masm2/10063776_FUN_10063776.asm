.686
.MODEL FLAT, C
EXTRN sub_1006381B:PROC
EXTRN sub_10063831:PROC
EXTRN sub_10063839:PROC
EXTRN sub_10063845:PROC
EXTRN sub_1006386A:PROC
EXTRN sub_10063883:PROC
EXTRN sub_100638A1:PROC
.CODE
FUN_10063776 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    xor xor edx, edx
    cmp cmp dword ptr [ebp + 8], edx
    jne L0
    mov mov eax, 08876086Ch
    jmp L2
    push push 44
    pop pop eax
    push push ebx
    push push esi
    mov mov dword ptr [ebp - 4], eax
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    add add eax, edx
    shr shr eax, 1
    lea lea ecx, [eax + eax*2]
    mov mov esi, dword ptr [ecx*4 + 01010C220h]
    mov mov bl, byte ptr [esi]
    mov mov cl, bl
    cmp cmp bl, byte ptr [edi]
    jne L2
    test test cl, cl
    je L2
    mov mov bl, byte ptr [esi + 1]
    mov mov cl, bl
    cmp cmp bl, byte ptr [edi + 1]
    jne L4
    inc inc esi
    inc inc esi
    inc inc edi
    inc inc edi
    test test cl, cl
    jne L1
    xor xor ecx, ecx
    jmp sub_1006381B
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    je sub_10063845
    jge sub_10063831
    lea lea edx, [eax + 1]
    jmp sub_10063839
    mov mov dword ptr [ebp - 4], eax
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp edx, eax
    jb L3
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
    lea lea eax, [eax + eax*2]
    shl shl eax, 2
    mov mov ecx, dword ptr [eax + 01010C228h]
    and and ecx, dword ptr [ebp + 12]
    cmp cmp ecx, dword ptr [ebp + 12]
    jne sub_1006386A
    mov mov edi, dword ptr [ebp + 16]
    test test edi, edi
    je sub_100638A1
    lea lea esi, [eax + 01010C220h]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    xor xor eax, eax
    jmp sub_10063883
FUN_10063776 ENDP
END
