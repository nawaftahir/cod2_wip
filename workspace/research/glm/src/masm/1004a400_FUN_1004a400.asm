.686
.MODEL FLAT, C
EXTRN sub_1004A5C8:PROC
EXTRN sub_1004A5EF:PROC
EXTRN sub_1004FCC7:PROC
.CODE
FUN_1004a400 PROC
    push esi
    mov esi, eax
    cmp dword ptr [esi + 20], 0000000CAh
    jne L1
    mov eax, dword ptr [esi + 4]
    push 28
    push 1
    push esi
    call dword ptr [eax]
    mov dword ptr [esi + 000000188h], eax
    mov dword ptr [eax], 01004FE50h
    mov dword ptr [eax + 4], 01004FFB0h
    mov byte ptr [eax + 8], 0
    add esp, 12
    mov eax, esi
    call sub_1004FCC7
    mov al, byte ptr [esi + 72]
    test al, al
    je L0
    mov dword ptr [esi + 20], 0000000CFh
    mov al, 1
    pop esi
    ret
L0:
    mov dword ptr [esi + 20], 0000000CBh
L1:
    mov eax, dword ptr [esi + 20]
    cmp eax, 0000000CBh
    jne L7
    mov ecx, dword ptr [esi + 000000198h]
    mov al, byte ptr [ecx + 16]
    test al, al
    je L6
L2:
    mov eax, dword ptr [esi + 8]
    test eax, eax
    je L3
    push esi
    call dword ptr [eax]
    add esp, 4
L3:
    mov edx, dword ptr [esi + 000000198h]
    push esi
    call dword ptr [edx]
    add esp, 4
    test eax, eax
    je L5
    cmp eax, 2
    je L6
    mov ecx, dword ptr [esi + 8]
    test ecx, ecx
    je L2
    cmp eax, 3
    je L4
    cmp eax, 1
    jne L2
L4:
    inc dword ptr [ecx + 4]
    mov eax, dword ptr [esi + 8]
    mov ecx, dword ptr [eax + 4]
    cmp ecx, dword ptr [eax + 8]
    jl L2
    mov edx, dword ptr [esi + 000000124h]
    add dword ptr [eax + 8], edx
    jmp L2
L5:
    xor al, al
    pop esi
    ret
L6:
    mov eax, dword ptr [esi + 000000084h]
    mov dword ptr [esi + 00000008Ch], eax
    call sub_1004A5C8
    pop esi
    ret
L7:
    cmp eax, 0000000CCh
    je L8
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 20
    mov edx, dword ptr [esi]
    mov eax, dword ptr [esi + 20]
    mov dword ptr [edx + 24], eax
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L8:
    call sub_1004A5EF
    pop esi
    ret
FUN_1004a400 ENDP
END
