.686
.MODEL FLAT, C
EXTRN sub_1006513F:PROC
EXTRN sub_10068C49:PROC
EXTRN sub_1006B320:PROC
EXTRN sub_1006B380:PROC
EXTRN sub_1006B3B5:PROC
EXTRN sub_1006BEB1:PROC
EXTRN sub_10082744:PROC
EXTRN sub_100836A4:PROC
EXTRN sub_1008434C:PROC
EXTRN sub_1009A955:PROC
EXTRN sub_1009A963:PROC
EXTRN sub_1009A98A:PROC
EXTRN sub_1009A9A1:PROC
EXTRN sub_1009A9D7:PROC
EXTRN sub_1009A9F5:PROC
EXTRN sub_1009AA19:PROC
EXTRN sub_100F7899:PROC
EXTRN sub_100F796F:PROC
EXTRN sub_100F7989:PROC
EXTRN EXTRN g_101AC95C:DWORD:DWORD
.CODE
FUN_1009a7cb PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 08Ch
    push push ebx
    push push esi
    mov mov ebx, ecx
    xor xor esi, esi
    push push edi
    lea lea ecx, [ebp - 08Ch]
    mov mov dword ptr [ebp - 8], esi
    mov mov dword ptr [ebp - 4], esi
    call sub_10068C49
    cmp cmp dword ptr [ebp + 8], esi
    je L0
    push push 8
    call sub_100F7899
    cmp cmp eax, esi
    pop pop ecx
    je L1
    push push dword ptr [ebx + 16]
    mov mov ecx, eax
    push push ebx
    call sub_1008434C
    mov mov dword ptr [ebp - 4], eax
    jmp L2
    mov mov dword ptr [ebp - 4], esi
    cmp cmp dword ptr [ebp - 4], esi
    je L3
    lea lea eax, [ebp - 8]
    push push eax
    push push dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebx]
    and and eax, 0C3h
    push push eax
    push push dword ptr [ebx + 4]
    lea lea ecx, [ebp - 08Ch]
    call sub_1006BEB1
    test test eax, eax
    jl L4
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 16]
    mov mov ecx, dword ptr [g_101AC95C]
    push push 1
    push push eax
    mov mov dword ptr [ebp + 8], eax
    call sub_10082744
    mov mov edi, eax
    cmp cmp edi, esi
L2:
    mov mov dword ptr [ebp - 12], edi
    jne L5
    lea lea ecx, [ebp - 08Ch]
    call sub_1006B320
    jmp sub_1009A963
    mov mov eax, dword ptr [ebp - 8]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 12]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov esi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov eax, dword ptr [ebp - 8]
    test test eax, eax
    je sub_1009A955
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    and and dword ptr [ebp - 8], 0
    push push 56
    call sub_1006513F
    test test eax, eax
    je sub_1009A98A
    push push dword ptr [ebp + 8]
    lea lea ecx, [ebx + 32]
    push push dword ptr [ebp - 12]
    push push ecx
    mov mov ecx, eax
    call sub_100836A4
    mov mov esi, eax
    jmp sub_1009A9A1
    xor xor esi, esi
    test test esi, esi
    jne sub_1009A9D7
    lea lea ecx, [ebp - 08Ch]
    call sub_1006B380
    push push dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 64], 1
    call sub_100F796F
    mov mov eax, dword ptr [ebp - 8]
    cmp cmp eax, esi
    pop pop ecx
    je sub_1009A9F5
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    xor xor eax, eax
    jmp sub_1009AA19
    push push dword ptr [ebp - 4]
    call sub_100F7989
    pop pop ecx
    lea lea ecx, [ebp - 08Ch]
    call sub_1006B3B5
    mov mov eax, esi
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_1009a7cb ENDP
END
