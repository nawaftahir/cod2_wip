.686
.MODEL FLAT, C
EXTRN sub_100C4DD4:PROC
EXTRN sub_100C98DB:PROC
.CODE
FUN_100cadbf PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 32
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ebx, dword ptr [eax]
    mov eax, dword ptr [esi]
    push edi
    push 18
    and ebx, 0000FFFFFh
    call dword ptr [eax + 0x5c]
    push eax
    mov ecx, esi
    call sub_100C98DB
    test eax, eax
    jl L1
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 20]
    push ecx
    lea ecx, [ebp - 24]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    test eax, eax
    jl L1
    push dword ptr [ebp - 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 16]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    push ebx
    push dword ptr [ecx + 16]
    mov ecx, esi
    call dword ptr [eax + 0x70]
    test eax, eax
    jl L1
    push dword ptr [ebp - 24]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 16]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L1
    and dword ptr [ebp - 12], 0
    and dword ptr [ebp - 8], 0
L0:
    mov eax, dword ptr [esi + 000000100h]
    mov edi, dword ptr [eax + 8]
    add edi, dword ptr [ebp - 8]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 28]
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
    lea ecx, [ebp - 32]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, esi
    push ebx
    push edi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L1
    push dword ptr [ebp - 28]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 32]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L1
    inc dword ptr [ebp - 12]
    mov eax, ebx
    shl eax, 2
    add dword ptr [ebp - 8], eax
    cmp dword ptr [ebp - 12], 3
    jb L0
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L1
    mov ecx, esi
    call sub_100C4DD4
    test eax, eax
    jl L1
    xor eax, eax
L1:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100cadbf ENDP
END
