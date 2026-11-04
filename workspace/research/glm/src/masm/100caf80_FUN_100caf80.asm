.686
.MODEL FLAT, C
EXTRN sub_100C4DF7:PROC
EXTRN sub_100C98DB:PROC
.CODE
FUN_100caf80 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    push edi
    mov edi, dword ptr [eax]
    mov eax, dword ptr [esi]
    push 4
    and edi, 0000FFFFFh
    call dword ptr [eax + 0x5c]
    push eax
    mov ecx, esi
    call sub_100C98DB
    test eax, eax
    jl L3
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 20]
    push ecx
    lea ecx, [ebp - 24]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    test eax, eax
    jl L3
    push dword ptr [ebp - 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    push edi
    push dword ptr [ecx + 16]
    mov ecx, esi
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L3
    push dword ptr [ebp - 24]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp - 8]
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L3
    and dword ptr [ebp - 4], 0
L0:
    mov ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [esi + 000000100h]
    imul ecx, edi
    cmp dword ptr [ebp - 4], 1
    mov edx, dword ptr [eax + 8]
    lea ebx, [edx + ecx*4]
    jne L1
    mov eax, dword ptr [eax]
    and eax, 0FFF00000h
    cmp eax, 070400000h
    jne L1
    mov dword ptr [ebp - 16], 001000000h
    jmp L2
L1:
    and dword ptr [ebp - 16], 0
L2:
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 28]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    mov ecx, dword ptr [ebx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L3
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 32]
    push ecx
    push dword ptr [ebp - 12]
    mov ecx, esi
    push edi
    push ebx
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L3
    push dword ptr [ebp - 28]
    mov eax, dword ptr [ebp - 16]
    push dword ptr [ebp - 32]
    xor eax, dword ptr [ebp - 8]
    mov edx, dword ptr [esi]
    push eax
    mov ecx, esi
    call dword ptr [edx + 0x68]
    test eax, eax
    jl L3
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 3
    jb L0
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_100C4DF7
    test eax, eax
    jl L3
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100caf80 ENDP
END
