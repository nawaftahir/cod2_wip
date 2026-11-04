.686
.MODEL FLAT, C
EXTRN sub_10062DEC:PROC
EXTRN sub_1006377D:PROC
EXTRN sub_10063795:PROC
EXTRN sub_10063798:PROC
EXTRN sub_100637AE:PROC
EXTRN sub_100637DE:PROC
EXTRN sub_10081D89:PROC
.CODE
FUN_100636dd PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 44
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    test test ebx, ebx
    je L0
    and and dword ptr [ebx], 0
    cmp cmp dword ptr [ebp + 8], 0
    je L1
    test test ebx, ebx
    jne L2
    mov mov eax, 08876086Ch
    jmp sub_10063795
    lea lea eax, [ebp + 8]
    push push eax
    lea lea eax, [ebp - 4]
    push push eax
    push push 047554244h
    push push dword ptr [ebp + 8]
    call sub_10062DEC
    test test eax, eax
    jl sub_100637AE
    cmp cmp eax, 1
    push push esi
L2:
    push push edi
    jne sub_1006377D
    push push 10
    pop pop ecx
    xor xor eax, eax
    lea lea edi, [ebp - 44]
    rep stosd rep stosd dword ptr es:[edi], eax
    push push 40
    pop pop eax
    mov mov dword ptr [ebp - 44], eax
    lea lea esi, [ebp - 44]
    mov mov dword ptr [ebp + 8], eax
    jmp sub_10063798
    mov mov esi, dword ptr [ebp - 4]
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebp + 8]
    call sub_10081D89
    test test eax, eax
    jl sub_100637DE
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebp + 12]
    mov mov dword ptr [ebx], eax
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100636dd ENDP
END
