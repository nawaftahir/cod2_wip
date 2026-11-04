.686
.MODEL FLAT, C
EXTRN sub_100650B5:PROC
EXTRN sub_1006512D:PROC
EXTRN sub_10065177:PROC
EXTRN sub_10065233:PROC
EXTRN sub_10082A0C:PROC
EXTRN sub_10082F11:PROC
EXTRN sub_10082F5C:PROC
EXTRN sub_100832B1:PROC
EXTRN sub_1008357D:PROC
EXTRN sub_10099688:PROC
EXTRN sub_100996FB:PROC
EXTRN sub_10099BF9:PROC
EXTRN sub_10099D0B:PROC
EXTRN sub_1009A5C3:PROC
EXTRN sub_1009A76D:PROC
EXTRN sub_100A096E:PROC
.CODE
FUN_100a0bdc PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    mov eax, dword ptr [ebp + 8]
    push ebx
    push esi
    xor esi, esi
    cmp eax, esi
    push edi
    mov dword ptr [ebp - 8], ecx
    je L18
    cmp dword ptr [eax + 4], 13
    jne L18
    mov eax, dword ptr [ebp + 12]
    cmp eax, esi
    je L18
    cmp dword ptr [eax + 4], 13
    jne L18
    lea edi, [eax + 48]
    push 80
    mov dword ptr [ebp - 4], edi
    call sub_100650B5
    xor ebx, ebx
    inc ebx
    cmp eax, esi
    je L0
    push edi
    push ebx
    push esi
    push esi
    push 22
    push esi
    mov ecx, eax
    call sub_100832B1
    mov edi, eax
    jmp L1
L0:
    xor edi, edi
L1:
    cmp edi, esi
    je L18
    mov eax, dword ptr [ebp + 8]
    mov esi, dword ptr [eax + 16]
    test esi, esi
    mov eax, dword ptr [ebp + 12]
    mov eax, dword ptr [eax + 16]
    mov dword ptr [ebp - 12], eax
    je L16
    mov eax, dword ptr [esi + 4]
    cmp eax, 8
    jne L3
    cmp dword ptr [esi + 16], 0
    je L2
    mov ecx, dword ptr [esi + 16]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [edi + 16], eax
    je L18
L2:
    mov esi, dword ptr [esi + 20]
    jmp L9
L3:
    cmp eax, 9
    jne L16
    cmp dword ptr [esi + 16], ebx
    jne L6
    push 36
    call sub_1006512D
    test eax, eax
    je L4
    mov ecx, dword ptr [esi + 32]
    and ecx, 000000200h
    push ecx
    push ebx
    push ebx
    push dword ptr [esi + 20]
    mov ecx, eax
    push 0
    call sub_10082F11
    jmp L5
L4:
    xor eax, eax
L5:
    test eax, eax
    mov dword ptr [edi + 16], eax
    je L18
    mov esi, dword ptr [esi + 28]
    jmp L9
L6:
    cmp eax, 9
    jne L16
    cmp dword ptr [esi + 16], 2
    jne L16
    push 36
    call sub_10065177
    test eax, eax
    je L7
    mov ecx, dword ptr [esi + 32]
    and ecx, 000000200h
    push ecx
    push dword ptr [esi + 28]
    mov ecx, eax
    push ebx
    push dword ptr [esi + 20]
    push ebx
    call sub_10082F5C
    jmp L8
L7:
    xor eax, eax
L8:
    test eax, eax
    mov dword ptr [edi + 16], eax
    je L18
    mov esi, dword ptr [esi + 24]
L9:
    mov ebx, dword ptr [ebp - 8]
    push dword ptr [ebp - 12]
    mov ecx, ebx
    call sub_10099BF9
    test eax, eax
    jne L10
    push 0101152F8h
    push 000000BEBh
    push dword ptr [ebp - 4]
    push ebx
    jmp L17
L10:
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx]
    call dword ptr [eax + 4]
    test eax, eax
    mov dword ptr [edi + 32], eax
    je L18
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_1009A5C3
    test eax, eax
    je L14
    lea eax, [ebp + 12]
    push eax
    push dword ptr [ebp + 12]
    mov ecx, ebx
    call sub_100A096E
    test eax, eax
    jl L18
    cmp dword ptr [ebp + 12], esi
    jb L11
    push 01010FA70h
    push 000000BD6h
    push dword ptr [ebp - 4]
    push ebx
    call sub_10099688
    add esp, 16
    and dword ptr [ebp + 12], 0
L11:
    push dword ptr [edi + 16]
    mov ecx, ebx
    call sub_10099D0B
    push 64
    mov esi, eax
    call sub_10065233
    test eax, eax
    je L12
    imul esi, dword ptr [ebp + 12]
    push dword ptr [ebp - 4]
    mov ecx, eax
    push esi
    push 2
    call sub_1008357D
    jmp L13
L12:
    xor eax, eax
L13:
    test eax, eax
    mov dword ptr [edi + 36], eax
    je L18
    mov dword ptr [edi + 28], 23
    jmp L15
L14:
    push dword ptr [ebp + 12]
    call sub_10082A0C
    test eax, eax
    mov dword ptr [edi + 36], eax
    je L18
L15:
    push edi
    mov ecx, ebx
    call sub_1009A76D
    mov eax, edi
    jmp L19
L16:
    push 0101152E8h
    push 000000BCDh
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 8]
L17:
    call sub_100996FB
    add esp, 16
L18:
    xor eax, eax
L19:
    pop edi
    pop esi
    pop ebx
    leave
    ret 8
FUN_100a0bdc ENDP
END
