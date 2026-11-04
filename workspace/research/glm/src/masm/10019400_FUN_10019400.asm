.686
.MODEL FLAT, C
EXTRN sub_100F6278:PROC
.CODE
FUN_10019400 PROC
    mov eax, dword ptr [esp + 8]
    mov eax, dword ptr [eax + 12]
    push ebx
    push ebp
    push esi
    xor ebp, ebp
    test eax, eax
    push edi
    jbe L5
    mov edi, ecx
L0:
    mov ecx, dword ptr [edi]
    mov edx, dword ptr [esp + 24]
    mov esi, dword ptr [esp + 28]
    add ecx, edx
    nop
L1:
    mov bl, byte ptr [ecx]
    mov dl, bl
    cmp bl, byte ptr [esi]
    jne L3
    test dl, dl
    je L2
    mov bl, byte ptr [ecx + 1]
    mov dl, bl
    cmp bl, byte ptr [esi + 1]
    jne L3
    add ecx, 2
    add esi, 2
    test dl, dl
    jne L1
L2:
    xor ecx, ecx
    jmp L4
L3:
    sbb ecx, ecx
    sbb ecx, -1
L4:
    test ecx, ecx
    je L6
    inc ebp
    add edi, 20
    cmp ebp, eax
    jb L0
L5:
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 28]
    push ecx
    push edx
    push 0101955DCh
    call sub_100F6278
    add esp, 12
    pop edi
    pop esi
    pop ebp
    or eax, 0FFFFFFFFh
    pop ebx
    ret
L6:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
FUN_10019400 ENDP
END
