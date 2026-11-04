.686
.MODEL FLAT, C
EXTRN sub_10016966:PROC
EXTRN sub_1001697C:PROC
EXTRN sub_100F790A:PROC
.CODE
FUN_100168e0 PROC
    mov mov cl, byte ptr [edi]
    push push esi
    xor xor esi, esi
    test test cl, cl
    mov mov eax, 119
    je L0
    mov mov edi, edi
    movsx movsx ecx, cl
    imul imul ecx, eax
    add add esi, ecx
    mov mov cl, byte ptr [edi + eax - 118]
    inc inc eax
    test test cl, cl
    jne L1
    and and esi, 03FFh
    mov mov eax, dword ptr [esi*4 + 0101D92D4h]
    test test eax, eax
    je sub_10016966
    mov mov edx, dword ptr [eax]
    push push edi
    push push edx
    call sub_100F790A
    add add esp, 8
    test test eax, eax
    je sub_1001697C
    inc inc esi
    and and esi, 03FFh
    mov mov eax, dword ptr [esi*4 + 0101D92D4h]
    test test eax, eax
    jne sub_10016966
    mov mov dword ptr [ebx], esi
    xor xor al, al
    pop pop esi
    ret ret
    mov mov dword ptr [ebx], esi
    mov mov al, 1
    pop pop esi
    ret ret
FUN_100168e0 ENDP
END
