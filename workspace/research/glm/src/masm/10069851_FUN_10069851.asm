.686
.MODEL FLAT, C
EXTRN sub_100F78B4:PROC
EXTRN sub_100F78E0:PROC
.CODE
FUN_10069851 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 92]
    mov ecx, dword ptr [ebp + 8]
    lea edx, [ecx + eax]
    mov eax, dword ptr [ebx + 96]
    cmp edx, eax
    push edi
    jbe L4
    test eax, eax
    mov dword ptr [ebp + 8], eax
    jne L0
    mov dword ptr [ebp + 8], 000000100h
L0:
    cmp edx, dword ptr [ebp + 8]
    jbe L2
    mov eax, dword ptr [ebx + 92]
    add eax, ecx
L1:
    mov ecx, dword ptr [ebp + 8]
    add ecx, ecx
    cmp eax, ecx
    mov dword ptr [ebp + 8], ecx
    ja L1
L2:
    mov eax, dword ptr [ebp + 8]
    shl eax, 2
    push eax
    call sub_100F78B4
    mov edi, eax
    test edi, edi
    pop ecx
    mov dword ptr [ebp - 4], edi
    jne L3
    mov eax, 08007000Eh
    jmp L5
L3:
    mov ecx, dword ptr [ebx + 92]
    shl ecx, 2
    mov eax, ecx
    push esi
    mov esi, dword ptr [ebx + 88]
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    push dword ptr [ebx + 88]
    call sub_100F78E0
    mov eax, dword ptr [ebp - 4]
    mov dword ptr [ebx + 88], eax
    mov eax, dword ptr [ebp + 8]
    pop ecx
    mov dword ptr [ebx + 96], eax
    pop esi
L4:
    xor eax, eax
L5:
    pop edi
    pop ebx
    leave
    ret 4
FUN_10069851 ENDP
END
