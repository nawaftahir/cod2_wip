.686
.MODEL FLAT, C
EXTRN sub_100C4DFF:PROC
EXTRN sub_100C9915:PROC
.CODE
FUN_100c9f0b PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax]
    push edi
    mov edi, eax
    and eax, 0FFF00000h
    xor ecx, ecx
    and edi, 0000FFFFFh
    cmp eax, 074300000h
    je L2
    cmp eax, 074400000h
    je L1
    cmp eax, 074500000h
    je L2
    cmp eax, 074600000h
    je L0
    cmp eax, 074700000h
    jne L4
    push 3
    jmp L3
L0:
    push 4
    jmp L3
L1:
    push 5
    jmp L3
L2:
    push 2
L3:
    pop ecx
L4:
    shl ecx, 16
    or ecx, 45
    push ecx
    mov ecx, esi
    call sub_100C9915
    test eax, eax
    jl L5
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 12]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L5
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    push 0000F0000h
    push edi
    push dword ptr [ecx + 8]
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L5
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 12]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L5
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 12]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov ebx, edi
    shl ebx, 2
    mov ecx, dword ptr [ebx + ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L5
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    push 0000F0000h
    add ecx, ebx
    push edi
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L5
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 12]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L5
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L5
    mov ecx, esi
    call sub_100C4DFF
    test eax, eax
    jl L5
    xor eax, eax
L5:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100c9f0b ENDP
END
