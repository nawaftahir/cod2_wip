.686
.MODEL FLAT, C
EXTRN sub_10019691:PROC
EXTRN sub_10019D02:PROC
EXTRN sub_10019F27:PROC
EXTRN sub_1005F3E3:PROC
EXTRN sub_1005FB25:PROC
.CODE
FUN_1001a030 PROC
    push ebx
    push esi
    mov esi, ecx
    mov ebx, eax
    mov eax, dword ptr [esi + 12]
    cmp word ptr [eax], 1
    push edi
    mov edi, edx
    jne L0
    call sub_10019F27
    test al, al
    jne L1
    pop edi
    pop esi
    pop ebx
    ret
L0:
    mov byte ptr [esi + 4], 0
    mov byte ptr [esi + 5], 1
L1:
    push 1
    push 01019563Ch
    mov ecx, edi
    call sub_1005FB25
    add esp, 8
    test eax, eax
    je L3
    mov ecx, dword ptr [esi + 12]
    movzx ecx, word ptr [ecx + 2]
    lea eax, [ecx - 3]
    cmp eax, 11
    ja L2
    movzx edx, byte ptr [eax + 01001A0C8h]
    jmp dword ptr [edx*4 + 0x1001a0bc]
    push ebx
    push esi
    mov eax, edi
    call sub_10019D02
    add esp, 8
    pop edi
    pop esi
    pop ebx
    ret
    push ebx
    mov ebx, edi
    call sub_10019691
    add esp, 4
    pop edi
    pop esi
    pop ebx
    ret
L2:
    push ecx
    push 0101952D4h
    call sub_1005F3E3
    add esp, 8
L3:
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
FUN_1001a030 ENDP
END
