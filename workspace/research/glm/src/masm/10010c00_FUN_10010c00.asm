.686
.MODEL FLAT, C
EXTRN sub_10010C3A:PROC
.CODE
FUN_10010c00 PROC
    mov ecx, dword ptr [esp + 4]
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [eax + 4]
    push edi
    xor edi, edi
    mov di, word ptr [eax]
    mov dx, word ptr [eax + 2]
    xor ebx, ebx
    and edi, 000000FFFh
    mov bp, word ptr [ecx + edi*4 + 2]
    mov cx, bp
    shr word ptr [eax], cl
    mov bh, byte ptr [esi + 3]
    movzx ecx, byte ptr [esi + 1]
    mov bl, byte ptr [esi + 2]
    shl ebx, 8
    or ebx, ecx
    movzx ecx, byte ptr [esi]
    shl ebx, 8
    or ebx, ecx
    mov cl, dl
    shr ebx, cl
    mov ecx, 16
    sub ecx, ebp
    shl ebx, cl
    xor ecx, ecx
    mov cx, word ptr [eax]
    or ebx, ecx
    lea ecx, [edx + ebp]
    movzx edx, cx
    and ecx, 7
    shr edx, 3
    add edx, esi
    mov word ptr [eax + 2], cx
    mov ecx, dword ptr [esp + 20]
    mov word ptr [eax], bx
    mov dword ptr [eax + 4], edx
    movsx ecx, word ptr [ecx + edi*4]
    cmp ecx, 0FFFF8000h
    jne L0
    mov edx, dword ptr [esp + 24]
    mov cl, dl
    mov esi, 1
    shl esi, cl
    movzx ecx, bx
    dec esi
    and esi, ecx
    mov ecx, dword ptr [esp + 28]
    mov edi, edx
    sub esi, ecx
    call sub_10010C3A
    pop edi
    mov eax, esi
    pop esi
    pop ebp
    pop ebx
    ret
L0:
    pop edi
    pop esi
    pop ebp
    mov eax, ecx
    pop ebx
    ret
FUN_10010c00 ENDP
END
