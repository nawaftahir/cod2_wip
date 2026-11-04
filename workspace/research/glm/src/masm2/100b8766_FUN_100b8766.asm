.686
.MODEL FLAT, C
EXTRN sub_1008B246:PROC
EXTRN sub_100B8969:PROC
EXTRN sub_100B8975:PROC
EXTRN sub_100B8985:PROC
EXTRN sub_100B898A:PROC
EXTRN sub_100B898D:PROC
EXTRN sub_100B898F:PROC
EXTRN sub_100B899C:PROC
EXTRN sub_100B89A9:PROC
EXTRN sub_100B8A27:PROC
EXTRN sub_100B8A2A:PROC
EXTRN sub_100B8A2B:PROC
EXTRN sub_100B8A31:PROC
EXTRN sub_100B8A39:PROC
EXTRN sub_100B8A48:PROC
EXTRN sub_100B8A6B:PROC
EXTRN sub_100B8A71:PROC
EXTRN sub_100B8AA2:PROC
EXTRN sub_100B8ABB:PROC
EXTRN sub_100F5E56:PROC
EXTRN sub_100F74C4:PROC
EXTRN sub_100F79C3:PROC
EXTRN sub_100F79E6:PROC
EXTRN sub_100F7A24:PROC
EXTRN sub_100F85C0:PROC
EXTRN sub_100F86A4:PROC
.CODE
FUN_100b8766 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 40
    mov mov eax, ecx
    mov mov ecx, dword ptr [eax + 0C8h]
    push push edi
    xor xor edi, edi
    and and ecx, 0FFFF0000h
    cmp cmp ecx, 046580000h
    mov mov dword ptr [ebp - 8], eax
    mov mov dword ptr [ebp - 4], edi
    jne L0
    mov mov ecx, dword ptr [ebp + 8]
    cmp cmp dword ptr [ecx + 108], -1
    jne L1
    add add eax, 01F8h
    mov mov edx, dword ptr [eax]
    mov mov dword ptr [ecx + 108], edx
    inc inc dword ptr [eax]
    xor xor eax, eax
    jmp sub_100B8975
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    cmp cmp dword ptr [ebx + 108], -1
    je L2
    xor xor eax, eax
    jmp sub_100B8985
    mov mov eax, dword ptr [ebx + 104]
    push push esi
    push push 32
    push push dword ptr [eax + 24]
    lea lea eax, [ebp - 40]
    push push eax
    call sub_100F5E56
    add add esp, 12
    cmp cmp byte ptr [ebp - 40], 0
    mov mov byte ptr [ebp - 9], 0
    lea lea esi, [ebp - 40]
    je L4
    movsx movsx eax, byte ptr [esi]
    push push eax
    call sub_100F85C0
    test test eax, eax
    pop pop ecx
    je L4
    inc inc esi
    cmp cmp byte ptr [esi], 0
    jne L3
    cmp cmp byte ptr [esi], 0
    je L5
    push push esi
    call sub_100F74C4
    pop pop ecx
    mov mov edi, eax
    cmp cmp byte ptr [esi], 0
    je L6
    mov mov byte ptr [esi], 0
    inc inc esi
L2:
    mov mov al, byte ptr [esi]
    test test al, al
    je L8
    movsx movsx eax, al
    push push eax
    call sub_100F86A4
    test test eax, eax
    pop pop ecx
    je L9
    inc inc esi
    mov mov al, byte ptr [esi]
    test test al, al
    jne L7
    cmp cmp byte ptr [esi], 0
    je L10
    or or edi, -1
    jmp L11
    mov mov eax, dword ptr [ebx + 112]
    shr shr eax, 2
    add add edi, eax
    mov mov ecx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [ebx + 4]
    mov mov ecx, dword ptr [ecx + 16]
    mov mov eax, dword ptr [ecx + eax*4]
    mov mov eax, dword ptr [eax + 4]
    test test al, 16
    je sub_100B898A
    test test ah, 2
    jne sub_100B898F
    lea lea eax, [ebp - 40]
    push push 0101966DCh
    push push eax
    call sub_100F79C3
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100B8969
    mov mov dword ptr [ebp - 4], 2
    cmp cmp edi, 1
    sbb sbb esi, esi
    inc inc esi
    jmp sub_100B899C
    lea lea eax, [ebp - 40]
    push push 01010EC98h
    push push eax
    call sub_100F79E6
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100B89A9
    mov mov dword ptr [ebp - 4], 3
    jmp sub_100B898D
    and and dword ptr [ebp - 4], 0
    xor xor esi, esi
    inc inc esi
    test test esi, esi
    je sub_100B8A2B
    cmp cmp dword ptr [ebx + 16], 0
    jne sub_100B8A31
    push push edi
    lea lea eax, [ebp - 40]
    push push eax
    push push 010117854h
    jmp sub_100B8A2A
    test test al, 32
    je sub_100B8A48
    lea lea eax, [ebp - 40]
    push push 0101966D4h
    push push eax
    call sub_100F7A24
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100B8A27
    inc inc eax
    cmp cmp edi, eax
    sbb sbb esi, esi
    mov mov dword ptr [ebp - 4], eax
L7:
    inc inc esi
    jmp sub_100B8A39
    and and dword ptr [ebp - 4], 0
    xor xor esi, esi
    inc inc esi
L8:
    test test esi, esi
    je sub_100B8A6B
L9:
    cmp cmp dword ptr [ebx + 16], 0
    jne sub_100B8A71
    push push edi
    lea lea eax, [ebp - 40]
    push push eax
    push push 010117E8Ch
    push push 01196h
    push push dword ptr [ebx + 104]
    push push dword ptr [ebp - 8]
    call sub_1008B246
    add add esp, 24
L11:
    mov mov eax, dword ptr [ebp - 4]
    test test eax, eax
    jne sub_100B8AA2
    mov mov eax, dword ptr [ebp - 4]
    xor xor esi, esi
    inc inc esi
    cmp cmp edi, 0FFFFh
    jbe sub_100B8ABB
    xor xor esi, esi
    inc inc esi
    or or edi, 0FFFFFF00h
    and and eax, 0FFh
    shl shl edi, 8
    or or edi, eax
    mov mov eax, esi
    neg neg eax
    sbb sbb eax, eax
    mov mov dword ptr [ebx + 108], edi
    and and eax, 080004005h
    pop pop esi
    pop pop ebx
    pop pop edi
    leave leave
    ret ret 8
FUN_100b8766 ENDP
END
