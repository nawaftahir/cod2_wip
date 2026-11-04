.686
.MODEL FLAT, C
EXTRN sub_1005F405:PROC
EXTRN sub_1005F441:PROC
EXTRN sub_1005F45C:PROC
EXTRN sub_1005F476:PROC
EXTRN sub_1005F6D2:PROC
EXTRN sub_1005FAD6:PROC
EXTRN sub_1005FBCD:PROC
EXTRN sub_1005FF98:PROC
EXTRN sub_1005FFE3:PROC
EXTRN g_101AAC70:DWORD
.CODE
FUN_10019f10 PROC
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    push ebx
    xor bl, bl
    cmp cl, bl
    je L0
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], bl
    mov dword ptr [edi], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push edi
    mov eax, 1
    call sub_1005F6D2
    mov cl, byte ptr [eax]
    add esp, 4
    cmp cl, 91
    je L1
    call sub_1005F441
    mov eax, dword ptr [esi + 12]
    mov byte ptr [esi + 4], bl
    mov cl, byte ptr [eax + 8]
    mov byte ptr [esi + 5], cl
    mov al, 1
    pop ebx
    ret
L1:
    mov ecx, edi
    call sub_1005FF98
    mov edx, dword ptr [esi + 12]
    mov byte ptr [esi + 4], al
    mov cx, word ptr [edx + 8]
    movzx dx, al
    cmp dx, cx
    jae L5
    mov ecx, edi
    call sub_1005FAD6
    mov cl, byte ptr [eax]
    cmp cl, 93
    jne L2
    mov byte ptr [esi + 5], 1
    mov al, 1
    pop ebx
    ret
L2:
    cmp cl, 44
    je L3
    push eax
    push 010195324h
    call sub_1005F405
    add esp, 8
    xor al, al
    pop ebx
    ret
L3:
    mov ecx, edi
    call sub_1005FFE3
    mov cl, byte ptr [esi + 4]
    movzx edx, cl
    cmp eax, edx
    jl L4
    mov ebx, dword ptr [esi + 12]
    movzx ebx, word ptr [ebx + 8]
    cmp eax, ebx
    jge L4
    sub al, cl
    inc al
    push 1
    push 0101958A8h
    mov ecx, edi
    mov byte ptr [esi + 5], al
    call sub_1005FBCD
    add esp, 8
    test eax, eax
    setne al
    pop ebx
    ret
L4:
    mov ecx, dword ptr [esi + 12]
    movzx ecx, word ptr [ecx + 8]
    dec ecx
    push ecx
    push edx
    push eax
    push 0101952F0h
    call sub_1005F45C
    add esp, 16
    xor al, al
    pop ebx
    ret
L5:
    movzx edx, cx
    dec edx
    movzx eax, al
    push edx
    push eax
    push 010195350h
    call sub_1005F476
    add esp, 12
    xor al, al
    pop ebx
    ret
FUN_10019f10 ENDP
END
