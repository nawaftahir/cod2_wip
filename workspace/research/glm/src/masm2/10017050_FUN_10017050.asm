.686
.MODEL FLAT, C
EXTRN sub_10017114:PROC
EXTRN sub_10017120:PROC
EXTRN sub_10017125:PROC
EXTRN sub_10017128:PROC
EXTRN sub_1001712E:PROC
EXTRN sub_10017141:PROC
EXTRN sub_10017172:PROC
.CODE
FUN_10017050 PROC
    mov mov cl, byte ptr [ebx]
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    xor xor edx, edx
    test test cl, cl
    push push edi
    mov mov eax, 119
    je L0
    movsx movsx ecx, cl
    imul imul ecx, eax
    add add edx, ecx
    mov mov cl, byte ptr [ebx + eax - 118]
    inc inc eax
    test test cl, cl
    jne L0
    and and edx, 03FFh
    mov mov word ptr [ebp], dx
    movzx movzx edx, dx
    mov mov eax, dword ptr [edx*4 + 0101D4D28h]
L0:
    test test eax, eax
    je sub_10017125
    lea lea ecx, [ecx]
    mov mov di, word ptr [ebp]
    movzx movzx eax, di
    mov mov ecx, dword ptr [eax*4 + 0101D4D28h]
    mov mov eax, dword ptr [ecx]
    mov mov esi, ebx
    mov mov dl, byte ptr [eax]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne sub_10017120
    test test cl, cl
    je sub_10017120
    mov mov dl, byte ptr [eax + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne sub_1001712E
    add add eax, 2
    add add esi, 2
    test test cl, cl
    jne sub_10017114
    xor xor eax, eax
    jmp sub_10017141
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je sub_10017172
    inc inc edi
    and and edi, 03FFh
    movzx movzx eax, di
    mov mov word ptr [ebp], di
    mov mov ecx, dword ptr [eax*4 + 0101D4D28h]
    test test ecx, ecx
    jne sub_10017128
    mov mov edx, dword ptr [esp + 20]
    pop pop edi
    pop pop esi
    mov mov byte ptr [edx], 0
    pop pop ebp
    ret ret
    mov mov ecx, dword ptr [esp + 20]
    pop pop edi
    pop pop esi
    mov mov byte ptr [ecx], 1
    pop pop ebp
    ret ret
FUN_10017050 ENDP
END
