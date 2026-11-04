.686
.MODEL FLAT, C
EXTRN sub_1001A032:PROC
EXTRN sub_1001A056:PROC
EXTRN sub_1001A092:PROC
EXTRN sub_1001A0B4:PROC
EXTRN sub_1001A0BF:PROC
EXTRN sub_1005F405:PROC
EXTRN sub_1005F441:PROC
EXTRN sub_1005F45C:PROC
EXTRN sub_1005F476:PROC
EXTRN sub_1005F6D2:PROC
EXTRN sub_1005FAD6:PROC
EXTRN sub_1005FBCD:PROC
EXTRN sub_1005FF98:PROC
EXTRN sub_1005FFE3:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10019f10 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    push push ebx
    xor xor bl, bl
    cmp cmp cl, bl
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], bl
    mov mov dword ptr [edi], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push edi
    mov mov eax, 1
    call sub_1005F6D2
    mov mov cl, byte ptr [eax]
    add add esp, 4
    cmp cmp cl, 91
    je L1
    call sub_1005F441
    mov mov eax, dword ptr [esi + 12]
L0:
    mov mov byte ptr [esi + 4], bl
    mov mov cl, byte ptr [eax + 8]
    mov mov byte ptr [esi + 5], cl
    mov mov al, 1
    pop pop ebx
    ret ret
    mov mov ecx, edi
    call sub_1005FF98
    mov mov edx, dword ptr [esi + 12]
    mov mov byte ptr [esi + 4], al
    mov mov cx, word ptr [edx + 8]
    movzx movzx dx, al
    cmp cmp dx, cx
    jae sub_1001A092
    mov mov ecx, edi
    call sub_1005FAD6
    mov mov cl, byte ptr [eax]
    cmp cmp cl, 93
    jne sub_1001A032
    mov mov byte ptr [esi + 5], 1
    mov mov al, 1
    pop pop ebx
    ret ret
    cmp cmp cl, 44
    je sub_1001A056
    push push eax
    push push 010195324h
    call sub_1005F405
    add add esp, 8
    xor xor al, al
    pop pop ebx
    ret ret
    mov mov ecx, edi
    call sub_1005FFE3
    mov mov cl, byte ptr [esi + 4]
    movzx movzx edx, cl
    cmp cmp eax, edx
    jl sub_1001A0B4
    mov mov ebx, dword ptr [esi + 12]
    movzx movzx ebx, word ptr [ebx + 8]
    cmp cmp eax, ebx
    jge sub_1001A0BF
    sub sub al, cl
    inc inc al
    push push 1
    push push 0101958A8h
    mov mov ecx, edi
    mov mov byte ptr [esi + 5], al
    call sub_1005FBCD
    add add esp, 8
    test test eax, eax
    setne setne al
    pop pop ebx
    ret ret
    mov mov ecx, dword ptr [esi + 12]
    movzx movzx ecx, word ptr [ecx + 8]
    dec dec ecx
    push push ecx
    push push edx
    push push eax
    push push 0101952F0h
    call sub_1005F45C
    add add esp, 16
    xor xor al, al
    pop pop ebx
    ret ret
    movzx movzx edx, cx
    dec dec edx
    movzx movzx eax, al
    push push edx
    push push eax
    push push 010195350h
    call sub_1005F476
    add add esp, 12
    xor xor al, al
    pop pop ebx
    ret ret
FUN_10019f10 ENDP
END
