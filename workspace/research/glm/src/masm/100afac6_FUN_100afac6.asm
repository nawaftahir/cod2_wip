.686
.MODEL FLAT, C
EXTRN sub_100C4D8B:PROC
EXTRN sub_100C98D3:PROC
.CODE
FUN_100afac6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    push edi
    mov edi, dword ptr [eax]
    push 66
    and edi, 0000FFFFFh
    call sub_100C98D3
    xor ebx, ebx
    cmp eax, ebx
    jl L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    push ebx
    push ebx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    cmp eax, ebx
    jl L0
    mov eax, dword ptr [esi]
    push ebx
    push 0000F0000h
    push dword ptr [ebp - 4]
    mov ecx, esi
    call dword ptr [eax + 0x64]
    cmp eax, ebx
    jl L0
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [esi + 20]
    lea ecx, [ebp - 8]
    push ecx
    lea ebx, [eax + edi*4]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [ebx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push 0000F0000h
    push edi
    push ebx
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L0
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push 00AF40000h
    push dword ptr [ebp - 4]
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L0
    mov ecx, esi
    call sub_100C4D8B
    test eax, eax
    jl L0
    xor eax, eax
L0:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100afac6 ENDP
END
