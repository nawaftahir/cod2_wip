.686
.MODEL FLAT, C
EXTRN sub_1005F37D:PROC
EXTRN sub_1005F400:PROC
EXTRN sub_1005F6D8:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_1005faf0 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov dl, byte ptr [eax + 000000404h]
    test dl, dl
    push ebp
    mov ebp, dword ptr [esp + 8]
    push edi
    je L0
    mov edx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push ebx
    push esi
    push ecx
    mov eax, 1
    call sub_1005F6D8
    mov edi, eax
    add esp, 4
    mov esi, ebp
    mov ecx, edi
L1:
    mov al, byte ptr [ecx]
    mov bl, byte ptr [esi]
    mov dl, al
    cmp al, bl
    jne L3
    test dl, dl
    je L2
    mov al, byte ptr [ecx + 1]
    mov bl, byte ptr [esi + 1]
    mov dl, al
    cmp al, bl
    jne L3
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L1
L2:
    xor ecx, ecx
    jmp L4
L3:
    sbb ecx, ecx
    sbb ecx, -1
L4:
    test ecx, ecx
    pop esi
    pop ebx
    jne L5
    pop edi
    mov eax, 1
    pop ebp
    ret
L5:
    mov eax, dword ptr [esp + 16]
    test eax, eax
    push ebp
    push edi
    push 01019B8F4h
    je L6
    call sub_1005F400
    add esp, 12
    pop edi
    xor eax, eax
    pop ebp
    ret
L6:
    call sub_1005F37D
    add esp, 12
    pop edi
    xor eax, eax
    pop ebp
    ret
FUN_1005faf0 ENDP
END
