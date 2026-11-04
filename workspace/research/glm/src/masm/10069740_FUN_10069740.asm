.686
.MODEL FLAT, C
EXTRN sub_10067CC2:PROC
.CODE
FUN_10069740 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    mov esi, dword ptr [eax + 8]
    push edi
    xor edi, edi
    cmp esi, edi
    mov ebx, ecx
    mov dword ptr [ebp - 8], edi
    mov eax, esi
    je L11
    cmp byte ptr [esi], 0
    je L11
    mov dword ptr [ebp - 4], 16
L0:
    mov dl, byte ptr [eax]
    test dl, dl
    je L3
    movsx edx, dl
    cmp edx, 119
    jg L7
    je L5
    sub edx, 97
    je L5
    dec edx
    je L8
    sub edx, 5
    je L9
    sub edx, 11
    jne L4
L1:
    xor edi, edi
L2:
    inc eax
L3:
    mov ecx, dword ptr [ebp - 4]
    add dword ptr [ebp - 4], 2
    mov edx, edi
    shl edx, cl
    or dword ptr [ebp - 8], edx
    cmp dword ptr [ebp - 4], 24
    jb L0
    cmp byte ptr [eax], 0
    je L10
L4:
    push esi
    push 01010ED10h
    push 0000007D4h
    push dword ptr [ebp + 8]
    push dword ptr [ebx]
    call sub_10067CC2
    add esp, 20
    mov dword ptr [ebx + 76], 1
    xor eax, eax
    jmp L12
L5:
    push 3
L6:
    pop edi
    jmp L2
L7:
    sub edx, 120
    je L1
    dec edx
    je L9
    dec edx
    jne L4
L8:
    push 2
    jmp L6
L9:
    xor edi, edi
    inc edi
    jmp L2
L10:
    mov eax, dword ptr [ebp - 8]
    jmp L12
L11:
    mov eax, 000E40000h
L12:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_10069740 ENDP
END
