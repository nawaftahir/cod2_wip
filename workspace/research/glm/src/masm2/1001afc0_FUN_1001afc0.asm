.686
.MODEL FLAT, C
EXTRN sub_1001B124:PROC
EXTRN sub_1001B141:PROC
EXTRN sub_1001B1A9:PROC
EXTRN sub_1001B1B5:PROC
EXTRN sub_1005F401:PROC
EXTRN sub_1005F463:PROC
EXTRN sub_1005F6DC:PROC
EXTRN sub_10061D2C:PROC
EXTRN sub_10061D42:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1001afc0 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov edx, dword ptr [esp + 4]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [edx], ecx
    mov mov ecx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], ecx
    mov mov edx, dword ptr [esp + 4]
    push push ebx
    push push ebp
    push push esi
    push push edi
    push push edx
    mov mov eax, 1
    call sub_1005F6DC
    add add esp, 4
    mov mov ebx, eax
    xor xor edi, edi
L0:
    mov mov ebp, 010190100h
    mov mov esi, dword ptr [ebp]
    mov mov eax, ebx
    lea lea ecx, [ecx]
    mov mov dl, byte ptr [eax]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi]
    jne L3
    test test cl, cl
    je L3
    mov mov dl, byte ptr [eax + 1]
    mov mov cl, dl
    cmp cmp dl, byte ptr [esi + 1]
    jne L5
    add add eax, 2
    add add esi, 2
    test test cl, cl
    jne L2
    xor xor eax, eax
    jmp L6
    sbb sbb eax, eax
    sbb sbb eax, -1
    test test eax, eax
    je sub_1001B124
    inc inc edi
    add add ebp, 16
    cmp cmp edi, 21
    jb L4
    push push ebx
    push push 010194FB4h
    call sub_1005F401
    push push ebx
    push push 010194F98h
    call sub_10061D2C
    add add esp, 16
    xor xor esi, esi
    mov mov edx, dword ptr [esi + 010190100h]
    push push edx
    push push 0101932D4h
    call sub_10061D42
    add add esi, 16
    add add esp, 8
    cmp cmp esi, 0150h
    jb sub_1001B141
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    ret ret
    mov mov ecx, dword ptr [esp + 28]
    shl shl edi, 4
    mov mov eax, edi
L2:
    test test dword ptr [eax + 01019010Ch], ecx
    jne sub_1001B1B5
    cmp cmp ecx, 1
    mov mov eax, 010195000h
    je sub_1001B1A9
    mov mov eax, 0101966D4h
    push push eax
    push push ebx
    push push 010194FE8h
    call sub_1005F463
    add add esp, 12
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    ret ret
L6:
    mov mov edx, dword ptr [eax + 010190104h]
    mov mov ecx, dword ptr [esp + 32]
    mov mov dword ptr [ecx], edx
    mov mov eax, dword ptr [eax + 010190108h]
    push push ecx
    mov mov ecx, dword ptr [esp + 28]
    push push eax
    mov mov eax, dword ptr [esp + 28]
    push push ecx
    call L1
    add add esp, 12
    pop pop edi
    pop pop esi
    test test al, al
    pop pop ebp
    setne setne al
    pop pop ebx
    ret ret
FUN_1001afc0 ENDP
END
