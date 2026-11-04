.686
.MODEL FLAT, C
EXTRN sub_101061B9:PROC
EXTRN sub_10106202:PROC
EXTRN sub_1010621F:PROC
EXTRN sub_10106226:PROC
EXTRN sub_1010625E:PROC
EXTRN sub_101062A8:PROC
EXTRN sub_101062C2:PROC
EXTRN sub_101062E5:PROC
EXTRN sub_10106303:PROC
.CODE
__ld12cvt PROC
    push ebp
    mov ebp, esp
    sub esp, 24
    mov eax, dword ptr [ebp + 8]
    movzx ecx, word ptr [eax + 10]
    push ebx
    push esi
    mov esi, dword ptr [ebp + 16]
    push edi
    mov edi, ecx
    and ecx, 000008000h
    mov dword ptr [ebp + 8], ecx
    mov ecx, dword ptr [eax + 6]
    mov dword ptr [ebp - 12], ecx
    mov ecx, dword ptr [eax + 2]
    movzx eax, word ptr [eax]
    shl eax, 16
    and edi, 000007FFFh
    sub edi, 000003FFFh
    cmp edi, 0FFFFC001h
    mov dword ptr [ebp - 4], eax
    lea eax, [ebp - 12]
    mov dword ptr [ebp - 8], ecx
    push eax
    jne L1
    xor ebx, ebx
    call sub_10106226
    test eax, eax
    pop ecx
    jne L7
    lea edi, [ebp - 12]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
L0:
    push 2
    pop eax
    jmp L8
L1:
    lea eax, [ebp - 24]
    push eax
    call sub_1010621F
    push dword ptr [esi + 8]
    lea eax, [ebp - 12]
    push eax
    call sub_101061B9
    add esp, 16
    test eax, eax
    je L2
    inc edi
L2:
    mov eax, dword ptr [esi + 4]
    mov ecx, eax
    sub ecx, dword ptr [esi + 8]
    cmp edi, ecx
    jge L3
    xor eax, eax
    lea edi, [ebp - 12]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    jmp L4
L3:
    cmp edi, eax
    jg L5
    sub eax, edi
    mov edi, eax
    lea eax, [ebp - 24]
    push eax
    lea eax, [ebp - 12]
    push eax
    call sub_1010625E
    lea eax, [ebp - 12]
    push edi
    push eax
    call sub_101062A8
    push dword ptr [esi + 8]
    lea eax, [ebp - 12]
    push eax
    call sub_10106202
    mov eax, dword ptr [esi + 12]
    inc eax
    push eax
    lea eax, [ebp - 12]
    push eax
    call sub_101062C2
    add esp, 32
L4:
    xor ebx, ebx
    jmp L0
L5:
    cmp edi, dword ptr [esi]
    push dword ptr [esi + 12]
    jl L6
    xor eax, eax
    lea edi, [ebp - 12]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    or byte ptr [ebp - 9], 000000080h
    lea eax, [ebp - 12]
    push eax
    call sub_101062E5
    mov ebx, dword ptr [esi + 20]
    add ebx, dword ptr [esi]
    pop ecx
    xor eax, eax
    pop ecx
    inc eax
    jmp L8
L6:
    mov ebx, dword ptr [esi + 20]
    and byte ptr [ebp - 9], 127
    lea eax, [ebp - 12]
    push eax
    add ebx, edi
    call sub_10106303
    pop ecx
    pop ecx
L7:
    xor eax, eax
L8:
    push 31
    pop ecx
    sub ecx, dword ptr [esi + 12]
    mov esi, dword ptr [esi + 16]
    shl ebx, cl
    mov ecx, dword ptr [ebp + 8]
    neg ecx
    sbb ecx, ecx
    and ecx, 080000000h
    or ebx, ecx
    or ebx, dword ptr [ebp - 12]
    cmp esi, 64
    jne L9
    mov ecx, dword ptr [ebp + 12]
    mov edx, dword ptr [ebp - 8]
    mov dword ptr [ecx + 4], ebx
    mov dword ptr [ecx], edx
    jmp L10
L9:
    cmp esi, 32
    jne L10
    mov ecx, dword ptr [ebp + 12]
    mov dword ptr [ecx], ebx
L10:
    pop edi
    pop esi
    pop ebx
    leave
    ret
__ld12cvt ENDP
END
