.686
.MODEL FLAT, C
EXTRN sub_100678C3:PROC
EXTRN sub_10067D04:PROC
EXTRN sub_10067DB5:PROC
EXTRN sub_10082520:PROC
EXTRN sub_10082727:PROC
EXTRN sub_100827AF:PROC
EXTRN sub_100827C3:PROC
EXTRN fp_1010C044:DWORD
EXTRN g_1010C040:DWORD
.CODE
FUN_10063b46 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 000000104h
    push ebx
    push esi
    mov esi, dword ptr [ebp + 28]
    push edi
    xor edi, edi
    cmp dword ptr [ebp + 12], edi
    mov ebx, ecx
    mov dword ptr [ebx + 88], esi
    je L0
    push edi
    push edi
    push 000000104h
    lea eax, [ebp - 000000104h]
    push eax
    push -1
    push dword ptr [ebp + 8]
    push edi
    push 00000FDE9h
    call dword ptr [fp_1010C044]
    lea eax, [ebp - 000000104h]
    mov dword ptr [ebp + 8], eax
L0:
    cmp esi, edi
    je L2
    mov eax, dword ptr [ebp + 8]
    lea esi, [eax + 1]
L1:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L1
    mov ecx, dword ptr [ebp + 16]
    sub eax, esi
    lea esi, [eax + 1]
    push 1
    push esi
    call sub_10082727
    cmp eax, edi
    mov dword ptr [ebx + 92], eax
    je L3
    mov ecx, esi
    mov esi, dword ptr [ebp + 8]
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebx + 88]
    mov ecx, dword ptr [eax]
    lea edi, [ebx + 104]
    push edi
    lea esi, [ebx + 100]
    push esi
    push dword ptr [ebp + 36]
    push dword ptr [ebx + 92]
    push dword ptr [ebp + 32]
    push eax
    call dword ptr [ecx]
    test eax, eax
    mov dword ptr [ebp + 28], eax
    jge L7
    push dword ptr [ebp + 8]
    push 01010C588h
    push 0000005E3h
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 24]
    call sub_10067D04
    mov eax, dword ptr [ebp + 28]
    add esp, 20
    jmp L8
L2:
    push edi
    push edi
    push edi
    push dword ptr [ebp + 8]
    mov edi, dword ptr [g_1010C040]
    call edi
    mov ecx, dword ptr [ebp + 16]
    mov esi, eax
    lea eax, [esi + 1]
    push 1
    push eax
    mov dword ptr [ebp + 28], eax
    call sub_100827AF
    test eax, eax
    mov dword ptr [ebx + 96], eax
    je L3
    mov ecx, dword ptr [ebp + 16]
    push 1
    push dword ptr [ebp + 28]
    call sub_100827C3
    test eax, eax
    mov dword ptr [ebx + 92], eax
    jne L4
L3:
    mov eax, 08007000Eh
    jmp L8
L4:
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebx + 96]
    push esi
    push dword ptr [ebp + 8]
    call edi
    mov eax, dword ptr [ebx + 96]
    mov ecx, dword ptr [ebp + 28]
    mov byte ptr [esi + eax], 0
    mov esi, dword ptr [ebx + 96]
    mov edi, dword ptr [ebx + 92]
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov eax, dword ptr [ebp + 12]
    test eax, eax
    je L5
    mov byte ptr [eax], 0
L5:
    push 0
    push dword ptr [ebx + 92]
    lea ecx, [ebx + 60]
    call sub_10082520
    mov esi, eax
    test esi, esi
    jge L6
    push dword ptr [ebp + 8]
    push 01010C588h
    push 0000005E3h
    push dword ptr [ebp + 20]
    push dword ptr [ebp + 24]
    call sub_10067DB5
    add esp, 20
    mov eax, esi
    jmp L8
L6:
    mov eax, dword ptr [ebx + 68]
    lea esi, [ebx + 100]
    mov dword ptr [esi], eax
    mov eax, dword ptr [ebx + 72]
    lea edi, [ebx + 104]
    mov dword ptr [edi], eax
L7:
    push dword ptr [ebp + 24]
    mov ecx, ebx
    push dword ptr [ebp + 16]
    push 1
    push dword ptr [ebx + 92]
    push dword ptr [edi]
    push dword ptr [esi]
    call sub_100678C3
    test eax, eax
    jl L8
    xor eax, eax
L8:
    pop edi
    pop esi
    pop ebx
    leave
    ret 32
FUN_10063b46 ENDP
END
