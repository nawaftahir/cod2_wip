.686
.MODEL FLAT, C
EXTRN sub_1006A15A:PROC
EXTRN sub_1006A167:PROC
EXTRN sub_1006A169:PROC
EXTRN sub_1006A173:PROC
EXTRN sub_1006A17B:PROC
EXTRN sub_1006A181:PROC
EXTRN sub_1006A183:PROC
EXTRN sub_1006A192:PROC
EXTRN sub_1006A1AF:PROC
EXTRN sub_1006A1BA:PROC
EXTRN sub_1006A1CB:PROC
EXTRN sub_1006A1D9:PROC
EXTRN sub_1006A1EA:PROC
EXTRN sub_1006A1EF:PROC
EXTRN sub_1006A1FB:PROC
.CODE
FUN_1006a087 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov eax, dword ptr [ebp + 8]
    mov mov ecx, dword ptr [eax]
    mov mov edx, dword ptr [ecx]
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax]
    push push ebx
    push push esi
    mov mov ecx, 01010F000h
    mov mov esi, ecx
    mov mov si, word ptr [esi]
    cmp cmp si, word ptr [edx]
    push push edi
    je L0
    mov mov ebx, 01010EFFCh
    mov mov esi, ebx
    mov mov si, word ptr [esi]
    cmp cmp si, word ptr [edx]
    je sub_1006A15A
    mov mov esi, 01010EFF8h
    mov mov edi, esi
    mov mov di, word ptr [edi]
    cmp cmp di, word ptr [edx]
    je sub_1006A169
    mov mov edi, dword ptr [eax]
    mov mov cx, word ptr [ecx]
    cmp cmp cx, word ptr [edi]
    je sub_1006A173
    mov mov cx, word ptr [ebx]
    cmp cmp cx, word ptr [edi]
    je sub_1006A17B
    mov mov cx, word ptr [esi]
    cmp cmp cx, word ptr [edi]
    je sub_1006A183
    lea lea esi, [edi + 2]
    lea lea eax, [edx + 2]
    mov mov bl, byte ptr [eax]
    mov mov cl, bl
    cmp cmp bl, byte ptr [esi]
    jne sub_1006A173
    test test cl, cl
    je sub_1006A173
    mov mov bl, byte ptr [eax + 1]
    mov mov cl, bl
    cmp cmp bl, byte ptr [esi + 1]
    jne sub_1006A181
    inc inc eax
    inc inc eax
    inc inc esi
    inc inc esi
    test test cl, cl
    jne sub_1006A167
    xor xor eax, eax
    jmp sub_1006A192
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    jne sub_1006A1AF
    push push 2
    pop pop ecx
    mov mov esi, edx
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je sub_1006A1BA
    sbb sbb eax, eax
    sbb sbb eax, -1
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret
    mov mov eax, dword ptr [eax]
    mov mov esi, edx
    mov mov dl, byte ptr [esi]
    mov mov cl, dl
    cmp cmp dl, byte ptr [eax]
    jne sub_1006A1CB
    test test cl, cl
    je sub_1006A1FB
    mov mov dl, byte ptr [esi + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [eax + 1]
    jne sub_1006A1D9
    inc inc esi
    inc inc esi
    inc inc eax
    inc inc eax
    test test cl, cl
    jne sub_1006A1EF
    xor xor eax, eax
    jmp sub_1006A1EA
FUN_1006a087 ENDP
END
