.686
.MODEL FLAT, C
EXTRN sub_100516F3:PROC
EXTRN sub_100516FC:PROC
.CODE
FUN_10051650 PROC
    mov mov eax, dword ptr [esi + 4]
    push push edi
    push push 28
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov edi, eax
    xor xor eax, eax
    mov mov dword ptr [esi + 0194h], edi
    mov mov dword ptr [edi], 010051390h
    mov mov dword ptr [edi + 8], eax
    mov mov dword ptr [edi + 12], eax
    mov mov cl, byte ptr [esi + 82]
    add add esp, 12
    cmp cmp cl, al
    je sub_100516FC
    cmp cmp byte ptr [esp + 8], al
    mov mov ecx, dword ptr [esi + 011Ch]
    mov mov dword ptr [edi + 16], ecx
    je sub_100516F3
    mov mov edx, dword ptr [esi + 104]
    push push ebx
    push push ebp
    lea lea ebp, [edx + ecx - 1]
    mov mov eax, ebp
    cdq cdq
    idiv idiv ecx
    mov mov eax, dword ptr [esi + 108]
    imul imul eax, dword ptr [esi + 100]
    mov mov ebx, dword ptr [esi + 4]
    push push ecx
    sub sub ebp, edx
    push push ebp
    push push eax
    push push 0
    push push 1
    push push esi
    call call dword ptr [ebx + 16]
    add add esp, 24
    pop pop ebp
    pop pop ebx
    mov mov dword ptr [edi + 8], eax
    pop pop edi
    ret ret
    mov mov eax, dword ptr [esi + 108]
    imul imul eax, dword ptr [esi + 100]
    mov mov edx, dword ptr [esi + 4]
    push push ecx
    push push eax
    push push 1
    push push esi
    call call dword ptr [edx + 8]
    add add esp, 16
    mov mov dword ptr [edi + 12], eax
    pop pop edi
    ret ret
FUN_10051650 ENDP
END
