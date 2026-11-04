.686
.MODEL FLAT, C
EXTRN sub_10067704:PROC
EXTRN sub_1006770F:PROC
EXTRN sub_1006771D:PROC
EXTRN sub_1006772F:PROC
EXTRN sub_10081D41:PROC
.CODE
FUN_1006768e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    test test edi, edi
    mov mov esi, ecx
    je sub_10067704
    mov mov eax, dword ptr [esi + 4]
    test test eax, eax
    jne L0
    and and dword ptr [edi], eax
    jmp sub_1006770F
    push push edi
    inc inc eax
    push push eax
    call sub_10081D41
    test test eax, eax
    jl sub_1006771D
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    add add eax, dword ptr [esi + 4]
L0:
    mov mov byte ptr [eax], 0
    mov mov edx, dword ptr [esi]
    test test edx, edx
    je sub_1006772F
    push push ebx
    lea lea esi, [edx + 4]
    mov mov ecx, esi
    lea lea edi, [ecx + 1]
    mov mov bl, byte ptr [ecx]
    inc inc ecx
    test test bl, bl
    jne sub_1006771D
    sub sub ecx, edi
    sub sub eax, ecx
    mov mov ebx, ecx
    shr shr ecx, 2
    mov mov edi, eax
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, ebx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edx, dword ptr [edx]
    test test edx, edx
    jne sub_1006772F
    pop pop ebx
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret 4
FUN_1006768e ENDP
END
