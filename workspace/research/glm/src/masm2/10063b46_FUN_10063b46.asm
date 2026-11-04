.686
.MODEL FLAT, C
EXTRN sub_10063D4C:PROC
EXTRN sub_10063D6A:PROC
EXTRN sub_10063D82:PROC
EXTRN sub_10063DC1:PROC
EXTRN sub_10063DDB:PROC
EXTRN sub_10063E07:PROC
EXTRN sub_10063E23:PROC
EXTRN sub_10063E6E:PROC
EXTRN sub_10063E98:PROC
EXTRN sub_100678C3:PROC
EXTRN sub_10067D04:PROC
EXTRN sub_10067DB5:PROC
EXTRN sub_10082520:PROC
EXTRN sub_10082727:PROC
EXTRN sub_100827AF:PROC
EXTRN sub_100827C3:PROC
EXTRN EXTRN fp_1010C044:DWORD:DWORD
EXTRN EXTRN g_1010C040:DWORD:DWORD
.CODE
FUN_10063b46 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0104h
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 28]
    push push edi
    xor xor edi, edi
    cmp cmp dword ptr [ebp + 12], edi
    mov mov ebx, ecx
    mov mov dword ptr [ebx + 88], esi
    je L0
    push push edi
    push push edi
    push push 0104h
    lea lea eax, [ebp - 0104h]
    push push eax
    push push -1
    push push dword ptr [ebp + 8]
    push push edi
    push push 0FDE9h
    call dword ptr [fp_1010C044]
    lea lea eax, [ebp - 0104h]
    mov mov dword ptr [ebp + 8], eax
    cmp cmp esi, edi
    je L2
    mov mov eax, dword ptr [ebp + 8]
    lea lea esi, [eax + 1]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L1
    mov mov ecx, dword ptr [ebp + 16]
    sub sub eax, esi
    lea lea esi, [eax + 1]
L0:
    push push 1
    push push esi
    call sub_10082727
    cmp cmp eax, edi
    mov mov dword ptr [ebx + 92], eax
    je L3
    mov mov ecx, esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov edi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebx + 88]
    mov mov ecx, dword ptr [eax]
    lea lea edi, [ebx + 104]
    push push edi
    lea lea esi, [ebx + 100]
    push push esi
    push push dword ptr [ebp + 36]
    push push dword ptr [ebx + 92]
    push push dword ptr [ebp + 32]
    push push eax
    call call dword ptr [ecx]
    test test eax, eax
    mov mov dword ptr [ebp + 28], eax
    jge sub_10063D82
    push push dword ptr [ebp + 8]
    push push 01010C588h
    push push 05E3h
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 24]
    call sub_10067D04
    mov mov eax, dword ptr [ebp + 28]
    add add esp, 20
    jmp sub_10063DC1
    push push edi
    push push edi
    push push edi
    push push dword ptr [ebp + 8]
    mov mov edi, dword ptr [g_1010C040]
    call call edi
    mov mov ecx, dword ptr [ebp + 16]
    mov mov esi, eax
    lea lea eax, [esi + 1]
    push push 1
    push push eax
    mov mov dword ptr [ebp + 28], eax
    call sub_100827AF
    test test eax, eax
    mov mov dword ptr [ebx + 96], eax
    je sub_10063D4C
    mov mov ecx, dword ptr [ebp + 16]
    push push 1
    push push dword ptr [ebp + 28]
    call sub_100827C3
    test test eax, eax
    mov mov dword ptr [ebx + 92], eax
    jne sub_10063D6A
    mov mov eax, 08007000Eh
    jmp sub_10063E07
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebx + 96]
L2:
    push push esi
    push push dword ptr [ebp + 8]
    call call edi
    mov mov eax, dword ptr [ebx + 96]
    mov mov ecx, dword ptr [ebp + 28]
    mov mov byte ptr [esi + eax], 0
    mov mov esi, dword ptr [ebx + 96]
    mov mov edi, dword ptr [ebx + 92]
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebp + 12]
    test test eax, eax
    je sub_10063DDB
    mov mov byte ptr [eax], 0
    push push 0
    push push dword ptr [ebx + 92]
    lea lea ecx, [ebx + 60]
    call sub_10082520
    mov mov esi, eax
    test test esi, esi
    jge sub_10063E23
    push push dword ptr [ebp + 8]
    push push 01010C588h
    push push 05E3h
    push push dword ptr [ebp + 20]
    push push dword ptr [ebp + 24]
    call sub_10067DB5
    add add esp, 20
    mov mov eax, esi
    jmp sub_10063E6E
    mov mov eax, dword ptr [ebx + 68]
    lea lea esi, [ebx + 100]
    mov mov dword ptr [esi], eax
    mov mov eax, dword ptr [ebx + 72]
    lea lea edi, [ebx + 104]
    mov mov dword ptr [edi], eax
    push push dword ptr [ebp + 24]
    mov mov ecx, ebx
    push push dword ptr [ebp + 16]
    push push 1
    push push dword ptr [ebx + 92]
    push push dword ptr [edi]
    push push dword ptr [esi]
    call sub_100678C3
    test test eax, eax
    jl sub_10063E98
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 32
FUN_10063b46 ENDP
END
