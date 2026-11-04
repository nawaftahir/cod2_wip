.686
.MODEL FLAT, C
EXTRN sub_10019691:PROC
EXTRN sub_10019D02:PROC
EXTRN sub_10019F27:PROC
EXTRN sub_1001A0F2:PROC
EXTRN sub_1001A0F3:PROC
EXTRN sub_1005F3E3:PROC
EXTRN sub_1005FB25:PROC
.CODE
FUN_1001a030 PROC
    push push ebx
    push push esi
    mov mov esi, ecx
    mov mov ebx, eax
    mov mov eax, dword ptr [esi + 12]
    cmp cmp word ptr [eax], 1
    push push edi
    mov mov edi, edx
    jne L0
    call sub_10019F27
    test test al, al
    jne L1
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    mov mov byte ptr [esi + 4], 0
    mov mov byte ptr [esi + 5], 1
    push push 1
    push push 01019563Ch
    mov mov ecx, edi
    call sub_1005FB25
    add add esp, 8
    test test eax, eax
    je sub_1001A0F2
    mov mov ecx, dword ptr [esi + 12]
    movzx movzx ecx, word ptr [ecx + 2]
    lea lea eax, [ecx - 3]
    cmp cmp eax, 11
    ja sub_1001A0F3
    movzx movzx edx, byte ptr [eax + 01001A0C8h]
    jmp jmp dword ptr [edx*4 + 01001A0BCh]
    push push ebx
    push push esi
    mov mov eax, edi
    call sub_10019D02
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    push push ebx
    mov mov ebx, edi
    call sub_10019691
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    push push ecx
    push push 0101952D4h
    call sub_1005F3E3
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebx
    ret ret
FUN_1001a030 ENDP
END
