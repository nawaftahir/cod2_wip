.686
.MODEL FLAT, C
EXTRN sub_1001B2ED:PROC
EXTRN sub_1001B30F:PROC
EXTRN sub_1001B326:PROC
EXTRN sub_1001B33F:PROC
EXTRN sub_1001B365:PROC
EXTRN sub_1001B38F:PROC
EXTRN sub_1001B3A4:PROC
EXTRN sub_1005F3FE:PROC
EXTRN sub_1005F458:PROC
EXTRN sub_1005F4C3:PROC
EXTRN sub_1005F6DE:PROC
EXTRN sub_1005FB30:PROC
EXTRN sub_1005FB6C:PROC
EXTRN sub_1005FBA5:PROC
EXTRN sub_1005FBBE:PROC
EXTRN sub_1005FC12:PROC
EXTRN sub_1005FC27:PROC
EXTRN sub_1005FC3C:PROC
EXTRN sub_1005FFBE:PROC
EXTRN EXTRN g_101AAC70:DWORD:DWORD
.CODE
FUN_1001b100 PROC
    mov mov eax, dword ptr [esp + 8]
    mov mov byte ptr [eax], 0
    mov mov eax, dword ptr [g_101AAC70]
    imul imul eax, eax, 045Ch
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    add add eax, 0101A66B0h
    mov mov cl, byte ptr [eax + 0404h]
    test test cl, cl
    push push esi
    push push edi
    je L0
    mov mov ecx, dword ptr [eax + 0418h]
    mov mov byte ptr [eax + 0404h], 0
    mov mov dword ptr [ebx], ecx
    mov mov edx, dword ptr [eax + 0414h]
    mov mov dword ptr [eax + 0400h], edx
    push push ebx
    mov mov eax, 1
    call sub_1005F6DE
    add add esp, 4
    mov mov esi, eax
    mov mov edi, 0101956A0h
    mov mov ecx, 9
    xor xor eax, eax
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L1
    call sub_1005F458
    pop pop edi
    pop pop esi
    mov mov al, 1
    pop pop ebp
    ret ret
    push push 1
    push push 0101958CCh
    mov mov ecx, ebx
    call sub_1005FB6C
    add add esp, 8
    test test eax, eax
    je sub_1001B2ED
    mov mov ecx, ebx
    call sub_1005FFBE
    cmp cmp eax, ebp
    je L2
    push push eax
    push push ebp
    push push 0101958ACh
    call sub_1005F3FE
    add add esp, 12
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
    push push 1
    push push 0101958A8h
    mov mov ecx, ebx
    call sub_1005FBA5
    add add esp, 8
    test test eax, eax
    je sub_1001B326
    push push 1
    push push 01019563Ch
    mov mov ecx, ebx
    call sub_1005FBBE
    add add esp, 8
L1:
    test test eax, eax
    je sub_1001B33F
    mov mov ecx, ebx
    call sub_1005FB30
    mov mov edi, 010194F88h
    mov mov esi, eax
    mov mov ecx, 16
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001B2ED
    mov mov eax, dword ptr [esp + 20]
    mov mov byte ptr [eax], 1
    jmp sub_1001B30F
    mov mov edi, 010194F7Ch
    mov mov esi, eax
    mov mov ecx, 10
    xor xor edx, edx
    repe cmpsb repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne sub_1001B365
    mov mov eax, dword ptr [esp + 20]
    mov mov byte ptr [eax], 2
    push push 1
    push push 010195544h
    mov mov ecx, ebx
    call sub_1005FC12
    add add esp, 8
    test test eax, eax
    je sub_1001B38F
    push push 1
    push push 010195540h
    mov mov ecx, ebx
    call sub_1005FC27
    add add esp, 8
    test test eax, eax
    je sub_1001B3A4
    push push 1
    push push 010195820h
    mov mov ecx, ebx
    call sub_1005FC3C
    add add esp, 8
    pop pop edi
    test test eax, eax
    pop pop esi
    setne setne al
    pop pop ebp
    ret ret
    push push eax
    push push 010194F20h
    call sub_1005F4C3
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor al, al
    pop pop ebp
    ret ret
FUN_1001b100 ENDP
END
