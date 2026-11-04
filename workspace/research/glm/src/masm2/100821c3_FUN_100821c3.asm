.686
.MODEL FLAT, C
EXTRN sub_10062EB0:PROC
EXTRN sub_10063754:PROC
EXTRN sub_10080E77:PROC
EXTRN sub_10080EC0:PROC
EXTRN sub_10081E55:PROC
EXTRN sub_10082282:PROC
EXTRN sub_10082289:PROC
EXTRN sub_1008228F:PROC
EXTRN sub_10082297:PROC
EXTRN sub_100822A0:PROC
EXTRN sub_100822D6:PROC
EXTRN sub_100822EE:PROC
EXTRN sub_10082300:PROC
EXTRN sub_100F78BF:PROC
.CODE
FUN_100821c3 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov ebx, ecx
    push push esi
    mov mov dword ptr [ebp - 4], ebx
    call sub_10062EB0
    test test eax, eax
    mov mov dword ptr [ebp + 8], eax
    jne L0
    mov mov eax, 088760B59h
    jmp sub_10082289
    add add ebx, 8
    push push ebx
    push push eax
    call sub_10081E55
    test test eax, eax
    jl sub_10082297
    mov mov eax, dword ptr [ebx]
    mov mov ecx, dword ptr [eax]
    push push edi
    push push eax
    call call dword ptr [ecx + 12]
    mov mov ecx, dword ptr [ebp + 8]
    mov mov edi, eax
    mov mov eax, ecx
    shr shr ecx, 2
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, eax
    and and ecx, 3
    push push 32
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    call sub_100F78BF
    test test eax, eax
    pop pop ecx
    je sub_10082282
    mov mov ecx, eax
    call sub_10080E77
    mov mov edi, eax
    jmp sub_1008228F
    xor xor edi, edi
    test test edi, edi
    jne sub_100822A0
    mov mov eax, 08007000Eh
    jmp sub_100822D6
    mov mov esi, dword ptr [ebp - 4]
    mov mov ebx, dword ptr [ebx]
    lea lea eax, [esi + 12]
    push push eax
    mov mov eax, dword ptr [ebx]
    push push ebx
    call call dword ptr [eax + 12]
    push push eax
    mov mov ecx, edi
    call sub_10080EC0
    mov mov ebx, eax
    test test ebx, ebx
    jge sub_100822EE
    push push 1
    mov mov ecx, edi
    call sub_10063754
    mov mov eax, ebx
    jmp sub_10082300
    mov mov dword ptr [esi + 16], edi
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 4
FUN_100821c3 ENDP
END
