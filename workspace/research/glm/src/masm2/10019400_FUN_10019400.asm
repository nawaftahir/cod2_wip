.686
.MODEL FLAT, C
EXTRN sub_1001948D:PROC
EXTRN sub_100194C1:PROC
EXTRN sub_100F6278:PROC
.CODE
FUN_10019400 PROC
    mov mov eax, dword ptr [esp + 8]
    mov mov eax, dword ptr [eax + 12]
    push push ebx
    push push ebp
    push push esi
    xor xor ebp, ebp
    test test eax, eax
    push push edi
    jbe L1
    mov mov edi, ecx
    mov mov ecx, dword ptr [edi]
    mov mov edx, dword ptr [esp + 24]
    mov mov esi, dword ptr [esp + 28]
    add add ecx, edx
    nop nop
    mov mov bl, byte ptr [ecx]
    mov mov dl, bl
    cmp cmp bl, byte ptr [esi]
    jne L3
    test test dl, dl
    je L3
    mov mov bl, byte ptr [ecx + 1]
    mov mov dl, bl
    cmp cmp bl, byte ptr [esi + 1]
    jne L4
    add add ecx, 2
    add add esi, 2
    test test dl, dl
    jne L0
    xor xor ecx, ecx
    jmp sub_1001948D
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    je sub_100194C1
    inc inc ebp
    add add edi, 20
    cmp cmp ebp, eax
    jb L2
    mov mov ecx, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 28]
    push push ecx
    push push edx
    push push 0101955DCh
    call sub_100F6278
    add add esp, 12
L3:
    pop pop edi
    pop pop esi
    pop pop ebp
    or or eax, -1
    pop pop ebx
    ret ret
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
L4:
    ret ret
FUN_10019400 ENDP
END
