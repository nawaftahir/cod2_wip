.686
.MODEL FLAT, C
EXTRN sub_1008B151:PROC
EXTRN sub_100BA1C1:PROC
EXTRN sub_100BA1C5:PROC
EXTRN sub_100BA1E6:PROC
EXTRN sub_100BA1F4:PROC
EXTRN sub_100BA1F7:PROC
EXTRN sub_100BA201:PROC
EXTRN sub_100BA208:PROC
EXTRN sub_100BA233:PROC
EXTRN sub_100BA23E:PROC
EXTRN sub_100F75DD:PROC
EXTRN sub_100F8705:PROC
EXTRN sub_100F8753:PROC
.CODE
FUN_100ba115 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    and and dword ptr [edi], 0
    mov mov ebx, ecx
    jmp L2
    movsx movsx eax, al
    jmp L0
    inc inc esi
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8705
    test test eax, eax
    pop pop ecx
    je L1
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F75DD
    pop pop ecx
    movsx movsx ecx, byte ptr [ebp + 16]
    cmp cmp eax, ecx
    jne L4
    xor xor edx, edx
    cmp cmp dword ptr [edi], edx
    je sub_100BA1F7
    mov mov ecx, dword ptr [ebx + 8]
    cmp cmp ecx, edx
    jbe sub_100BA1E6
    mov mov eax, dword ptr [ebx + 20]
    mov mov esi, ecx
    mov mov ecx, dword ptr [eax]
    mov mov edi, dword ptr [ecx + 4]
    cmp cmp edi, dword ptr [ebp + 20]
    jne sub_100BA1C5
    mov mov edx, ecx
    add add eax, 4
    dec dec esi
    jne sub_100BA1C1
    test test edx, edx
    je sub_100BA201
    mov mov eax, dword ptr [edx + 96]
    jmp sub_100BA208
    inc inc esi
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F8753
    test test eax, eax
    pop pop ecx
    jne sub_100BA1F4
    mov mov al, byte ptr [esi]
    test test al, al
    jne L3
    mov mov eax, 080004005h
    pop pop edi
    pop pop esi
    pop pop ebx
    pop pop ebp
    ret ret 16
    xor xor eax, eax
    push push 010119D48h
    push push 0119Dh
    push push eax
    push push ebx
    call sub_1008B151
    add add esp, 16
    jmp sub_100BA233
    mov mov dword ptr [edi], esi
    xor xor eax, eax
    jmp sub_100BA23E
FUN_100ba115 ENDP
END
