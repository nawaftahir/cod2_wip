.686
.MODEL FLAT, C
EXTRN sub_100853FB:PROC
EXTRN sub_1008540C:PROC
EXTRN sub_1008541D:PROC
EXTRN sub_1008542E:PROC
EXTRN sub_100C4EE8:PROC
EXTRN sub_100C992A:PROC
.CODE
FUN_100ca0b5 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 44
    push ebx
    push esi
    mov esi, ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov eax, dword ptr [ecx + 12]
    push edi
    mov edi, dword ptr [ecx]
    mov dword ptr [ebp - 40], eax
    lea eax, [ebp - 24]
    push eax
    push 0
    and edi, 0000FFFFFh
    call sub_100853FB
    mov ecx, dword ptr [esi + 000000100h]
    lea eax, [ebp - 20]
    push eax
    push 1
    call sub_1008540C
    mov ecx, dword ptr [esi + 000000100h]
    lea eax, [ebp - 28]
    push eax
    push 2
    call sub_1008541D
    mov ecx, dword ptr [esi + 000000100h]
    lea eax, [ebp - 32]
    push eax
    push 3
    call sub_1008542E
    mov eax, dword ptr [esi + 000000100h]
    mov ebx, dword ptr [eax + 16]
    mov eax, dword ptr [esi]
    push 93
    mov ecx, esi
    call dword ptr [eax + 0x5c]
    push eax
    mov ecx, esi
    call sub_100C992A
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 36]
    push ecx
    lea ecx, [ebp - 44]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [ebx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    test eax, eax
    jl L0
    push dword ptr [ebp - 36]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 16]
    push ecx
    push dword ptr [ebp - 40]
    mov ecx, esi
    push ebx
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L0
    push dword ptr [ebp - 44]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 16]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [ebp - 20]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, esi
    push edi
    push dword ptr [ebp - 20]
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L0
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [ebp - 24]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, esi
    push edi
    push dword ptr [ebp - 24]
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L0
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [ebp - 28]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, esi
    push edi
    push dword ptr [ebp - 28]
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L0
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [ebp - 32]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, esi
    push edi
    push dword ptr [ebp - 32]
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L0
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L0
    mov ecx, esi
    call sub_100C4EE8
    test eax, eax
    jl L0
    xor eax, eax
L0:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100ca0b5 ENDP
END
