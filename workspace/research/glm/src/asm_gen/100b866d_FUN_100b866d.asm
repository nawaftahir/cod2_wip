; FUN_100b866d @ 0x100b866d — auto-synthesized
    sub_1008b168 PROTO C
    sub_100c7b5b PROTO C
    sub_100c7b97 PROTO C
.CODE
FUN_100b866d PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ecx + 0x10]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 4]
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + 4]
    test ah, 1
    je L0
    push 1
    call sub_100c7b5b
    jmp L1
    mov edx, eax
    and edx, 0x200
    je L2
    test al, al
    jns L2
    push 9
    jmp L3
    test edx, edx
    je L4
    push 2
    jmp L3
    test al, 0x10
    je L5
    push 3
    jmp L3
    push edi
    mov edx, 0x2020
    mov edi, eax
    and edi, edx
    cmp edi, edx
    jne L6
    push 5
    call sub_100c7b97
    jmp L7
    mov edx, 0x40020
    mov edi, eax
    and edi, edx
    cmp edi, edx
    jne L8
    push 6
    jmp L9
    test al, 0x20
    je L10
    push 4
    jmp L9
    test al, 1
    je L11
    test al, 2
    je L12
    push 7
    jmp L9
    test al, 2
    je L12
    test al, 4
    je L12
    push 8
    jmp L9
    test eax, 0x10000
    je L13
    mov eax, dword ptr [esi + 0x48]
    mov edx, dword ptr [ecx + 0x18]
    mov eax, dword ptr [edx + eax*4]
    push 0x10117e64
    push 0x1194
    push dword ptr [eax + 0x3c]
    push ecx
    call sub_1008b168
    add esp, 0x10
    mov eax, 0x80004005
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_100b866d ENDP
END