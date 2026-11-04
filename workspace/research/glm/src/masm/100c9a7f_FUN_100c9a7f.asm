.686
.MODEL FLAT, C
EXTRN sub_100C4EB0:PROC
EXTRN sub_100C98CE:PROC
.CODE
FUN_100c9a7f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    mov ebx, dword ptr [ebp + 8]
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi]
    push ebx
    call dword ptr [eax + 0x5c]
    push eax
    mov ecx, esi
    call sub_100C98CE
    test eax, eax
    jl L10
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    push edi
    mov edi, dword ptr [ebp + 12]
    lea ecx, [ebp - 16]
    push ecx
    lea ecx, [ebp - 20]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [edi]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    test eax, eax
    jl L9
    push dword ptr [ebp - 16]
    mov eax, dword ptr [esi]
    lea ecx, [ebp + 8]
    push ecx
    push dword ptr [ebp + 16]
    mov ecx, esi
    push edi
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L9
    mov ecx, dword ptr [ebp + 48]
    push dword ptr [ebp - 20]
    mov eax, dword ptr [esi]
    push dword ptr [ebp + 8]
    neg ecx
    sbb ecx, ecx
    and ecx, 000400000h
    or ecx, dword ptr [ebp - 4]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L9
    cmp ebx, 8
    jne L0
    mov dword ptr [ebp + 8], 000070000h
    jmp L5
L0:
    cmp ebx, 9
    je L4
    cmp ebx, 90
    jne L1
    mov dword ptr [ebp + 8], 000030000h
    jmp L5
L1:
    cmp ebx, 6
    jne L3
L2:
    mov dword ptr [ebp + 8], 000010000h
    jmp L5
L3:
    cmp ebx, 14
    je L2
    cmp ebx, 15
    je L2
    cmp ebx, 7
    je L2
    cmp ebx, 37
    jne L5
L4:
    mov dword ptr [ebp + 8], 0000F0000h
L5:
    mov edi, dword ptr [ebp + 20]
    test edi, edi
    je L6
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [edi]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L9
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    push dword ptr [ebp + 32]
    push edi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L9
    push dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    xor ecx, dword ptr [ebp + 36]
    push dword ptr [ebp - 12]
    mov eax, dword ptr [esi]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L9
L6:
    mov edi, dword ptr [ebp + 24]
    test edi, edi
    je L7
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [edi]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L9
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    push dword ptr [ebp + 32]
    push edi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L9
    push dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    xor ecx, dword ptr [ebp + 40]
    push dword ptr [ebp - 12]
    mov eax, dword ptr [esi]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L9
L7:
    mov edi, dword ptr [ebp + 28]
    test edi, edi
    je L8
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [edi]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L9
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    push dword ptr [ebp + 32]
    push edi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L9
    push dword ptr [ebp - 8]
    mov ecx, dword ptr [ebp - 4]
    xor ecx, dword ptr [ebp + 44]
    push dword ptr [ebp - 12]
    mov eax, dword ptr [esi]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L9
L8:
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L9
    mov ecx, esi
    call sub_100C4EB0
    test eax, eax
    jl L9
    xor eax, eax
L9:
    pop edi
L10:
    pop esi
    pop ebx
    leave
    ret 44
FUN_100c9a7f ENDP
END
