.686
.MODEL FLAT, C
EXTRN sub_100A7F28:PROC
EXTRN sub_100A7F2B:PROC
EXTRN sub_100A7F2D:PROC
EXTRN sub_100A7F30:PROC
EXTRN sub_100A7F33:PROC
EXTRN sub_100A7F60:PROC
EXTRN sub_100A7F72:PROC
.CODE
FUN_100a7ec8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ecx
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp + 16], 0
    push push ebx
    push push esi
    push push edi
    jbe sub_100A7F28
    mov mov edi, dword ptr [ebp + 8]
    sub sub edi, dword ptr [ebp + 12]
    mov mov ecx, 0101A4020h
    mov mov eax, dword ptr [ebp + 12]
    xor xor esi, esi
    push push 4
    inc inc esi
    pop pop edx
    mov mov ebx, dword ptr [edi + eax]
    cmp cmp ebx, dword ptr [ecx]
    je sub_100A7F2B
    cmp cmp dword ptr [eax], -1
    je sub_100A7F30
    xor xor esi, esi
    add add ecx, 4
    add add eax, 4
    dec dec edx
    jne sub_100A7F2D
    test test esi, esi
    jne sub_100A7F60
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp + 16]
    jb sub_100A7F33
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 12
    xor xor eax, eax
    inc inc eax
    jmp sub_100A7F72
FUN_100a7ec8 ENDP
END
