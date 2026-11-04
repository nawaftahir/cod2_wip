.686
.MODEL FLAT, C
EXTRN sub_10084120:PROC
EXTRN sub_100F787D:PROC
EXTRN sub_100F78B3:PROC
.CODE
FUN_100845a4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov esi, dword ptr [ebp + 12]
    shl esi, 4
    push esi
    call sub_100F787D
    mov ebx, eax
    test ebx, ebx
    pop ecx
    jne L0
    mov esi, 08007000Eh
    jmp L1
L0:
    push edi
    push dword ptr [ebp + 16]
    mov ecx, esi
    mov edx, ecx
    shr ecx, 2
    xor eax, eax
    mov edi, ebx
    rep stosd dword ptr es:[edi], eax
    mov ecx, edx
    push 6
    and ecx, 3
    push esi
    rep stosb byte ptr es:[edi], al
    mov ecx, dword ptr [ebp + 8]
    push ebx
    call sub_10084120
    mov esi, eax
    pop edi
L1:
    push ebx
    call sub_100F78B3
    pop ecx
    mov eax, esi
    pop esi
    pop ebx
    pop ebp
    ret 12
FUN_100845a4 ENDP
END
