.686
.MODEL FLAT, C
EXTRN sub_1004F0F5:PROC
.CODE
FUN_1004f600 PROC
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi + 000000184h]
    test eax, eax
    jne L0
    push esi
    call sub_1004F0F5
    add esp, 4
    test al, al
    je L3
L0:
    mov eax, dword ptr [esi + 00000019Ch]
    mov eax, dword ptr [eax + 16]
    mov edx, dword ptr [esi + 000000184h]
    lea ecx, [eax + 0000000D0h]
    cmp edx, ecx
    jne L2
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 98
    mov eax, dword ptr [esi + 00000019Ch]
    mov edx, dword ptr [eax + 16]
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [esi]
    push 3
    push esi
    call dword ptr [eax + 4]
    add esp, 8
    mov dword ptr [esi + 000000184h], 0
L1:
    mov esi, dword ptr [esi + 00000019Ch]
    mov edx, dword ptr [esi + 16]
    inc edx
    and edx, 7
    mov dword ptr [esi + 16], edx
    mov al, 1
    pop esi
    ret
L2:
    mov ecx, dword ptr [esi + 32]
    push eax
    push esi
    call dword ptr [ecx + 0x14]
    add esp, 8
    test al, al
    jne L1
L3:
    xor al, al
    pop esi
    ret
FUN_1004f600 ENDP
END
