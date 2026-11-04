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
EXTRN sub_100A0E11:PROC
EXTRN sub_100A0E18:PROC
EXTRN sub_100A0E22:PROC
EXTRN sub_100A0E2D:PROC
EXTRN sub_100A0E2E:PROC
EXTRN sub_100A0E37:PROC
EXTRN sub_100A0E66:PROC
EXTRN sub_100A0E67:PROC
EXTRN sub_100A0E81:PROC
EXTRN sub_100A0E98:PROC
EXTRN sub_100A0E9F:PROC
EXTRN sub_100A0EDD:PROC
EXTRN sub_100A0EE7:PROC
EXTRN sub_100A0F26:PROC
EXTRN sub_100A0F32:PROC
EXTRN sub_100A0F47:PROC
EXTRN sub_100A0F51:PROC
EXTRN sub_100A0F6C:PROC
EXTRN sub_100A0F81:PROC
EXTRN sub_100A0F90:PROC
EXTRN sub_100A0F96:PROC
EXTRN sub_100A0FC7:PROC
EXTRN sub_100A0FE2:PROC
EXTRN sub_100A0FFA:PROC
EXTRN sub_100A1008:PROC
.CODE
FUN_100a0bdc PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    mov mov eax, dword ptr [ebp + 8]
    push push ebx
    push push esi
    xor xor esi, esi
    cmp cmp eax, esi
    push push edi
    mov mov dword ptr [ebp - 8], ecx
    je sub_100A0E18
    cmp cmp dword ptr [eax + 4], 13
    jne sub_100A0E22
    mov mov eax, dword ptr [ebp + 12]
    cmp cmp eax, esi
    je sub_100A0E2D
    cmp cmp dword ptr [eax + 4], 13
    jne sub_100A0E37
    lea lea edi, [eax + 48]
    push push 80
    mov mov dword ptr [ebp - 4], edi
    call sub_100650B5
    xor xor ebx, ebx
    inc inc ebx
    cmp cmp eax, esi
    je L0
    push push edi
    push push ebx
    push push esi
    push push esi
    push push 22
    push push esi
    mov mov ecx, eax
    call sub_100832B1
    mov mov edi, eax
    jmp L1
    xor xor edi, edi
    cmp cmp edi, esi
    je sub_100A0E67
    mov mov eax, dword ptr [ebp + 8]
    mov mov esi, dword ptr [eax + 16]
    test test esi, esi
    mov mov eax, dword ptr [ebp + 12]
    mov mov eax, dword ptr [eax + 16]
    mov mov dword ptr [ebp - 12], eax
    je sub_100A0E66
    mov mov eax, dword ptr [esi + 4]
    cmp cmp eax, 8
    jne L3
    cmp cmp dword ptr [esi + 16], 0
    je L2
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [edi + 16], eax
    je sub_100A0E9F
    mov mov esi, dword ptr [esi + 20]
    jmp L7
    cmp cmp eax, 9
    jne sub_100A0E98
    cmp cmp dword ptr [esi + 16], ebx
    jne L5
    push push 36
    call sub_1006512D
    test test eax, eax
    je L4
    mov mov ecx, dword ptr [esi + 32]
    and and ecx, 0200h
    push push ecx
    push push ebx
    push push ebx
    push push dword ptr [esi + 20]
    mov mov ecx, eax
    push push 0
    call sub_10082F11
    jmp L6
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [edi + 16], eax
    je sub_100A0EE7
    mov mov esi, dword ptr [esi + 28]
    jmp L8
    cmp cmp eax, 9
    jne sub_100A0EDD
    cmp cmp dword ptr [esi + 16], 2
    jne sub_100A0EE7
    push push 36
    call sub_10065177
    test test eax, eax
    je sub_100A0E11
    mov mov ecx, dword ptr [esi + 32]
    and and ecx, 0200h
    push push ecx
    push push dword ptr [esi + 28]
    mov mov ecx, eax
    push push ebx
    push push dword ptr [esi + 20]
    push push ebx
    call sub_10082F5C
    jmp sub_100A0E2E
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [edi + 16], eax
    je sub_100A0F32
    mov mov esi, dword ptr [esi + 24]
    mov mov ebx, dword ptr [ebp - 8]
    push push dword ptr [ebp - 12]
    mov mov ecx, ebx
    call sub_10099BF9
    test test eax, eax
    jne sub_100A0E81
    push push 0101152F8h
    push push 0BEBh
    push push dword ptr [ebp - 4]
    push push ebx
    jmp sub_100A0F51
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    test test eax, eax
    mov mov dword ptr [edi + 32], eax
    je sub_100A0F6C
    push push dword ptr [ebp + 12]
    mov mov ecx, ebx
    call sub_1009A5C3
    test test eax, eax
    je sub_100A0F47
    lea lea eax, [ebp + 12]
    push push eax
    push push dword ptr [ebp + 12]
    mov mov ecx, ebx
    call sub_100A096E
    test test eax, eax
    jl sub_100A0F90
    cmp cmp dword ptr [ebp + 12], esi
    jb sub_100A0F26
    push push 01010FA70h
    push push 0BD6h
    push push dword ptr [ebp - 4]
    push push ebx
    call sub_10099688
    add add esp, 16
    and and dword ptr [ebp + 12], 0
    push push dword ptr [edi + 16]
    mov mov ecx, ebx
    call sub_10099D0B
L6:
    push push 64
    mov mov esi, eax
    call sub_10065233
    test test eax, eax
    je sub_100A0F81
    imul imul esi, dword ptr [ebp + 12]
    push push dword ptr [ebp - 4]
    mov mov ecx, eax
    push push esi
    push push 2
    call sub_1008357D
    jmp sub_100A0F96
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [edi + 36], eax
    je sub_100A0FE2
    mov mov dword ptr [edi + 28], 23
    jmp sub_100A0FC7
    push push dword ptr [ebp + 12]
    call sub_10082A0C
    test test eax, eax
    mov mov dword ptr [edi + 36], eax
    je sub_100A0FFA
    push push edi
    mov mov ecx, ebx
    call sub_1009A76D
    mov mov eax, edi
    jmp sub_100A1008
    push push 0101152E8h
    push push 0BCDh
    push push dword ptr [ebp - 4]
    push push dword ptr [ebp - 8]
    call sub_100996FB
    add add esp, 16
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
L8:
    ret ret 8
FUN_100a0bdc ENDP
END
