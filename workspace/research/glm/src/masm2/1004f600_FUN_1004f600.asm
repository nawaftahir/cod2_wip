.686
.MODEL FLAT, C
EXTRN sub_1004F0F5:PROC
EXTRN sub_1004F6A0:PROC
EXTRN sub_1004F6AA:PROC
EXTRN sub_1004F6E5:PROC
.CODE
FUN_1004f600 PROC
    push push esi
    mov mov esi, dword ptr [esp + 8]
    mov mov eax, dword ptr [esi + 0184h]
    test test eax, eax
    jne L0
    push push esi
    call sub_1004F0F5
    add add esp, 4
    test test al, al
    je sub_1004F6A0
    mov mov eax, dword ptr [esi + 019Ch]
    mov mov eax, dword ptr [eax + 16]
    mov mov edx, dword ptr [esi + 0184h]
L0:
    lea lea ecx, [eax + 0D0h]
    cmp cmp edx, ecx
    jne sub_1004F6AA
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 20], 98
    mov mov eax, dword ptr [esi + 019Ch]
    mov mov edx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 24], edx
    mov mov eax, dword ptr [esi]
    push push 3
    push push esi
    call call dword ptr [eax + 4]
    add add esp, 8
    mov mov dword ptr [esi + 0184h], 0
    mov mov esi, dword ptr [esi + 019Ch]
    mov mov edx, dword ptr [esi + 16]
    inc inc edx
    and and edx, 7
    mov mov dword ptr [esi + 16], edx
    mov mov al, 1
    pop pop esi
    ret ret
    mov mov ecx, dword ptr [esi + 32]
    push push eax
    push push esi
    call call dword ptr [ecx + 20]
    add add esp, 8
    test test al, al
    jne sub_1004F6E5
    xor xor al, al
    pop pop esi
    ret ret
FUN_1004f600 ENDP
END
