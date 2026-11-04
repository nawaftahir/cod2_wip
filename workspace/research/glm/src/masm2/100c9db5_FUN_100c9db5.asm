.686
.MODEL FLAT, C
EXTRN sub_10068CAC:PROC
EXTRN sub_1006A84E:PROC
EXTRN sub_100C4D66:PROC
EXTRN sub_100C7B94:PROC
EXTRN sub_100C7BA6:PROC
EXTRN sub_100C7BB8:PROC
EXTRN sub_100C7BC6:PROC
EXTRN sub_100C98D1:PROC
EXTRN sub_100C9ED9:PROC
EXTRN sub_100C9EFF:PROC
EXTRN sub_100C9F13:PROC
EXTRN sub_100C9F25:PROC
EXTRN sub_100C9F33:PROC
EXTRN sub_100C9F41:PROC
EXTRN sub_100C9F4C:PROC
EXTRN sub_100C9F57:PROC
EXTRN sub_100C9F5B:PROC
EXTRN sub_100C9F8B:PROC
EXTRN sub_100F5FD0:PROC
.CODE
FUN_100c9db5 PROC
    mov mov edi, edi
    push push ebp
    mov mov ebp, esp
    sub sub esp, 32
    push push ebx
    mov mov ebx, ecx
    cmp cmp dword ptr [ebx + 0158h], 0
    push push esi
    jne L0
    push push 48
    call sub_100C98D1
    test test eax, eax
    jl sub_100C9ED9
    mov mov ecx, dword ptr [ebp + 8]
    mov mov eax, dword ptr [ebx]
    push push 0
    and and ecx, 07FFh
    or or ecx, 0F0000000h
    push push 0F0000h
    push push ecx
    mov mov ecx, ebx
    call call dword ptr [eax + 100]
    test test eax, eax
    jl sub_100C9EFF
    mov mov esi, dword ptr [ebp + 12]
    push push dword ptr [esi]
    mov mov ecx, ebx
    call sub_100C7B94
    test test eax, eax
    jl sub_100C9F13
    push push dword ptr [esi + 4]
    mov mov ecx, ebx
    call sub_100C7BA6
    test test eax, eax
    jl sub_100C9F25
    push push dword ptr [esi + 8]
    mov mov ecx, ebx
    call sub_100C7BB8
    test test eax, eax
    jl sub_100C9F33
    push push dword ptr [esi + 12]
    mov mov ecx, ebx
    call sub_100C7BC6
    test test eax, eax
    jl sub_100C9F41
    mov mov eax, dword ptr [ebx]
    mov mov ecx, ebx
    call call dword ptr [eax + 96]
    test test eax, eax
    jl sub_100C9F4C
    mov mov ecx, ebx
    call sub_100C4D66
    test test eax, eax
    jl sub_100C9F57
    xor xor eax, eax
    jmp sub_100C9F5B
    push push edi
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 32]
    push push 01011A7D4h
    push push eax
    call sub_100F5FD0
    add add esp, 12
    xor xor edi, edi
    inc inc edi
    push push edi
L0:
    push push dword ptr [ebp + 8]
    lea lea eax, [ebp - 32]
    lea lea esi, [ebx + 01B4h]
    push push eax
    mov mov ecx, esi
    call sub_1006A84E
    test test eax, eax
    jl sub_100C9F8B
    lea lea eax, [ebp - 32]
    push push eax
    mov mov ecx, esi
    call sub_10068CAC
    mov mov esi, dword ptr [ebp + 12]
    mov mov dword ptr [eax + 12], edi
    lea lea edi, [eax + 16]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    movsd movsd dword ptr es:[edi], dword ptr [esi]
    inc inc dword ptr [ebx + 01F4h]
    xor xor eax, eax
    pop pop edi
    pop pop esi
    pop pop ebx
    leave leave
    ret ret 8
FUN_100c9db5 ENDP
END
