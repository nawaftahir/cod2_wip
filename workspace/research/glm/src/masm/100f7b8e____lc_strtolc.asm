.686
.MODEL FLAT, C
EXTRN sub_100F5E2C:PROC
EXTRN sub_100F5E9D:PROC
EXTRN sub_10100355:PROC
EXTRN sub_101003BA:PROC
.CODE
___lc_strtolc PROC
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push 000000090h
    push 0
    push edi
    call sub_10100355
    mov esi, dword ptr [ebp + 12]
    mov al, byte ptr [esi]
    add esp, 12
    test al, al
    je L0
    cmp al, 46
    jne L1
    lea eax, [esi + 1]
    cmp byte ptr [eax], 0
    je L1
    push 15
    push eax
    lea eax, [edi + 000000080h]
    push eax
    call sub_100F5E2C
    add esp, 12
    mov byte ptr [edi + 00000008Fh], 0
L0:
    xor eax, eax
    jmp L11
L1:
    and dword ptr [ebp + 12], 0
    push ebx
    jmp L8
L2:
    cmp dword ptr [ebp + 12], 0
    lea edi, [eax + esi]
    mov bl, byte ptr [edi]
    jne L3
    cmp eax, 64
    jae L9
    cmp bl, 46
    je L9
    push eax
    push esi
    push dword ptr [ebp + 8]
    jmp L7
L3:
    cmp dword ptr [ebp + 12], 1
    jne L4
    cmp eax, 64
    jae L9
    cmp bl, 95
    je L9
    push eax
    mov eax, dword ptr [ebp + 8]
    add eax, 64
    jmp L6
L4:
    cmp dword ptr [ebp + 12], 2
    jne L9
    cmp eax, 16
    jae L9
    test bl, bl
    je L5
    cmp bl, 44
    jne L9
L5:
    push eax
    mov eax, dword ptr [ebp + 8]
    add eax, 000000080h
L6:
    push esi
    push eax
L7:
    call sub_100F5E9D
    add esp, 12
    cmp bl, 44
    je L12
    test bl, bl
    je L12
    inc dword ptr [ebp + 12]
    lea esi, [edi + 1]
L8:
    push 01017C678h
    push esi
    call sub_101003BA
    test eax, eax
    pop ecx
    pop ecx
    jne L2
L9:
    or eax, 0FFFFFFFFh
L10:
    pop ebx
L11:
    pop edi
    pop esi
    pop ebp
    ret
L12:
    xor eax, eax
    jmp L10
___lc_strtolc ENDP
END
