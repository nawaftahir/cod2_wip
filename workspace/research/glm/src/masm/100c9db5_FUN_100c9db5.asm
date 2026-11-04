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
EXTRN sub_100F5FD0:PROC
.CODE
FUN_100c9db5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    mov ebx, ecx
    cmp dword ptr [ebx + 000000158h], 0
    push esi
    jne L0
    push 48
    call sub_100C98D1
    test eax, eax
    jl L2
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebx]
    push 0
    and ecx, 0000007FFh
    or ecx, 0F0000000h
    push 0000F0000h
    push ecx
    mov ecx, ebx
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L2
    mov esi, dword ptr [ebp + 12]
    push dword ptr [esi]
    mov ecx, ebx
    call sub_100C7B94
    test eax, eax
    jl L2
    push dword ptr [esi + 4]
    mov ecx, ebx
    call sub_100C7BA6
    test eax, eax
    jl L2
    push dword ptr [esi + 8]
    mov ecx, ebx
    call sub_100C7BB8
    test eax, eax
    jl L2
    push dword ptr [esi + 12]
    mov ecx, ebx
    call sub_100C7BC6
    test eax, eax
    jl L2
    mov eax, dword ptr [ebx]
    mov ecx, ebx
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L2
    mov ecx, ebx
    call sub_100C4D66
    test eax, eax
    jl L2
    xor eax, eax
    jmp L2
L0:
    push edi
    push dword ptr [ebp + 8]
    lea eax, [ebp - 32]
    push 01011A7D4h
    push eax
    call sub_100F5FD0
    add esp, 12
    xor edi, edi
    inc edi
    push edi
    push dword ptr [ebp + 8]
    lea eax, [ebp - 32]
    lea esi, [ebx + 0000001B4h]
    push eax
    mov ecx, esi
    call sub_1006A84E
    test eax, eax
    jl L1
    lea eax, [ebp - 32]
    push eax
    mov ecx, esi
    call sub_10068CAC
    mov esi, dword ptr [ebp + 12]
    mov dword ptr [eax + 12], edi
    lea edi, [eax + 16]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    inc dword ptr [ebx + 0000001F4h]
    xor eax, eax
L1:
    pop edi
L2:
    pop esi
    pop ebx
    leave
    ret 8
FUN_100c9db5 ENDP
END
