.686
.MODEL FLAT, C
EXTRN sub_100500DF:PROC
EXTRN sub_100500F8:PROC
EXTRN sub_10050695:PROC
.CODE
FUN_10050600 PROC
    mov mov eax, dword ptr [edi + 4]
    push push esi
    push push 48
    push push 1
    push push edi
    call call dword ptr [eax]
    mov mov esi, eax
    mov mov dword ptr [edi + 01A8h], esi
    xor xor eax, eax
    mov mov dword ptr [esi], 010050150h
    mov mov byte ptr [esi + 8], al
    mov mov ecx, dword ptr [edi + 108]
    imul imul ecx, dword ptr [edi + 100]
    mov mov dword ptr [esi + 40], ecx
    mov mov ecx, dword ptr [edi + 011Ch]
    add add esp, 12
    cmp cmp ecx, 2
    jne sub_10050695
    mov mov eax, dword ptr [esi + 40]
    push push eax
    mov mov dword ptr [esi + 4], 010050170h
    mov mov dword ptr [esi + 12], 0100503D0h
    mov mov edx, dword ptr [edi + 4]
    push push 1
    push push edi
    call call dword ptr [edx + 4]
    add add esp, 12
    mov mov dword ptr [esi + 32], eax
    mov mov eax, edi
    pop pop esi
    jmp sub_100500DF
    mov mov dword ptr [esi + 32], eax
    mov mov dword ptr [esi + 4], 010050240h
    mov mov dword ptr [esi + 12], 010050280h
    mov mov eax, edi
    pop pop esi
    jmp sub_100500F8
FUN_10050600 ENDP
END
