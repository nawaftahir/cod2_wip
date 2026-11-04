.686
.MODEL FLAT, C
EXTRN sub_100C4DC8:PROC
EXTRN sub_100C98C3:PROC
.CODE
FUN_100cac40 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push esi
    push 1
    mov esi, ecx
    call sub_100C98C3
    test eax, eax
    jl L2
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
    jl L2
    push dword ptr [ebp - 20]
    mov eax, dword ptr [esi + 000000100h]
    mov edx, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    push dword ptr [eax + 12]
    mov ecx, esi
    push dword ptr [eax + 16]
    call dword ptr [edx + 0x70]
    test eax, eax
    jl L2
    push dword ptr [ebp - 24]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L2
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L2
    mov eax, dword ptr [esi + 000000100h]
    mov edx, dword ptr [esi]
    lea ecx, [ebp - 16]
    push ecx
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [eax + 12]
    push dword ptr [eax + 8]
    call dword ptr [edx + 0x78]
    test eax, eax
    jl L2
    mov eax, dword ptr [ebp - 4]
    test eax, 00B000000h
    mov ecx, dword ptr [ebp - 16]
    push dword ptr [ebp - 12]
    mov edx, dword ptr [esi]
    je L0
    or ecx, 00C000000h
    and eax, 0F4FFFFFFh
    jmp L1
L0:
    or ecx, 001000000h
L1:
    push ecx
    mov ecx, esi
    push eax
    call dword ptr [edx + 0x68]
    test eax, eax
    jl L2
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L2
    mov ecx, esi
    call sub_100C4DC8
    test eax, eax
    jl L2
    xor eax, eax
L2:
    pop esi
    leave
    ret
FUN_100cac40 ENDP
END
