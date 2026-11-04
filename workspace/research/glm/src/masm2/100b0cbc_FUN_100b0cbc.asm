.686
.MODEL FLAT, C
EXTRN sub_1006C463:PROC
EXTRN sub_1006C4B1:PROC
EXTRN sub_1006DBAF:PROC
EXTRN sub_100B0D9D:PROC
EXTRN sub_100B0DA5:PROC
EXTRN sub_100B0DA9:PROC
EXTRN sub_100B0DE7:PROC
EXTRN sub_100B0DEA:PROC
EXTRN sub_100C52D0:PROC
EXTRN sub_100F787D:PROC
EXTRN sub_100F7888:PROC
EXTRN sub_100F7912:PROC
EXTRN sub_100F791D:PROC
.CODE
FUN_100b0cbc PROC
    mov mov edi, edi
    push push ebx
    push push esi
    mov mov esi, ecx
    push push edi
    push push dword ptr [esi + 022Ch]
    mov mov dword ptr [esi], 010116AC0h
    call sub_100F787D
    push push dword ptr [esi + 0230h]
    call sub_100F7888
    xor xor edi, edi
    cmp cmp dword ptr [esi + 02B4h], edi
    pop pop ecx
    pop pop ecx
    je L0
    cmp cmp dword ptr [esi + 02C0h], edi
    jbe L1
    mov mov eax, dword ptr [esi + 02B4h]
    mov mov ecx, dword ptr [eax + edi*4]
    test test ecx, ecx
    je L2
    push push 1
    call sub_1006C463
    inc inc edi
    cmp cmp edi, dword ptr [esi + 02C0h]
    jb L1
    xor xor edi, edi
    cmp cmp dword ptr [esi + 02B8h], edi
    je sub_100B0D9D
    cmp cmp dword ptr [esi + 02BCh], edi
    jbe sub_100B0DA5
    mov mov eax, dword ptr [esi + 02B8h]
    mov mov ecx, dword ptr [eax + edi*4]
    test test ecx, ecx
    je sub_100B0DA9
    push push 1
    call sub_1006DBAF
    inc inc edi
    cmp cmp edi, dword ptr [esi + 02BCh]
    jb sub_100B0DA5
L0:
    push push 16
    lea lea edi, [esi + 02C4h]
L1:
    pop pop ebx
    mov mov ecx, dword ptr [edi]
    test test ecx, ecx
    je sub_100B0DE7
    push push 1
    call sub_1006C4B1
    and and dword ptr [edi], 0
    add add edi, 4
    dec dec ebx
    jne sub_100B0DEA
    push push dword ptr [esi + 02B4h]
    call sub_100F7912
    push push dword ptr [esi + 02B8h]
    call sub_100F791D
    pop pop ecx
    pop pop ecx
    pop pop edi
    mov mov ecx, esi
    pop pop esi
    pop pop ebx
    jmp sub_100C52D0
FUN_100b0cbc ENDP
END
