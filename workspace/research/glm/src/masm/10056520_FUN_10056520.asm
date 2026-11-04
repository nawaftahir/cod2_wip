.686
.MODEL FLAT, C
EXTRN sub_10055B0C:PROC
EXTRN sub_10055C92:PROC
EXTRN sub_10056452:PROC
.CODE
FUN_10056520 PROC
    push esi
    push 88
    mov esi, eax
    mov eax, dword ptr [esi + 4]
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 0000001B0h], eax
    xor ecx, ecx
    mov dword ptr [eax], 010056400h
    mov dword ptr [eax + 8], 0100564F0h
    mov dword ptr [eax + 12], 010056500h
    mov dword ptr [eax + 68], ecx
    mov dword ptr [eax + 52], ecx
    mov ecx, dword ptr [esi + 108]
    mov eax, 4
    add esp, 12
    cmp ecx, eax
    jle L0
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 55
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L0:
    mov ecx, dword ptr [esi + 92]
    mov eax, 000000100h
    cmp ecx, eax
    jle L1
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 57
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 24], eax
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
L1:
    push esi
    call sub_10055B0C
    push esi
    call sub_10055C92
    mov eax, dword ptr [esi + 84]
    add esp, 8
    cmp eax, 2
    jne L2
    call sub_10056452
L2:
    pop esi
    ret
FUN_10056520 ENDP
END
