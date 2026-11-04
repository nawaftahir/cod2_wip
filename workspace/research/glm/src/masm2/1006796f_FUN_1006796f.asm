.686
.MODEL FLAT, C
EXTRN sub_100679FC:PROC
EXTRN sub_10067A0F:PROC
EXTRN sub_10067A43:PROC
EXTRN sub_10067A67:PROC
EXTRN sub_10082712:PROC
EXTRN sub_100F855C:PROC
EXTRN sub_100F8714:PROC
.CODE
FUN_1006796f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    mov mov esi, ecx
    cmp cmp ebx, dword ptr [esi + 4]
    push push edi
    jae sub_100679FC
    movsx movsx eax, byte ptr [ebx]
    push push eax
    call sub_100F855C
    test test eax, eax
    pop pop ecx
    jne L0
    cmp cmp byte ptr [ebx], 95
    jne sub_10067A0F
    lea lea edi, [ebx + 1]
    jmp L1
    movsx movsx eax, byte ptr [edi]
    push push eax
    call sub_100F8714
    test test eax, eax
    pop pop ecx
    jne L3
    cmp cmp byte ptr [edi], 95
    jne L4
    inc inc edi
    cmp cmp edi, dword ptr [esi + 4]
    jb L2
    mov mov ecx, dword ptr [esi + 44]
    sub sub edi, ebx
    mov mov ebx, edi
    push push 1
    lea lea eax, [ebx + 1]
    push push eax
    call sub_10082712
    test test eax, eax
    je sub_10067A43
    mov mov esi, dword ptr [ebp + 8]
    mov mov ecx, ebx
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp + 12]
    mov mov byte ptr [eax + ebx], 0
L3:
    mov mov dword ptr [ecx], eax
    mov mov eax, ebx
    jmp sub_10067A67
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
L4:
    pop pop ebp
    ret ret 8
FUN_1006796f ENDP
END
