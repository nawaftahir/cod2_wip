.686
.MODEL FLAT, C
EXTRN sub_100C4DBC:PROC
EXTRN sub_100C98F6:PROC
EXTRN sub_100C99B9:PROC
.CODE
FUN_100afce9 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ebx, dword ptr [eax]
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    push edi
    mov edi, dword ptr [ecx + eax*4]
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    and ebx, 0000FFFFFh
    cmp eax, 000000104h
    mov ecx, esi
    push 64
    jne L2
    call sub_100C98F6
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    push 0
    lea ecx, [ebp - 4]
    push ecx
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    test eax, eax
    jl L1
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    push ebx
    push dword ptr [ecx + 16]
    mov ecx, esi
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    push 0
    push 000070000h
    push dword ptr [ebp - 4]
    mov ecx, esi
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L1
    mov eax, dword ptr [esi + 000000100h]
    mov edi, dword ptr [eax + 8]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 16]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [edi]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 20]
    push ecx
    push dword ptr [ebp - 12]
    mov ecx, esi
    push ebx
    push edi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L1
    push dword ptr [ebp - 16]
    mov eax, dword ptr [esi]
    push 000E40000h
    push dword ptr [ebp - 4]
    mov ecx, esi
    call dword ptr [eax + 0x68]
L0:
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L1
    mov ecx, esi
    call sub_100C4DBC
    test eax, eax
    jl L1
    xor eax, eax
L1:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L2:
    call sub_100C99B9
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    push 0
    lea ecx, [ebp - 4]
    push ecx
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    test eax, eax
    jl L1
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    push ebx
    push dword ptr [ecx + 16]
    mov ecx, esi
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    push 0
    push 0000F0000h
    push dword ptr [ebp - 4]
    mov ecx, esi
    call dword ptr [eax + 0x64]
    jmp L0
FUN_100afce9 ENDP
END
