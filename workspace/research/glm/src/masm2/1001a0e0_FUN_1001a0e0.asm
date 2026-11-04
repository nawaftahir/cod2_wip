.686
.MODEL FLAT, C
EXTRN sub_10019756:PROC
EXTRN sub_10019F11:PROC
EXTRN sub_1001A170:PROC
.CODE
FUN_1001a0e0 PROC
    push push ebx
    push push esi
    push push edi
    mov mov edi, ecx
    mov mov esi, eax
    mov mov eax, dword ptr [edi + 12]
    mov mov byte ptr [edi + 4], 0
    cmp cmp word ptr [eax], 1
    mov mov ebx, edx
    jne L0
    mov mov cl, byte ptr [eax + 8]
    mov mov byte ptr [edi + 5], cl
    jmp L1
    mov mov byte ptr [edi + 5], 1
    movzx movzx eax, word ptr [eax + 2]
    add add eax, -3
    cmp cmp eax, 11
    ja sub_1001A170
    movzx movzx edx, byte ptr [eax + 01001A154h]
    jmp jmp dword ptr [edx*4 + 01001A148h]
    call sub_10019F11
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    push push esi
    push push ebx
    mov mov edx, 01018EDA0h
    mov mov word ptr [esi], 3
    call sub_10019756
    add add esp, 8
    pop pop edi
    test test al, al
    pop pop esi
    setne setne al
    pop pop ebx
    ret ret
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebx
    ret ret
FUN_1001a0e0 ENDP
END
