.686
.MODEL FLAT, C
EXTRN sub_1005F37D:PROC
EXTRN sub_1005F400:PROC
EXTRN sub_1005F6D8:PROC
EXTRN sub_1005FBB6:PROC
EXTRN sub_1005FBC4:PROC
EXTRN sub_1005FBD4:PROC
EXTRN sub_1005FBE7:PROC
EXTRN sub_1005FC00:PROC
EXTRN sub_1005FC33:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1005faf0 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov dl, byte ptr [eax + 0404h]
    test test dl, dl
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push edi
    je L0
    mov mov edx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    push push esi
    push push ecx
    mov mov eax, 1
    call sub_1005F6D8
    mov mov edi, eax
    add add esp, 4
    mov mov esi, ebp
    mov mov ecx, edi
    mov mov al, byte ptr [ecx]
    mov mov bl, byte ptr [esi]
    mov mov dl, al
    cmp cmp al, bl
    jne sub_1005FBC4
L0:
    test test dl, dl
    je sub_1005FBC4
    mov mov al, byte ptr [ecx + 1]
    mov mov bl, byte ptr [esi + 1]
    mov mov dl, al
    cmp cmp al, bl
    jne sub_1005FBD4
    add add ecx, 2
    add add esi, 2
    test test dl, dl
    jne sub_1005FBB6
    xor xor ecx, ecx
    jmp sub_1005FBE7
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    pop pop esi
    pop pop ebx
    jne sub_1005FC00
    pop pop edi
    mov mov eax, 1
    pop pop ebp
    ret ret
    mov mov eax, dword ptr [esp + 16]
    test test eax, eax
    push push ebp
    push push edi
    push push 01019B8F4h
    je sub_1005FC33
    call sub_1005F400
    add add esp, 12
    pop pop edi
    xor xor eax, eax
    pop pop ebp
    ret ret
    call sub_1005F37D
    add add esp, 12
    pop pop edi
    xor xor eax, eax
    pop pop ebp
    ret ret
FUN_1005faf0 ENDP
END
