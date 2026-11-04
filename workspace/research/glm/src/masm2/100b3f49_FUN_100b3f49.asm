.686
.MODEL FLAT, C
EXTRN sub_100B3FA0:PROC
EXTRN sub_100B3FA3:PROC
EXTRN sub_100B3FA8:PROC
EXTRN sub_100B3FD5:PROC
EXTRN sub_100B3FE9:PROC
.CODE
FUN_100b3f49 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    mov mov edx, dword ptr [ebp + 8]
    sub sub edx, dword ptr [ebp + 12]
    and and dword ptr [ebp + 8], 0
    push push ebx
    push push esi
    mov mov ecx, 0101A4218h
    push push edi
    mov mov eax, dword ptr [ebp + 12]
    xor xor edi, edi
    push push 4
    inc inc edi
    pop pop esi
    mov mov ebx, dword ptr [edx + eax]
    cmp cmp ebx, dword ptr [ecx]
    je L0
    cmp cmp dword ptr [eax], -1
    je sub_100B3FA3
    xor xor edi, edi
    add add ecx, 4
    add add eax, 4
    dec dec esi
    jne sub_100B3FA0
    test test edi, edi
    jne sub_100B3FD5
    add add dword ptr [ebp + 8], 16
    cmp cmp dword ptr [ebp + 8], 080h
    jb sub_100B3FA8
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 8
    xor xor eax, eax
    inc inc eax
    jmp sub_100B3FE9
FUN_100b3f49 ENDP
END
