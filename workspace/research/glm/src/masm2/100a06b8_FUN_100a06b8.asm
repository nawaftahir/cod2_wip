.686
.MODEL FLAT, C
EXTRN sub_100650CB:PROC
EXTRN sub_1006511C:PROC
EXTRN sub_10065141:PROC
EXTRN sub_10082934:PROC
EXTRN sub_100832C7:PROC
EXTRN sub_1008343C:PROC
EXTRN sub_1009A677:PROC
EXTRN sub_1009EEA6:PROC
EXTRN sub_100A07F5:PROC
EXTRN sub_100A07FF:PROC
EXTRN sub_100A080F:PROC
EXTRN sub_100A0821:PROC
EXTRN sub_100A082E:PROC
EXTRN sub_100A0842:PROC
EXTRN sub_100A084B:PROC
EXTRN sub_100A085F:PROC
EXTRN sub_100A0865:PROC
EXTRN sub_100A0876:PROC
EXTRN sub_100A0888:PROC
EXTRN sub_100A0895:PROC
EXTRN sub_100A08BB:PROC
EXTRN sub_100A08DE:PROC
EXTRN sub_100A0900:PROC
EXTRN sub_100F78A2:PROC
EXTRN sub_100F7982:PROC
.CODE
FUN_100a06b8 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 16
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    push push edi
    xor xor edi, edi
    cmp cmp esi, edi
    mov mov dword ptr [ebp - 16], ecx
    je sub_100A07F5
    cmp cmp dword ptr [esi + 4], 13
    jne sub_100A07FF
    mov mov eax, dword ptr [esi + 24]
    imul imul eax, dword ptr [esi + 20]
    mov mov dword ptr [ebp - 8], eax
    shl shl eax, 4
    push push ebx
    push push eax
    call sub_100F78A2
    cmp cmp eax, edi
    pop pop ecx
    mov mov dword ptr [ebp - 12], eax
    je sub_100A080F
    mov mov ecx, dword ptr [ebp - 16]
    push push eax
    push push esi
    call sub_1009EEA6
    test test eax, eax
    jl sub_100A0821
    push push 80
    call sub_100650CB
    cmp cmp eax, edi
    je L0
    lea lea ecx, [esi + 48]
    push push ecx
    push push 1
    push push edi
    push push edi
    push push edi
    push push edi
    mov mov ecx, eax
    call sub_100832C7
    mov mov ebx, eax
    jmp L1
    xor xor ebx, ebx
    cmp cmp ebx, edi
    je sub_100A084B
    cmp cmp dword ptr [esi + 16], edi
    je L2
    mov mov ecx, dword ptr [esi + 16]
    mov mov eax, dword ptr [ecx]
    call call dword ptr [eax + 4]
    cmp cmp eax, edi
    mov mov dword ptr [ebx + 16], eax
    je sub_100A085F
    and and dword ptr [ebp - 4], 0
    cmp cmp dword ptr [ebp - 8], 0
    lea lea edi, [ebx + 32]
    jbe sub_100A085F
    mov mov eax, dword ptr [ebp - 12]
    mov mov dword ptr [ebp + 8], eax
    push push 20
    call sub_1006511C
    test test eax, eax
    je sub_100A082E
    push push 010114AE8h
    push push 0
    push push 0
    mov mov ecx, eax
    call sub_10082934
    jmp sub_100A0842
    xor xor eax, eax
    test test eax, eax
    mov mov dword ptr [edi], eax
    je sub_100A0895
    push push 64
    call sub_10065141
    test test eax, eax
    je sub_100A0876
L0:
    lea lea ecx, [esi + 48]
    push push ecx
    push push dword ptr [ebp + 8]
    mov mov ecx, eax
    call sub_1008343C
    jmp sub_100A0888
    xor xor eax, eax
    test test eax, eax
    mov mov ecx, dword ptr [edi]
    mov mov dword ptr [ecx + 8], eax
    je sub_100A08BB
    mov mov edi, dword ptr [edi]
    add add dword ptr [ebp + 8], 16
    add add edi, 12
    inc inc dword ptr [ebp - 4]
    mov mov eax, dword ptr [ebp - 4]
    cmp cmp eax, dword ptr [ebp - 8]
    jb sub_100A0865
    mov mov ecx, dword ptr [ebp - 16]
    push push ebx
    call sub_1009A677
    jmp sub_100A08DE
    xor xor edi, edi
    xor xor ebx, ebx
    push push dword ptr [ebp - 12]
    call sub_100F7982
    pop pop ecx
    mov mov eax, ebx
    pop pop ebx
    jmp sub_100A0900
    xor xor eax, eax
    pop pop edi
    pop pop esi
    leave leave
    ret ret 4
FUN_100a06b8 ENDP
END
