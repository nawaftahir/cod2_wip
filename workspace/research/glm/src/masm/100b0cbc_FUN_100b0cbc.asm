.686
.MODEL FLAT, C
EXTRN sub_1006C463:PROC
EXTRN sub_1006C4B1:PROC
EXTRN sub_1006DBAF:PROC
EXTRN sub_100C52D0:PROC
EXTRN sub_100F787D:PROC
EXTRN sub_100F7888:PROC
EXTRN sub_100F7912:PROC
EXTRN sub_100F791D:PROC
.CODE
FUN_100b0cbc PROC
    mov edi, edi
    push ebx
    push esi
    mov esi, ecx
    push edi
    push dword ptr [esi + 00000022Ch]
    mov dword ptr [esi], 010116AC0h
    call sub_100F787D
    push dword ptr [esi + 000000230h]
    call sub_100F7888
    xor edi, edi
    cmp dword ptr [esi + 0000002B4h], edi
    pop ecx
    pop ecx
    je L2
    cmp dword ptr [esi + 0000002C0h], edi
    jbe L2
L0:
    mov eax, dword ptr [esi + 0000002B4h]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L1
    push 1
    call sub_1006C463
L1:
    inc edi
    cmp edi, dword ptr [esi + 0000002C0h]
    jb L0
L2:
    xor edi, edi
    cmp dword ptr [esi + 0000002B8h], edi
    je L5
    cmp dword ptr [esi + 0000002BCh], edi
    jbe L5
L3:
    mov eax, dword ptr [esi + 0000002B8h]
    mov ecx, dword ptr [eax + edi*4]
    test ecx, ecx
    je L4
    push 1
    call sub_1006DBAF
L4:
    inc edi
    cmp edi, dword ptr [esi + 0000002BCh]
    jb L3
L5:
    push 16
    lea edi, [esi + 0000002C4h]
    pop ebx
L6:
    mov ecx, dword ptr [edi]
    test ecx, ecx
    je L7
    push 1
    call sub_1006C4B1
L7:
    and dword ptr [edi], 0
    add edi, 4
    dec ebx
    jne L6
    push dword ptr [esi + 0000002B4h]
    call sub_100F7912
    push dword ptr [esi + 0000002B8h]
    call sub_100F791D
    pop ecx
    pop ecx
    pop edi
    mov ecx, esi
    pop esi
    pop ebx
    jmp sub_100C52D0
FUN_100b0cbc ENDP
END
