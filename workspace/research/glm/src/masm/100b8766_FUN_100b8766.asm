.686
.MODEL FLAT, C
EXTRN sub_1008B246:PROC
EXTRN sub_100F5E56:PROC
EXTRN sub_100F74C4:PROC
EXTRN sub_100F79C3:PROC
EXTRN sub_100F79E6:PROC
EXTRN sub_100F7A24:PROC
EXTRN sub_100F85C0:PROC
EXTRN sub_100F86A4:PROC
.CODE
FUN_100b8766 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 40
    mov eax, ecx
    mov ecx, dword ptr [eax + 0000000C8h]
    push edi
    xor edi, edi
    and ecx, 0FFFF0000h
    cmp ecx, 046580000h
    mov dword ptr [ebp - 8], eax
    mov dword ptr [ebp - 4], edi
    jne L1
    mov ecx, dword ptr [ebp + 8]
    cmp dword ptr [ecx + 108], -1
    jne L0
    add eax, 0000001F8h
    mov edx, dword ptr [eax]
    mov dword ptr [ecx + 108], edx
    inc dword ptr [eax]
L0:
    xor eax, eax
    jmp L24
L1:
    push ebx
    mov ebx, dword ptr [ebp + 8]
    cmp dword ptr [ebx + 108], -1
    je L2
    xor eax, eax
    jmp L23
L2:
    mov eax, dword ptr [ebx + 104]
    push esi
    push 32
    push dword ptr [eax + 24]
    lea eax, [ebp - 40]
    push eax
    call sub_100F5E56
    add esp, 12
    cmp byte ptr [ebp - 40], 0
    mov byte ptr [ebp - 9], 0
    lea esi, [ebp - 40]
    je L5
L3:
    movsx eax, byte ptr [esi]
    push eax
    call sub_100F85C0
    test eax, eax
    pop ecx
    je L4
    inc esi
    cmp byte ptr [esi], 0
    jne L3
L4:
    cmp byte ptr [esi], 0
    je L6
    push esi
    call sub_100F74C4
    pop ecx
    mov edi, eax
L5:
    cmp byte ptr [esi], 0
    je L6
    mov byte ptr [esi], 0
    inc esi
L6:
    mov al, byte ptr [esi]
    test al, al
    je L9
L7:
    movsx eax, al
    push eax
    call sub_100F86A4
    test eax, eax
    pop ecx
    je L8
    inc esi
    mov al, byte ptr [esi]
    test al, al
    jne L7
L8:
    cmp byte ptr [esi], 0
    je L9
    or edi, 0FFFFFFFFh
    jmp L10
L9:
    mov eax, dword ptr [ebx + 112]
    shr eax, 2
    add edi, eax
L10:
    mov ecx, dword ptr [ebp - 8]
    mov eax, dword ptr [ebx + 4]
    mov ecx, dword ptr [ecx + 16]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 4]
    test al, 16
    je L15
    test ah, 2
    jne L15
    lea eax, [ebp - 40]
    push 0101966DCh
    push eax
    call sub_100F79C3
    test eax, eax
    pop ecx
    pop ecx
    jne L12
    mov dword ptr [ebp - 4], 2
L11:
    cmp edi, 1
    sbb esi, esi
    inc esi
    jmp L14
L12:
    lea eax, [ebp - 40]
    push 01010EC98h
    push eax
    call sub_100F79E6
    test eax, eax
    pop ecx
    pop ecx
    jne L13
    mov dword ptr [ebp - 4], 3
    jmp L11
L13:
    and dword ptr [ebp - 4], 0
    xor esi, esi
    inc esi
L14:
    test esi, esi
    je L19
    cmp dword ptr [ebx + 16], 0
    jne L19
    push edi
    lea eax, [ebp - 40]
    push eax
    push 010117854h
    jmp L18
L15:
    test al, 32
    je L20
    lea eax, [ebp - 40]
    push 0101966D4h
    push eax
    call sub_100F7A24
    test eax, eax
    pop ecx
    pop ecx
    jne L16
    inc eax
    cmp edi, eax
    sbb esi, esi
    mov dword ptr [ebp - 4], eax
    inc esi
    jmp L17
L16:
    and dword ptr [ebp - 4], 0
    xor esi, esi
    inc esi
L17:
    test esi, esi
    je L19
    cmp dword ptr [ebx + 16], 0
    jne L19
    push edi
    lea eax, [ebp - 40]
    push eax
    push 010117E8Ch
L18:
    push 000001196h
    push dword ptr [ebx + 104]
    push dword ptr [ebp - 8]
    call sub_1008B246
    add esp, 24
L19:
    mov eax, dword ptr [ebp - 4]
    test eax, eax
    jne L21
L20:
    mov eax, dword ptr [ebp - 4]
    xor esi, esi
    inc esi
L21:
    cmp edi, 00000FFFFh
    jbe L22
    xor esi, esi
    inc esi
L22:
    or edi, 0FFFFFF00h
    and eax, 0000000FFh
    shl edi, 8
    or edi, eax
    mov eax, esi
    neg eax
    sbb eax, eax
    mov dword ptr [ebx + 108], edi
    and eax, 080004005h
    pop esi
L23:
    pop ebx
L24:
    pop edi
    leave
    ret 8
FUN_100b8766 ENDP
END
