.686
.MODEL FLAT, C
EXTRN sub_1006C464:PROC
EXTRN sub_1008612C:PROC
EXTRN sub_100F789E:PROC
EXTRN sub_100F78F9:PROC
.CODE
FUN_10086026 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ecx
    push push ebx
    mov mov ebx, ecx
    mov mov eax, dword ptr [ebx + 36]
    cmp cmp dword ptr [ebx + 12], eax
    jne L4
    test test eax, eax
    je L0
    add add eax, eax
    mov mov dword ptr [ebp - 4], eax
    jmp L1
    mov mov dword ptr [ebp - 4], 0100h
    mov mov eax, dword ptr [ebp - 4]
    shl shl eax, 2
    push push eax
    call sub_100F789E
    mov mov edx, eax
    test test edx, edx
    pop pop ecx
    mov mov dword ptr [ebp - 8], edx
    jne L2
    mov mov ecx, dword ptr [ebp + 8]
    test test ecx, ecx
    je L3
    push push 1
    call sub_1006C464
    or or eax, -1
    jmp sub_1008612C
    mov mov ecx, dword ptr [ebx + 12]
    shl shl ecx, 2
    mov mov eax, ecx
    shr shr ecx, 2
    push push esi
    mov mov esi, dword ptr [ebx + 24]
    push push edi
    mov mov edi, edx
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    mov mov edi, dword ptr [ebx + 12]
    mov mov esi, dword ptr [ebp - 4]
    mov mov ecx, esi
    sub sub ecx, edi
    shl shl ecx, 2
    lea lea edi, [edx + edi*4]
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    push push dword ptr [ebx + 24]
L2:
    call sub_100F78F9
    mov mov eax, dword ptr [ebp - 8]
    pop pop ecx
    pop pop edi
    mov mov dword ptr [ebx + 36], esi
    mov mov dword ptr [ebx + 24], eax
    pop pop esi
    mov mov eax, dword ptr [ebx + 12]
    mov mov ecx, dword ptr [ebx + 24]
    mov mov edx, dword ptr [ebp + 8]
    mov mov dword ptr [ecx + eax*4], edx
    mov mov eax, dword ptr [ebx + 12]
    lea lea ecx, [eax + 1]
    mov mov dword ptr [ebx + 12], ecx
    pop pop ebx
L4:
    leave leave
    ret ret 4
FUN_10086026 ENDP
END
