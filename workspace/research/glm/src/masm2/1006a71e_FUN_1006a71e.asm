.686
.MODEL FLAT, C
EXTRN sub_1006A78F:PROC
EXTRN sub_10081D37:PROC
.CODE
FUN_1006a71e PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push esi
    lea lea eax, [ebp - 4]
    push push eax
    mov mov esi, ecx
    mov mov eax, dword ptr [esi + 92]
    shl shl eax, 2
    push push eax
    call sub_10081D37
    test test eax, eax
    jl sub_1006A78F
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push ebx
    push push edi
    push push eax
    call call dword ptr [ecx + 16]
    mov mov esi, dword ptr [esi + 88]
    mov mov ebx, eax
    mov mov eax, dword ptr [ebp - 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    mov mov edi, eax
    mov mov ecx, ebx
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    mov mov eax, dword ptr [ebp + 8]
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov ecx, dword ptr [ebp - 4]
    pop pop edi
    mov mov dword ptr [eax], ecx
    xor xor eax, eax
    pop pop ebx
    pop pop esi
    leave leave
    ret ret 4
FUN_1006a71e ENDP
END
