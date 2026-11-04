.686
.MODEL FLAT, C
EXTRN sub_100698F4:PROC
EXTRN sub_10069900:PROC
EXTRN sub_10069937:PROC
EXTRN sub_100F78B4:PROC
EXTRN sub_100F78E0:PROC
.CODE
FUN_10069851 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 92]
    mov mov ecx, dword ptr [ebp + 8]
    lea lea edx, [ecx + eax]
    mov mov eax, dword ptr [ebx + 96]
    cmp cmp edx, eax
    push push edi
    jbe sub_100698F4
    test test eax, eax
    mov mov dword ptr [ebp + 8], eax
    jne L0
    mov mov dword ptr [ebp + 8], 0100h
    cmp cmp edx, dword ptr [ebp + 8]
    jbe L1
    mov mov eax, dword ptr [ebx + 92]
    add add eax, ecx
    mov mov ecx, dword ptr [ebp + 8]
    add add ecx, ecx
    cmp cmp eax, ecx
    mov mov dword ptr [ebp + 8], ecx
    ja L2
    mov mov eax, dword ptr [ebp + 8]
    shl shl eax, 2
    push push eax
    call sub_100F78B4
    mov mov edi, eax
    test test edi, edi
    pop pop ecx
    mov mov dword ptr [ebp - 4], edi
    jne sub_10069900
    mov mov eax, 08007000Eh
    jmp sub_10069937
    mov mov ecx, dword ptr [ebx + 92]
    shl shl ecx, 2
    mov mov eax, ecx
    push push esi
    mov mov esi, dword ptr [ebx + 88]
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    push push dword ptr [ebx + 88]
    call sub_100F78E0
    mov mov eax, dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 88], eax
    mov mov eax, dword ptr [ebp + 8]
    pop pop ecx
    mov mov dword ptr [ebx + 96], eax
    pop pop esi
    xor xor eax, eax
    pop pop edi
    pop pop ebx
    leave leave
    ret ret 4
FUN_10069851 ENDP
END
