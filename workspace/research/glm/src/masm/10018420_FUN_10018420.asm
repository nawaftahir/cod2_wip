.686
.MODEL FLAT, C
EXTRN sub_1005F3F3:PROC
EXTRN sub_1005F6D3:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_10018420 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov dl, byte ptr [eax + 000000404h]
    test dl, dl
    je L0
    mov edx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push ebp
    push esi
    push edi
    push ecx
    mov eax, 1
    call sub_1005F6D3
    mov esi, dword ptr [ebx]
    add esp, 4
    xor edi, edi
    test esi, esi
    mov ebp, eax
    je L6
L1:
    mov ecx, ebp
L2:
    mov al, byte ptr [ecx]
    mov dl, al
    cmp al, byte ptr [esi]
    jne L4
    test dl, dl
    je L3
    mov al, byte ptr [ecx + 1]
    mov dl, al
    cmp al, byte ptr [esi + 1]
    jne L4
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L2
L3:
    xor ecx, ecx
    jmp L5
L4:
    sbb ecx, ecx
    sbb ecx, -1
L5:
    test ecx, ecx
    je L7
    mov esi, dword ptr [ebx + edi*8 + 8]
    inc edi
    test esi, esi
    jne L1
L6:
    push ebp
    push 010195888h
    call sub_1005F3F3
    add esp, 8
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    ret
L7:
    lea eax, [ebx + edi*8]
    pop edi
    pop esi
    pop ebp
    ret
FUN_10018420 ENDP
END
