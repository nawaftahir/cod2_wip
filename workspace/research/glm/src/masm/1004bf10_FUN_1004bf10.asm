.686
.MODEL FLAT, C
EXTRN sub_1004BB73:PROC
EXTRN sub_1004BBBC:PROC
.CODE
FUN_1004bf10 PROC
    mov eax, dword ptr [esi + 4]
    push edi
    push 24
    push 1
    push esi
    call dword ptr [eax]
    mov edi, eax
    mov dword ptr [esi + 0000001ACh], edi
    mov dword ptr [edi], 01004BF00h
    mov eax, dword ptr [esi + 48]
    add esp, 12
    dec eax
    cmp eax, 4
    ja L0
    jmp dword ptr [eax*4 + 0x1004c0c0]
    cmp dword ptr [esi + 44], 1
    je L3
    jmp L1
    cmp dword ptr [esi + 44], 3
    je L3
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 10
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    jmp L2
    cmp dword ptr [esi + 44], 4
    je L3
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 10
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    jmp L2
L0:
    cmp dword ptr [esi + 44], 1
    jge L3
L1:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 10
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
L2:
    add esp, 4
L3:
    mov ecx, dword ptr [esi + 52]
    mov eax, ecx
    dec eax
    je L11
    dec eax
    je L7
    sub eax, 2
    je L4
    cmp ecx, dword ptr [esi + 48]
    jne L12
    mov eax, dword ptr [esi + 44]
    mov dword ptr [esi + 108], eax
    mov dword ptr [edi + 4], 01004BCA0h
    jmp L15
L4:
    mov eax, dword ptr [esi + 48]
    cmp eax, 5
    mov dword ptr [esi + 108], 4
    jne L5
    mov eax, esi
    mov dword ptr [edi + 4], 01004BDB0h
    call sub_1004BB73
    jmp L15
L5:
    cmp eax, 4
    jne L6
    mov dword ptr [edi + 4], 01004BCA0h
    jmp L15
L6:
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 27
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
    jmp L15
L7:
    mov eax, dword ptr [esi + 48]
    cmp eax, 3
    mov dword ptr [esi + 108], 3
    jne L8
    mov eax, esi
    mov dword ptr [edi + 4], 01004BB80h
    call sub_1004BBBC
    jmp L15
L8:
    cmp eax, 1
    jne L9
    mov dword ptr [edi + 4], 01004BD50h
    jmp L15
L9:
    cmp eax, 2
    jne L10
    mov dword ptr [edi + 4], 01004BCA0h
    jmp L15
L10:
    mov edx, dword ptr [esi]
    mov dword ptr [edx + 20], 27
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    jmp L15
L11:
    mov eax, dword ptr [esi + 48]
    mov ecx, 1
    cmp eax, ecx
    mov dword ptr [esi + 108], ecx
    je L13
    cmp eax, 3
    je L13
L12:
    mov ecx, dword ptr [esi]
    mov dword ptr [ecx + 20], 27
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx]
    add esp, 4
    jmp L15
L13:
    mov dword ptr [edi + 4], 01004BD20h
    cmp dword ptr [esi + 44], ecx
    mov eax, ecx
    jle L15
    mov ecx, 84
    lea ebx, [ebx]
L14:
    mov edx, dword ptr [esi + 0000000CCh]
    mov byte ptr [edx + ecx + 48], 0
    mov edx, dword ptr [esi + 44]
    inc eax
    add ecx, 84
    cmp eax, edx
    jl L14
L15:
    mov al, byte ptr [esi + 82]
    test al, al
    pop edi
    je L16
    mov dword ptr [esi + 112], 1
    ret
L16:
    mov eax, dword ptr [esi + 108]
    mov dword ptr [esi + 112], eax
    ret
FUN_1004bf10 ENDP
END
