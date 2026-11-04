.686
.MODEL FLAT, C
EXTRN sub_101061B9:PROC
EXTRN sub_10106202:PROC
EXTRN sub_1010621F:PROC
EXTRN sub_10106226:PROC
EXTRN sub_1010625E:PROC
EXTRN sub_101063DB:PROC
EXTRN sub_101063DC:PROC
EXTRN sub_101063E4:PROC
EXTRN sub_101063EB:PROC
EXTRN sub_1010644F:PROC
EXTRN sub_10106486:PROC
EXTRN sub_101064ED:PROC
EXTRN sub_10106504:PROC
EXTRN sub_10106509:PROC
.CODE
__ld12cvt PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 24
    mov mov eax, dword ptr [ebp + 8]
    movzx movzx ecx, word ptr [eax + 10]
    push push ebx
    push push esi
    mov mov esi, dword ptr [ebp + 16]
    push push edi
    mov mov edi, ecx
    and and ecx, 08000h
    mov mov dword ptr [ebp + 8], ecx
    mov mov ecx, dword ptr [eax + 6]
    mov mov dword ptr [ebp - 12], ecx
    mov mov ecx, dword ptr [eax + 2]
    movzx movzx eax, word ptr [eax]
    shl shl eax, 16
    and and edi, 07FFFh
    sub sub edi, 03FFFh
    cmp cmp edi, 0FFFFC001h
    mov mov dword ptr [ebp - 4], eax
    lea lea eax, [ebp - 12]
    mov mov dword ptr [ebp - 8], ecx
    push push eax
    jne L4
    xor xor ebx, ebx
    call sub_10106226
    test test eax, eax
    pop pop ecx
    jne sub_101063DB
    lea lea edi, [ebp - 12]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    push push 2
    pop pop eax
    jmp sub_101063EB
    lea lea eax, [ebp - 24]
    push push eax
    call sub_1010621F
    push push dword ptr [esi + 8]
    lea lea eax, [ebp - 12]
    push push eax
    call sub_101061B9
    add add esp, 16
    test test eax, eax
    je L5
    inc inc edi
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, eax
    sub sub ecx, dword ptr [esi + 8]
    cmp cmp edi, ecx
    jge L6
    xor xor eax, eax
    lea lea edi, [ebp - 12]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    jmp sub_101063DC
    cmp cmp edi, eax
    jg sub_101063E4
    sub sub eax, edi
    mov mov edi, eax
    lea lea eax, [ebp - 24]
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    call sub_1010625E
    lea lea eax, [ebp - 12]
L4:
    push push edi
    push push eax
    call L0
    push push dword ptr [esi + 8]
    lea lea eax, [ebp - 12]
    push push eax
    call sub_10106202
    mov mov eax, dword ptr [esi + 12]
    inc inc eax
    push push eax
    lea lea eax, [ebp - 12]
    push push eax
    call L1
    add add esp, 32
    xor xor ebx, ebx
    jmp L7
    cmp cmp edi, dword ptr [esi]
    push push dword ptr [esi + 12]
    jl sub_1010644F
    xor xor eax, eax
    lea lea edi, [ebp - 12]
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    stosd stosd dword ptr es:[edi], eax
    or or byte ptr [ebp - 9], 080h
    lea lea eax, [ebp - 12]
    push push eax
    call L2
    mov mov ebx, dword ptr [esi + 20]
    add add ebx, dword ptr [esi]
    pop pop ecx
    xor xor eax, eax
    pop pop ecx
    inc inc eax
    jmp sub_10106486
    mov mov ebx, dword ptr [esi + 20]
    and and byte ptr [ebp - 9], 127
L5:
    lea lea eax, [ebp - 12]
    push push eax
    add add ebx, edi
    call L3
    pop pop ecx
    pop pop ecx
    xor xor eax, eax
    push push 31
    pop pop ecx
    sub sub ecx, dword ptr [esi + 12]
    mov mov esi, dword ptr [esi + 16]
    shl shl ebx, cl
    mov mov ecx, dword ptr [ebp + 8]
    neg neg ecx
    sbb sbb ecx, ecx
    and and ecx, 080000000h
    or or ebx, ecx
    or or ebx, dword ptr [ebp - 12]
    cmp cmp esi, 64
    jne sub_101064ED
    mov mov ecx, dword ptr [ebp + 12]
    mov mov edx, dword ptr [ebp - 8]
    mov mov dword ptr [ecx + 4], ebx
    mov mov dword ptr [ecx], edx
    jmp sub_10106504
    cmp cmp esi, 32
    jne sub_10106509
    mov mov ecx, dword ptr [ebp + 12]
    mov mov dword ptr [ecx], ebx
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret
__ld12cvt ENDP
END
