.686
.MODEL FLAT, C
EXTRN sub_10100F7D:PROC
EXTRN sub_10108FAB:PROC
EXTRN sub_101092BB:PROC
EXTRN sub_101092C6:PROC
EXTRN sub_101092D1:PROC
EXTRN sub_101092F5:PROC
EXTRN sub_101092F8:PROC
EXTRN sub_101092FB:PROC
EXTRN sub_101092FC:PROC
EXTRN sub_1010933E:PROC
EXTRN sub_1010935A:PROC
EXTRN sub_10109362:PROC
EXTRN sub_10109368:PROC
EXTRN sub_10109369:PROC
EXTRN sub_1010938F:PROC
EXTRN sub_101093B2:PROC
EXTRN sub_101093F6:PROC
EXTRN sub_101093F9:PROC
EXTRN sub_101093FE:PROC
EXTRN sub_10109404:PROC
EXTRN sub_1010941D:PROC
EXTRN sub_10109423:PROC
EXTRN sub_10109428:PROC
EXTRN sub_10109458:PROC
EXTRN sub_1010948E:PROC
EXTRN EXTRN g_101A50D0:DWORD:DWORD
.CODE
___ld12mul PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 40
    mov mov eax, dword ptr [g_101A50D0]
    push push ebx
    mov mov ebx, dword ptr [ebp + 12]
    mov mov dword ptr [ebp - 4], eax
L0:
    xor xor eax, eax
    xor xor ecx, ecx
    mov mov cx, word ptr [ebx + 10]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    mov mov dword ptr [ebp - 28], eax
    mov mov dword ptr [ebp - 16], eax
    mov mov dword ptr [ebp - 12], eax
    mov mov dword ptr [ebp - 8], eax
    mov mov ax, word ptr [esi + 10]
    push push edi
    mov mov edi, ecx
    mov mov edx, 07FFFh
    and and ecx, edx
    xor xor edi, eax
    and and eax, edx
    and and edi, 08000h
    cmp cmp ax, 07FFFh
    lea lea edx, [ecx + eax]
    mov mov dword ptr [ebp + 8], edx
    jae sub_101092BB
    cmp cmp cx, 07FFFh
    jae sub_101092C6
    cmp cmp dx, 0BFFDh
    ja sub_101092D1
    cmp cmp dx, 03FBFh
    ja L2
    xor xor eax, eax
    jmp L5
    test test ax, ax
    mov mov edx, 07FFFFFFFh
    jne L3
    inc inc dword ptr [ebp + 8]
    xor xor eax, eax
    test test dword ptr [esi + 8], edx
    jne L4
    cmp cmp dword ptr [esi + 4], eax
    jne L6
    cmp cmp dword ptr [esi], eax
    jne L7
    jmp sub_101092F8
    xor xor eax, eax
    cmp cmp cx, ax
    jne L8
    inc inc dword ptr [ebp + 8]
    test test dword ptr [ebx + 8], edx
    jne L9
    cmp cmp dword ptr [ebx + 4], eax
    jne L10
    cmp cmp dword ptr [ebx], eax
    jne L11
    mov mov dword ptr [esi + 8], eax
    mov mov dword ptr [esi + 4], eax
    mov mov dword ptr [esi], eax
    jmp sub_1010933E
    mov mov dword ptr [ebp - 24], eax
    lea lea eax, [ebp - 12]
    mov mov dword ptr [ebp - 20], eax
    mov mov dword ptr [ebp + 12], 5
    mov mov eax, dword ptr [ebp - 24]
    add add eax, eax
    cmp cmp dword ptr [ebp + 12], 0
    jle L12
    add add eax, esi
    mov mov dword ptr [ebp - 36], eax
    mov mov eax, dword ptr [ebp + 12]
    lea lea ecx, [ebx + 8]
    mov mov dword ptr [ebp - 32], ecx
    mov mov dword ptr [ebp - 40], eax
    mov mov eax, dword ptr [ebp - 32]
    mov mov ecx, dword ptr [ebp - 36]
    movzx movzx ecx, word ptr [ecx]
    movzx movzx eax, word ptr [eax]
    imul imul eax, ecx
    mov mov ecx, dword ptr [ebp - 20]
    add add ecx, -4
    push push ecx
    push push eax
    push push dword ptr [ecx]
    call sub_10108FAB
    add add esp, 12
    test test eax, eax
    je L15
    mov mov eax, dword ptr [ebp - 20]
    inc inc word ptr [eax]
    add add dword ptr [ebp - 36], 2
    sub sub dword ptr [ebp - 32], 2
    dec dec dword ptr [ebp - 40]
    jne L14
