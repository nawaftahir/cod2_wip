.686
.MODEL FLAT, C
EXTRN sub_100500DF:PROC
EXTRN sub_100500F8:PROC
.CODE
FUN_10050600 PROC
    mov eax, dword ptr [edi + 4]
    push esi
    push 48
    push 1
    push edi
    call dword ptr [eax]
    mov esi, eax
    mov dword ptr [edi + 0000001A8h], esi
    xor eax, eax
    mov dword ptr [esi], 010050150h
    mov byte ptr [esi + 8], al
    mov ecx, dword ptr [edi + 108]
    imul ecx, dword ptr [edi + 100]
    mov dword ptr [esi + 40], ecx
    mov ecx, dword ptr [edi + 00000011Ch]
    add esp, 12
    cmp ecx, 2
    jne L0
    mov eax, dword ptr [esi + 40]
    push eax
    mov dword ptr [esi + 4], 010050170h
    mov dword ptr [esi + 12], 0100503D0h
    mov edx, dword ptr [edi + 4]
    push 1
    push edi
    call dword ptr [edx + 4]
    add esp, 12
    mov dword ptr [esi + 32], eax
    mov eax, edi
    pop esi
    jmp sub_100500DF
L0:
    mov dword ptr [esi + 32], eax
    mov dword ptr [esi + 4], 010050240h
    mov dword ptr [esi + 12], 010050280h
    mov eax, edi
    pop esi
    jmp sub_100500F8
FUN_10050600 ENDP
END
