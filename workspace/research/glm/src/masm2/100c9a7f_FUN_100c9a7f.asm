.686
.MODEL FLAT, C
EXTRN sub_100C4EB0:PROC
EXTRN sub_100C98CE:PROC
EXTRN sub_100C9C8E:PROC
EXTRN sub_100C9C97:PROC
EXTRN sub_100C9CBD:PROC
EXTRN sub_100C9CD7:PROC
EXTRN sub_100C9CFD:PROC
EXTRN sub_100C9D42:PROC
EXTRN sub_100C9D6D:PROC
EXTRN sub_100C9D87:PROC
EXTRN sub_100C9DA3:PROC
EXTRN sub_100C9DC9:PROC
EXTRN sub_100C9DE3:PROC
EXTRN sub_100C9DEA:PROC
EXTRN sub_100C9DFB:PROC
EXTRN sub_100C9E1D:PROC
EXTRN sub_100C9E33:PROC
EXTRN sub_100C9E4B:PROC
EXTRN sub_100C9E56:PROC
EXTRN sub_100C9E61:PROC
.CODE
FUN_100c9a7f PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 20
    push push ebx
    mov mov ebx, dword ptr [ebp + 8]
    push push esi
    mov mov esi, ecx
    mov mov eax, dword ptr [esi]
    push push ebx
    call call dword ptr [eax + 92]
    push push eax
    mov mov ecx, esi
    call sub_100C98CE
    test test eax, eax
    jl sub_100C9C97
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    push push edi
    mov mov edi, dword ptr [ebp + 12]
    lea lea ecx, [ebp - 16]
    push push ecx
    lea lea ecx, [ebp - 20]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 108]
    test test eax, eax
    jl sub_100C9CBD
    push push dword ptr [ebp - 16]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp + 8]
    push push ecx
    push push dword ptr [ebp + 16]
    mov mov ecx, esi
    push push edi
    call call dword ptr [eax + 112]
    test test eax, eax
    jl sub_100C9CD7
    mov mov ecx, dword ptr [ebp + 48]
    push push dword ptr [ebp - 20]
    mov mov eax, dword ptr [esi]
    push push dword ptr [ebp + 8]
    neg neg ecx
    sbb sbb ecx, ecx
    and and ecx, 0400000h
    or or ecx, dword ptr [ebp - 4]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100C9CFD
    cmp cmp ebx, 8
    jne L0
    mov mov dword ptr [ebp + 8], 070000h
    jmp L4
    cmp cmp ebx, 9
    je L3
    cmp cmp ebx, 90
    jne L1
    mov mov dword ptr [ebp + 8], 030000h
    jmp L8
    cmp cmp ebx, 6
    jne L2
    mov mov dword ptr [ebp + 8], 010000h
    jmp L9
    cmp cmp ebx, 14
    je L5
    cmp cmp ebx, 15
    je L6
    cmp cmp ebx, 7
    je L7
    cmp cmp ebx, 37
    jne L10
    mov mov dword ptr [ebp + 8], 0F0000h
    mov mov edi, dword ptr [ebp + 20]
    test test edi, edi
    je sub_100C9C8E
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100C9D6D
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    push push dword ptr [ebp + 32]
    push push edi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100C9D87
    push push dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    xor xor ecx, dword ptr [ebp + 36]
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100C9DA3
    mov mov edi, dword ptr [ebp + 24]
    test test edi, edi
    je sub_100C9D42
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100C9DC9
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    push push dword ptr [ebp + 32]
    push push edi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100C9DE3
L5:
    push push dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    xor xor ecx, dword ptr [ebp + 40]
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi]
    push push ecx
    mov mov ecx, esi
L8:
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100C9DFB
    mov mov edi, dword ptr [ebp + 28]
    test test edi, edi
    je sub_100C9DEA
L9:
    mov mov edx, dword ptr [esi + 20]
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 8]
    push push ecx
    lea lea ecx, [ebp - 4]
    push push ecx
    mov mov ecx, dword ptr [edi]
    push push dword ptr [edx + ecx*4]
    mov mov ecx, esi
L10:
    call call dword ptr [eax + 116]
    test test eax, eax
    jl sub_100C9E1D
    mov mov eax, dword ptr [esi]
    lea lea ecx, [ebp - 12]
    push push ecx
    push push dword ptr [ebp + 8]
    mov mov ecx, esi
    push push dword ptr [ebp + 32]
    push push edi
    call call dword ptr [eax + 120]
    test test eax, eax
    jl sub_100C9E33
    push push dword ptr [ebp - 8]
    mov mov ecx, dword ptr [ebp - 4]
    xor xor ecx, dword ptr [ebp + 44]
    push push dword ptr [ebp - 12]
    mov mov eax, dword ptr [esi]
    push push ecx
    mov mov ecx, esi
    call call dword ptr [eax + 104]
    test test eax, eax
    jl sub_100C9E4B
    mov mov eax, dword ptr [esi]
    mov mov ecx, esi
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100C9E56
    mov mov ecx, esi
    call sub_100C4EB0
    test test eax, eax
    jl sub_100C9E61
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 44
FUN_100c9a7f ENDP
END
