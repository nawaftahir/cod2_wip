.686
.MODEL FLAT, C
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
EXTRN g_101AAC70:DWORD
.CODE
FUN_1001b100 PROC
    mov eax, dword ptr [esp + 8]
    mov byte ptr [eax], 0
    mov eax, dword ptr [g_101AAC70]
    imul eax, eax, 00000045Ch
    push ebp
    mov ebp, dword ptr [esp + 8]
    add eax, 0101A66B0h
    mov cl, byte ptr [eax + 000000404h]
    test cl, cl
    push esi
    push edi
    je L0
    mov ecx, dword ptr [eax + 000000418h]
    mov byte ptr [eax + 000000404h], 0
    mov dword ptr [ebx], ecx
    mov edx, dword ptr [eax + 000000414h]
    mov dword ptr [eax + 000000400h], edx
L0:
    push ebx
    mov eax, 1
    call sub_1005F6DE
    add esp, 4
    mov esi, eax
    mov edi, 0101956A0h
    mov ecx, 9
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    je L1
    call sub_1005F458
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
L1:
    push 1
    push 0101958CCh
    mov ecx, ebx
    call sub_1005FB6C
    add esp, 8
    test eax, eax
    je L6
    mov ecx, ebx
    call sub_1005FFBE
    cmp eax, ebp
    je L2
    push eax
    push ebp
    push 0101958ACh
    call sub_1005F3FE
    add esp, 12
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
L2:
    push 1
    push 0101958A8h
    mov ecx, ebx
    call sub_1005FBA5
    add esp, 8
    test eax, eax
    je L6
    push 1
    push 01019563Ch
    mov ecx, ebx
    call sub_1005FBBE
    add esp, 8
    test eax, eax
    je L6
    mov ecx, ebx
    call sub_1005FB30
    mov edi, 010194F88h
    mov esi, eax
    mov ecx, 16
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    mov eax, dword ptr [esp + 20]
    mov byte ptr [eax], 1
    jmp L4
L3:
    mov edi, 010194F7Ch
    mov esi, eax
    mov ecx, 10
    xor edx, edx
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L5
    mov eax, dword ptr [esp + 20]
    mov byte ptr [eax], 2
L4:
    push 1
    push 010195544h
    mov ecx, ebx
    call sub_1005FC12
    add esp, 8
    test eax, eax
    je L6
    push 1
    push 010195540h
    mov ecx, ebx
    call sub_1005FC27
    add esp, 8
    test eax, eax
    je L6
    push 1
    push 010195820h
    mov ecx, ebx
    call sub_1005FC3C
    add esp, 8
    pop edi
    test eax, eax
    pop esi
    setne al
    pop ebp
    ret
L5:
    push eax
    push 010194F20h
    call sub_1005F4C3
    add esp, 8
L6:
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
FUN_1001b100 ENDP
END
