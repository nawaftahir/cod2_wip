.686
.MODEL FLAT, C
EXTRN sub_10062DEC:PROC
EXTRN sub_10081D89:PROC
.CODE
FUN_100636dd PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push ebx
    mov ebx, dword ptr [ebp + 12]
    test ebx, ebx
    je L0
    and dword ptr [ebx], 0
L0:
    cmp dword ptr [ebp + 8], 0
    je L1
    test ebx, ebx
    jne L2
L1:
    mov eax, 08876086Ch
    jmp L6
L2:
    lea eax, [ebp + 8]
    push eax
    lea eax, [ebp - 4]
    push eax
    push 047554244h
    push dword ptr [ebp + 8]
    call sub_10062DEC
    test eax, eax
    jl L6
    cmp eax, 1
    push esi
    push edi
    jne L3
    push 10
    pop ecx
    xor eax, eax
    lea edi, [ebp - 44]
    rep stosd dword ptr es:[edi], eax
    push 40
    pop eax
    mov dword ptr [ebp - 44], eax
    lea esi, [ebp - 44]
    mov dword ptr [ebp + 8], eax
    jmp L4
L3:
    mov esi, dword ptr [ebp - 4]
L4:
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebp + 8]
    call sub_10081D89
    test eax, eax
    jl L5
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ebp + 8]
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebp + 12]
    mov dword ptr [ebx], eax
    xor eax, eax
L5:
    pop edi
    pop esi
L6:
    pop ebx
    leave
    ret 8
FUN_100636dd ENDP
END
