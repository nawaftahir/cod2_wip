.686
.MODEL FLAT, C
EXTRN sub_10084120:PROC
EXTRN sub_1008460D:PROC
EXTRN sub_100F787D:PROC
EXTRN sub_100F78B3:PROC
.CODE
FUN_100845a4 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 12]
    shl shl esi, 4
    push push esi
    call sub_100F787D
    mov mov ebx, eax
    test test ebx, ebx
    pop pop ecx
    jne L0
    mov mov esi, 08007000Eh
    jmp sub_1008460D
    push push edi
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    mov mov edx, ecx
    shr shr ecx, 2
    xor xor eax, eax
    mov mov edi, ebx
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, edx
    push push 6
    and and ecx, 3
    push push esi
    rep stosb rep stosb byte ptr es:[edi], al
    mov mov ecx, dword ptr [ebp + 8]
    push push ebx
    call sub_10084120
    mov mov esi, eax
    pop pop edi
    push push ebx
    call sub_100F78B3
    pop pop ecx
    mov mov eax, esi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 12
FUN_100845a4 ENDP
END
