.686
.MODEL FLAT, C
EXTRN sub_10055B0C:PROC
EXTRN sub_10055C92:PROC
EXTRN sub_10056452:PROC
EXTRN sub_100565F6:PROC
EXTRN sub_1005663F:PROC
.CODE
FUN_10056520 PROC
    push push esi
    push push 88
    mov mov esi, eax
    mov mov eax, dword ptr [esi + 4]
    push push 1
    push push esi
    call call dword ptr [eax]
    mov mov dword ptr [esi + 01B0h], eax
    xor xor ecx, ecx
    mov mov dword ptr [eax], 010056400h
    mov mov dword ptr [eax + 8], 0100564F0h
    mov mov dword ptr [eax + 12], 010056500h
    mov mov dword ptr [eax + 68], ecx
    mov mov dword ptr [eax + 52], ecx
    mov mov ecx, dword ptr [esi + 108]
    mov mov eax, 4
    add add esp, 12
    cmp cmp ecx, eax
    jle L0
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 55
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 24], eax
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    mov mov ecx, dword ptr [esi + 92]
    mov mov eax, 0100h
    cmp cmp ecx, eax
    jle sub_100565F6
    mov mov ecx, dword ptr [esi]
    mov mov dword ptr [ecx + 20], 57
    mov mov edx, dword ptr [esi]
    mov mov dword ptr [edx + 24], eax
    mov mov eax, dword ptr [esi]
    push push esi
    call call dword ptr [eax]
    add add esp, 4
    push push esi
    call sub_10055B0C
    push push esi
    call sub_10055C92
    mov mov eax, dword ptr [esi + 84]
    add add esp, 8
    cmp cmp eax, 2
    jne sub_1005663F
    call sub_10056452
L0:
    pop pop esi
    ret ret
FUN_10056520 ENDP
END
