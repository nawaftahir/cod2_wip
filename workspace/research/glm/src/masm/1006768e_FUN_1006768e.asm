.686
.MODEL FLAT, C
EXTRN sub_10081D41:PROC
.CODE
FUN_1006768e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov esi, ecx
    je L3
    mov eax, dword ptr [esi + 4]
    test eax, eax
    jne L0
    and dword ptr [edi], eax
    jmp L3
L0:
    push edi
    inc eax
    push eax
    call sub_10081D41
    test eax, eax
    jl L4
    mov eax, dword ptr [edi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    add eax, dword ptr [esi + 4]
    mov byte ptr [eax], 0
    mov edx, dword ptr [esi]
    test edx, edx
    je L3
    push ebx
L1:
    lea esi, [edx + 4]
    mov ecx, esi
    lea edi, [ecx + 1]
L2:
    mov bl, byte ptr [ecx]
    inc ecx
    test bl, bl
    jne L2
    sub ecx, edi
    sub eax, ecx
    mov ebx, ecx
    shr ecx, 2
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, ebx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edx, dword ptr [edx]
    test edx, edx
    jne L1
    pop ebx
L3:
    xor eax, eax
L4:
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_1006768e ENDP
END
