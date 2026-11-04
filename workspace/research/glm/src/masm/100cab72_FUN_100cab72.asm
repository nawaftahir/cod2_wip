.686
.MODEL FLAT, C
EXTRN sub_100C4D33:PROC
EXTRN sub_100C98C2:PROC
.CODE
FUN_100cab72 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push esi
    push 40
    mov esi, ecx
    call sub_100C98C2
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L0
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    neg ecx
    sbb ecx, ecx
    and ecx, 00D000000h
    or ecx, dword ptr [ebp - 8]
    push 000E40000h
    push ecx
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
    call sub_100C4D33
    test eax, eax
    jl L0
    xor eax, eax
L0:
    pop esi
    leave
    ret 4
FUN_100cab72 ENDP
END
