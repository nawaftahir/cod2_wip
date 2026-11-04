.686
.MODEL FLAT, C
EXTRN sub_10081D37:PROC
.CODE
FUN_1006a71e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    lea eax, [ebp - 4]
    push eax
    mov esi, ecx
    mov eax, dword ptr [esi + 92]
    shl eax, 2
    push eax
    call sub_10081D37
    test eax, eax
    jl L0
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push ebx
    push edi
    push eax
    call dword ptr [ecx + 0x10]
    mov esi, dword ptr [esi + 88]
    mov ebx, eax
    mov eax, dword ptr [ebp - 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xc]
    mov edi, eax
    mov ecx, ebx
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    mov eax, dword ptr [ebp + 8]
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov ecx, dword ptr [ebp - 4]
    pop edi
    mov dword ptr [eax], ecx
    xor eax, eax
    pop ebx
L0:
    pop esi
    leave
    ret 4
FUN_1006a71e ENDP
END
