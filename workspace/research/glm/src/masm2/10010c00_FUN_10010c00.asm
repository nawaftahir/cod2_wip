.686
.MODEL FLAT, C
EXTRN sub_10010D1B:PROC
.CODE
FUN_10010c00 PROC
    mov mov ecx, dword ptr [esp + 4]
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [eax + 4]
    push push edi
    xor xor edi, edi
    mov mov di, word ptr [eax]
    mov mov dx, word ptr [eax + 2]
    xor xor ebx, ebx
    and and edi, 0FFFh
    mov mov bp, word ptr [ecx + edi*4 + 2]
    mov mov cx, bp
    shr shr word ptr [eax], cl
    mov mov bh, byte ptr [esi + 3]
    movzx movzx ecx, byte ptr [esi + 1]
    mov mov bl, byte ptr [esi + 2]
    shl shl ebx, 8
    or or ebx, ecx
    movzx movzx ecx, byte ptr [esi]
    shl shl ebx, 8
    or or ebx, ecx
    mov mov cl, dl
    shr shr ebx, cl
    mov mov ecx, 16
    sub sub ecx, ebp
    shl shl ebx, cl
    xor xor ecx, ecx
    mov mov cx, word ptr [eax]
    or or ebx, ecx
    lea lea ecx, [edx + ebp]
    movzx movzx edx, cx
    and and ecx, 7
    shr shr edx, 3
    add add edx, esi
    mov mov word ptr [eax + 2], cx
    mov mov ecx, dword ptr [esp + 20]
    mov mov word ptr [eax], bx
    mov mov dword ptr [eax + 4], edx
    movsx movsx ecx, word ptr [ecx + edi*4]
    cmp cmp ecx, 0FFFF8000h
    jne sub_10010D1B
    mov mov edx, dword ptr [esp + 24]
    mov mov cl, dl
    mov mov esi, 1
    shl shl esi, cl
    movzx movzx ecx, bx
    dec dec esi
    and and esi, ecx
    mov mov ecx, dword ptr [esp + 28]
    mov mov edi, edx
    sub sub esi, ecx
    call L0
    pop pop edi
    mov mov eax, esi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov eax, ecx
    pop pop ebx
    ret ret
FUN_10010c00 ENDP
END
