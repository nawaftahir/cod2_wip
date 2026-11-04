.686
.MODEL FLAT, C
EXTRN sub_10062EB0:PROC
EXTRN sub_10063754:PROC
EXTRN sub_10080E77:PROC
EXTRN sub_10080EC0:PROC
EXTRN sub_10081E55:PROC
EXTRN sub_100F78BF:PROC
.CODE
FUN_100821c3 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    mov ebx, ecx
    push esi
    mov dword ptr [ebp - 4], ebx
    call sub_10062EB0
    test eax, eax
    mov dword ptr [ebp + 8], eax
    jne L0
    mov eax, 088760B59h
    jmp L6
L0:
    add ebx, 8
    push ebx
    push eax
    call sub_10081E55
    test eax, eax
    jl L6
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [eax]
    push edi
    push eax
    call dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ebp + 8]
    mov edi, eax
    mov eax, ecx
    shr ecx, 2
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, eax
    and ecx, 3
    push 32
    rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_100F78BF
    test eax, eax
    pop ecx
    je L1
    mov ecx, eax
    call sub_10080E77
    mov edi, eax
    jmp L2
L1:
    xor edi, edi
L2:
    test edi, edi
    jne L3
    mov eax, 08007000Eh
    jmp L5
L3:
    mov esi, dword ptr [ebp - 4]
    mov ebx, dword ptr [ebx]
    lea eax, [esi + 12]
    push eax
    mov eax, dword ptr [ebx]
    push ebx
    call dword ptr [eax + 0xc]
    push eax
    mov ecx, edi
    call sub_10080EC0
    mov ebx, eax
    test ebx, ebx
    jge L4
    push 1
    mov ecx, edi
    call sub_10063754
    mov eax, ebx
    jmp L5
L4:
    mov dword ptr [esi + 16], edi
    xor eax, eax
L5:
    pop edi
L6:
    pop esi
    pop ebx
    leave
    ret 4
FUN_100821c3 ENDP
END
