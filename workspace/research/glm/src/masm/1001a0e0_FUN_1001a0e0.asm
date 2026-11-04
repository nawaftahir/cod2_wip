.686
.MODEL FLAT, C
EXTRN sub_10019756:PROC
EXTRN sub_10019F11:PROC
.CODE
FUN_1001a0e0 PROC
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov esi, eax
    mov eax, dword ptr [edi + 12]
    mov byte ptr [edi + 4], 0
    cmp word ptr [eax], 1
    mov ebx, edx
    jne L0
    mov cl, byte ptr [eax + 8]
    mov byte ptr [edi + 5], cl
    jmp L1
L0:
    mov byte ptr [edi + 5], 1
L1:
    movzx eax, word ptr [eax + 2]
    add eax, -3
    cmp eax, 11
    ja L2
    movzx edx, byte ptr [eax + 01001A154h]
    jmp dword ptr [edx*4 + 0x1001a148]
    call sub_10019F11
    pop edi
    pop esi
    pop ebx
    ret
    push esi
    push ebx
    mov edx, 01018EDA0h
    mov word ptr [esi], 3
    call sub_10019756
    add esp, 8
    pop edi
    test al, al
    pop esi
    setne al
    pop ebx
    ret
L2:
    pop edi
    pop esi
    xor al, al
    pop ebx
    ret
FUN_1001a0e0 ENDP
END