L4:
    add add dword ptr [ebp - 20], 2
    inc inc dword ptr [ebp - 24]
    dec dec dword ptr [ebp + 12]
    cmp cmp dword ptr [ebp + 12], 0
    jg L13
    add add dword ptr [ebp + 8], 0C002h
    cmp cmp word ptr [ebp + 8], 0
    jle sub_101092FC
    test test byte ptr [ebp - 5], 080h
    jne sub_101092FB
    lea lea eax, [ebp - 16]
    push push eax
    call L0
    add add dword ptr [ebp + 8], 0FFFFh
    cmp cmp word ptr [ebp + 8], 0
    pop pop ecx
    jg sub_101092F5
    cmp cmp word ptr [ebp + 8], 0
    jg sub_1010935A
    add add dword ptr [ebp + 8], 0FFFFh
    cmp cmp word ptr [ebp + 8], 0
    jge sub_10109368
    mov mov eax, dword ptr [ebp + 8]
    neg neg eax
    movzx movzx ebx, ax
    add add dword ptr [ebp + 8], ebx
    test test byte ptr [ebp - 16], 1
    je sub_10109362
    inc inc dword ptr [ebp - 28]
    lea lea eax, [ebp - 16]
    push push eax
    call L1
    dec dec ebx
    pop pop ecx
    jne sub_10109369
    cmp cmp dword ptr [ebp - 28], 0
    je sub_1010938F
    or or byte ptr [ebp - 16], 1
    cmp cmp word ptr [ebp - 16], 08000h
    ja sub_101093B2
    mov mov eax, dword ptr [ebp - 16]
    and and eax, 01FFFFh
    cmp cmp eax, 018000h
    jne sub_101093F6
    cmp cmp dword ptr [ebp - 14], -1
    jne sub_101093F9
    and and dword ptr [ebp - 14], 0
    cmp cmp dword ptr [ebp - 10], -1
    jne sub_101093FE
    and and dword ptr [ebp - 10], 0
    cmp cmp word ptr [ebp - 6], 0FFFFh
    jne sub_10109404
    inc inc dword ptr [ebp + 8]
    mov mov word ptr [ebp - 6], 08000h
    jmp sub_1010941D
    inc inc word ptr [ebp - 6]
    jmp sub_10109423
    inc inc dword ptr [ebp - 10]
    jmp sub_10109428
    inc inc dword ptr [ebp - 14]
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp ax, 07FFFh
    jae sub_10109458
    mov mov cx, word ptr [ebp - 14]
L12:
    mov mov word ptr [esi], cx
    mov mov ecx, dword ptr [ebp - 12]
    mov mov dword ptr [esi + 2], ecx
    mov mov ecx, dword ptr [ebp - 8]
    mov mov dword ptr [esi + 6], ecx
    or or eax, edi
L14:
    mov mov word ptr [esi + 10], ax
    jmp sub_1010948E
    neg neg di
    sbb sbb edi, edi
    and and dword ptr [esi + 4], 0
    and and edi, 080000000h
    add add edi, 07FFF8000h
    and and dword ptr [esi], 0
    mov mov dword ptr [esi + 8], edi
    mov mov ecx, dword ptr [ebp - 4]
    pop pop edi
    pop pop esi
    pop pop ebx
    call sub_10100F7D
    leave leave
    ret ret
___ld12mul ENDP
END
