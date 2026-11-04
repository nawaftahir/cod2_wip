.686
.MODEL FLAT, C
EXTRN sub_100C4D3E:PROC
EXTRN sub_100C98C2:PROC
.CODE
FUN_100cb5b2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    push 27
    mov esi, ecx
    call sub_100C98C2
    test eax, eax
    jl L1
    mov eax, dword ptr [esi]
    and dword ptr [ebp - 4], 0
    push edi
    push 0
    mov edi, 000E40000h
    push edi
    push 0F0000800h
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
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
    jl L0
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push edi
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
    call sub_100C4D3E
    test eax, eax
    jl L0
    xor eax, eax
L0:
    pop edi
L1:
    pop esi
    leave
    ret
FUN_100cb5b2 ENDP
END
