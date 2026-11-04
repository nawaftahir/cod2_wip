.686
.MODEL FLAT, C
EXTRN sub_100F5E2C:PROC
EXTRN sub_100F5E9D:PROC
EXTRN sub_100F7C8D:PROC
EXTRN sub_100F7CA1:PROC
EXTRN sub_100F7CA6:PROC
EXTRN sub_100F7CAF:PROC
EXTRN sub_100F7CB2:PROC
EXTRN sub_100F7CBD:PROC
EXTRN sub_100F7CC2:PROC
EXTRN sub_100F7CC3:PROC
EXTRN sub_100F7CC7:PROC
EXTRN sub_100F7CD9:PROC
EXTRN sub_100F7CDE:PROC
EXTRN sub_100F7CED:PROC
EXTRN sub_100F7CF2:PROC
EXTRN sub_100F7CFB:PROC
EXTRN sub_100F7D1B:PROC
EXTRN sub_100F7D1F:PROC
EXTRN sub_100F7D3D:PROC
EXTRN sub_10100355:PROC
EXTRN sub_101003BA:PROC
.CODE
___lc_strtolc PROC
    push push ebp
    mov mov ebp, esp
    push push esi
    push push edi
    mov mov edi, dword ptr [ebp + 8]
    push push 090h
    push push 0
    push push edi
    call sub_10100355
    mov mov esi, dword ptr [ebp + 12]
    mov mov al, byte ptr [esi]
    add add esp, 12
    test test al, al
    je L0
    cmp cmp al, 46
    jne L1
    lea lea eax, [esi + 1]
    cmp cmp byte ptr [eax], 0
    je L2
    push push 15
    push push eax
    lea lea eax, [edi + 080h]
    push push eax
    call sub_100F5E2C
    add add esp, 12
    mov mov byte ptr [edi + 08Fh], 0
    xor xor eax, eax
    jmp sub_100F7CAF
    and and dword ptr [ebp + 12], 0
    push push ebx
    jmp sub_100F7CA1
    cmp cmp dword ptr [ebp + 12], 0
    lea lea edi, [eax + esi]
    mov mov bl, byte ptr [edi]
    jne L3
    cmp cmp eax, 64
    jae sub_100F7CC2
    cmp cmp bl, 46
L0:
    je sub_100F7CC7
    push push eax
    push push esi
    push push dword ptr [ebp + 8]
    jmp sub_100F7CA6
    cmp cmp dword ptr [ebp + 12], 1
    jne sub_100F7C8D
    cmp cmp eax, 64
    jae sub_100F7CD9
    cmp cmp bl, 95
    je sub_100F7CDE
    push push eax
    mov mov eax, dword ptr [ebp + 8]
    add add eax, 64
    jmp sub_100F7CBD
    cmp cmp dword ptr [ebp + 12], 2
    jne sub_100F7CED
    cmp cmp eax, 16
    jae sub_100F7CF2
    test test bl, bl
    je sub_100F7CC3
    cmp cmp bl, 44
    jne sub_100F7CFB
    push push eax
    mov mov eax, dword ptr [ebp + 8]
    add add eax, 080h
    push push esi
    push push eax
    call sub_100F5E9D
    add add esp, 12
    cmp cmp bl, 44
    je sub_100F7D1B
    test test bl, bl
    je sub_100F7D1F
    inc inc dword ptr [ebp + 12]
    lea lea esi, [edi + 1]
    push push 01017C678h
    push push esi
    call sub_101003BA
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100F7CB2
    or or eax, -1
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
    xor xor eax, eax
    jmp sub_100F7D3D
___lc_strtolc ENDP
END
