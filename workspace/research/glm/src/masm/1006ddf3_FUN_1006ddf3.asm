.686
.MODEL FLAT, C
EXTRN sub_1006DCF0:PROC
.CODE
FUN_1006ddf3 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    cmp esi, edi
    mov edx, ecx
    mov dword ptr [ebp - 4], edx
    jne L1
    xor eax, eax
    jmp L15
L1:
    mov eax, dword ptr [esi + 4]
    push ebx
    xor ebx, ebx
    dec eax
    je L11
    sub eax, 5
    je L10
    dec eax
    dec eax
    je L8
    dec eax
    je L4
    dec eax
    dec eax
    je L2
    push 01010F7B0h
    push edi
    push edi
    push edx
    call sub_1006DCF0
    add esp, 16
    jmp L14
L2:
    push dword ptr [ebp + 12]
    push dword ptr [esi + 32]
L3:
    mov ecx, edx
    call L0
    mov ebx, eax
    jmp L14
L4:
    mov ebx, dword ptr [esi + 28]
    imul ebx, dword ptr [esi + 24]
    mov esi, dword ptr [esi + 20]
    xor eax, eax
    cmp esi, 12
    mov ecx, 002000000h
    ja L6
    jmp dword ptr [esi*4 + 0x1006df2c]
    push 23
    jmp L5
    push 2
L5:
    pop eax
    jmp L6
    mov eax, 002000002h
    jmp L6
    mov eax, 004000002h
    jmp L6
    mov eax, 008000002h
    jmp L6
    mov eax, ecx
    jmp L6
    mov eax, 004000000h
    jmp L6
    mov eax, 008000000h
L6:
    test byte ptr [edx + 20], 32
    je L7
    and eax, 0F3FFFFFFh
    or eax, ecx
L7:
    test ebx, ebx
    jbe L14
    mov edi, dword ptr [ebp + 12]
    mov ecx, ebx
    rep stosd dword ptr es:[edi], eax
    jmp L14
L8:
    cmp dword ptr [esi + 20], edi
    jbe L14
L9:
    mov eax, dword ptr [ebp + 12]
    mov ecx, dword ptr [ebp - 4]
    lea eax, [eax + ebx*4]
    push eax
    push dword ptr [esi + 16]
    call L0
    add ebx, eax
    inc edi
    cmp edi, dword ptr [esi + 20]
    jb L9
    jmp L14
L10:
    push dword ptr [ebp + 12]
    push dword ptr [esi + 24]
    jmp L3
L11:
    mov edi, dword ptr [ebp + 12]
L12:
    cmp dword ptr [esi + 4], 1
    jne L13
    mov ecx, dword ptr [ebp - 4]
    lea eax, [edi + ebx*4]
    push eax
    push dword ptr [esi + 8]
    call L0
    mov esi, dword ptr [esi + 12]
    add ebx, eax
    test esi, esi
    jne L12
L13:
    test esi, esi
    je L14
    mov ecx, dword ptr [ebp - 4]
    lea eax, [edi + ebx*4]
    push eax
    push esi
    call L0
    add ebx, eax
L14:
    mov eax, ebx
    pop ebx
L15:
    pop edi
    pop esi
    leave
    ret 8
FUN_1006ddf3 ENDP
END
