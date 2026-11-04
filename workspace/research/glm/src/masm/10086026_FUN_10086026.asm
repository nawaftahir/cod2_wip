.686
.MODEL FLAT, C
EXTRN sub_1006C464:PROC
EXTRN sub_100F789E:PROC
EXTRN sub_100F78F9:PROC
.CODE
FUN_10086026 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 36]
    cmp dword ptr [ebx + 12], eax
    jne L4
    test eax, eax
    je L0
    add eax, eax
    mov dword ptr [ebp - 4], eax
    jmp L1
L0:
    mov dword ptr [ebp - 4], 000000100h
L1:
    mov eax, dword ptr [ebp - 4]
    shl eax, 2
    push eax
    call sub_100F789E
    mov edx, eax
    test edx, edx
    pop ecx
    mov dword ptr [ebp - 8], edx
    jne L3
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    je L2
    push 1
    call sub_1006C464
L2:
    or eax, 0FFFFFFFFh
    jmp L5
L3:
    mov ecx, dword ptr [ebx + 12]
    shl ecx, 2
    mov eax, ecx
    shr ecx, 2
    push esi
    mov esi, dword ptr [ebx + 24]
    push edi
    mov edi, edx
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    mov edi, dword ptr [ebx + 12]
    mov esi, dword ptr [ebp - 4]
    mov ecx, esi
    sub ecx, edi
    shl ecx, 2
    lea edi, [edx + edi*4]
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
    push dword ptr [ebx + 24]
    call sub_100F78F9
    mov eax, dword ptr [ebp - 8]
    pop ecx
    pop edi
    mov dword ptr [ebx + 36], esi
    mov dword ptr [ebx + 24], eax
    pop esi
L4:
    mov eax, dword ptr [ebx + 12]
    mov ecx, dword ptr [ebx + 24]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ecx + eax*4], edx
    mov eax, dword ptr [ebx + 12]
    lea ecx, [eax + 1]
    mov dword ptr [ebx + 12], ecx
L5:
    pop ebx
    leave
    ret 4
FUN_10086026 ENDP
END
