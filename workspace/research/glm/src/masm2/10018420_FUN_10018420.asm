.686
.MODEL FLAT, C
EXTRN sub_100184E4:PROC
EXTRN sub_100184F0:PROC
EXTRN sub_100184F8:PROC
EXTRN sub_100184FE:PROC
EXTRN sub_10018511:PROC
EXTRN sub_1001853B:PROC
EXTRN sub_1005F3F3:PROC
EXTRN sub_1005F6D3:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_10018420 PROC
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    add add eax, 0101A66B0h
    mov mov dl, byte ptr [eax + 0404h]
    test test dl, dl
    je L0
    mov mov edx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebp
    push push esi
    push push edi
    push push ecx
    mov mov eax, 1
    call sub_1005F6D3
    mov mov esi, dword ptr [ebx]
    add add esp, 4
    xor xor edi, edi
    test test esi, esi
    mov mov ebp, eax
    je sub_100184F8
    mov mov ecx, ebp
    mov mov al, byte ptr [ecx]
    mov mov dl, al
    cmp cmp al, byte ptr [esi]
    jne sub_100184F0
    test test dl, dl
    je sub_100184F0
    mov mov al, byte ptr [ecx + 1]
    mov mov dl, al
    cmp cmp al, byte ptr [esi + 1]
    jne sub_100184FE
    add add ecx, 2
    add add esi, 2
    test test dl, dl
    jne sub_100184E4
    xor xor ecx, ecx
    jmp sub_10018511
    sbb sbb ecx, ecx
    sbb sbb ecx, -1
    test test ecx, ecx
    je sub_1001853B
    mov mov esi, dword ptr [ebx + edi*8 + 8]
    inc inc edi
    test test esi, esi
    jne sub_100184F8
    push push ebp
    push push 010195888h
    call sub_1005F3F3
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebp
    ret ret
    lea lea eax, [ebx + edi*8]
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_10018420 ENDP
END
