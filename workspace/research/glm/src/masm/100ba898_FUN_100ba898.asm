.686
.MODEL FLAT, C
EXTRN sub_100863E9:PROC
EXTRN sub_1008B170:PROC
EXTRN sub_1008B290:PROC
EXTRN sub_1008B2CF:PROC
EXTRN sub_100F5E21:PROC
EXTRN sub_100F74C4:PROC
EXTRN sub_100F792F:PROC
EXTRN sub_100F79F4:PROC
EXTRN sub_100F85C0:PROC
EXTRN sub_100F86D3:PROC
.CODE
FUN_100ba898 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 76
    and dword ptr [ebp - 8], 0
    push ebx
    mov ebx, dword ptr [ebp + 20]
    and dword ptr [ebx], 0
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 104]
    and byte ptr [esi + 3], 0000000BFh
    push edi
    mov edi, dword ptr [eax + 24]
    push 63
    lea eax, [ebp - 76]
    push edi
    push eax
    mov dword ptr [ebp - 4], ecx
    call sub_100F5E21
    add esp, 12
    cmp byte ptr [ebp - 76], 0
    mov byte ptr [ebp - 13], 0
    lea eax, [ebp - 76]
    je L1
L0:
    cmp byte ptr [eax], 95
    je L2
    inc eax
    cmp byte ptr [eax], 0
    jne L0
L1:
    cmp byte ptr [eax], 95
    jne L3
L2:
    mov byte ptr [eax], 0
    inc eax
    push 01010ECECh
    push eax
    call sub_100F792F
    test eax, eax
    pop ecx
    pop ecx
    jne L6
    mov dword ptr [ebp - 8], 1
L3:
    cmp byte ptr [ebp - 76], 0
    lea edi, [ebp - 76]
    je L7
L4:
    movsx eax, byte ptr [edi]
    push eax
    call sub_100F85C0
    test eax, eax
    pop ecx
    je L5
    inc edi
    cmp byte ptr [edi], 0
    jne L4
L5:
    cmp byte ptr [edi], 0
    je L7
    push edi
    call sub_100F74C4
    pop ecx
    mov dword ptr [ebp + 8], eax
    jmp L8
L6:
    push edi
    push 01011A054h
    mov dword ptr [ebx], 1
    and dword ptr [esi + 108], 0
    push 000001196h
    push dword ptr [esi + 104]
    push dword ptr [ebp - 4]
    call sub_1008B170
    add esp, 20
    jmp L25
L7:
    and dword ptr [ebp + 8], 0
L8:
    cmp byte ptr [edi], 0
    je L9
    mov byte ptr [edi], 0
    inc edi
L9:
    mov al, byte ptr [edi]
    test al, al
    je L12
L10:
    movsx eax, al
    push eax
    call sub_100F86D3
    test eax, eax
    pop ecx
    je L11
    inc edi
    mov al, byte ptr [edi]
    test al, al
    jne L10
L11:
    cmp byte ptr [edi], 0
    je L12
    or dword ptr [ebp + 8], 0FFFFFFFFh
    jmp L13
L12:
    mov eax, dword ptr [esi + 112]
    shr eax, 2
    add dword ptr [ebp + 8], eax
L13:
    mov ecx, dword ptr [ebp - 4]
    push esi
    call sub_100863E9
    mov edi, dword ptr [ebp + 12]
    xor ebx, ebx
    cmp dword ptr [edi + 16], -1
    mov dword ptr [ebp - 12], eax
    je L24
L14:
    lea eax, [ebp - 76]
    push eax
    push dword ptr [edi]
    call sub_100F79F4
    test eax, eax
    pop ecx
    pop ecx
    jne L15
    mov ax, word ptr [edi + 4]
    mov ebx, edi
    and eax, dword ptr [ebp + 16]
    test ax, ax
    jne L16
L15:
    add edi, 36
    cmp dword ptr [edi + 16], -1
    jne L14
L16:
    test ebx, ebx
    je L24
    cmp dword ptr [edi + 16], -1
    je L24
    cmp dword ptr [ebp - 8], 0
    je L17
    test byte ptr [ebx + 8], 1
    jne L17
    mov eax, 040000000h
    or dword ptr [esi], eax
    jmp L18
L17:
    mov eax, 040000000h
L18:
    mov ecx, dword ptr [ebx + 12]
    test ecx, ecx
    je L19
    push dword ptr [ebp + 8]
    lea eax, [ebp - 76]
    push ecx
    push eax
    push dword ptr [ebp - 12]
    push 01011A018h
    push 000001261h
    push dword ptr [esi + 104]
    push dword ptr [ebp - 4]
    call sub_1008B2CF
    add esp, 32
    mov eax, 040000000h
L19:
    mov ecx, dword ptr [ebp + 8]
    cmp ecx, dword ptr [edi + 20]
    jb L20
    cmp ecx, dword ptr [edi + 24]
    jb L21
L20:
    or dword ptr [esi], eax
L21:
    mov edx, dword ptr [esi + 16]
    cmp edx, dword ptr [edi + 32]
    jb L22
    or dword ptr [esi], eax
    push dword ptr [ebp - 12]
    mov eax, dword ptr [ebp + 20]
    mov dword ptr [eax], 1
    lea eax, [ebp - 76]
    push eax
    push 010119FF0h
    push 0000011CBh
    push dword ptr [esi + 104]
    push dword ptr [ebp - 4]
    call sub_1008B290
    add esp, 24
    jmp L25
L22:
    xor edx, edx
    mov dx, word ptr [ebx + 4]
    and edx, dword ptr [ebp + 16]
    test dx, dx
    jne L23
    or dword ptr [esi], eax
L23:
    mov eax, dword ptr [ebx + 28]
    add eax, ecx
    mov ecx, dword ptr [ebx + 16]
    shl eax, 16
    and ecx, 00000FFFFh
    or eax, ecx
    cmp dword ptr [ebp - 8], 0
    mov dword ptr [esi + 108], eax
    je L25
    or byte ptr [esi + 3], 1
    jmp L25
L24:
    or byte ptr [esi + 3], 64
    and dword ptr [esi + 108], 0
L25:
    mov ecx, dword ptr [ebp + 20]
    xor eax, eax
    cmp dword ptr [ecx], eax
    pop edi
    pop esi
    setne al
    pop ebx
    leave
    ret 16
FUN_100ba898 ENDP
END
