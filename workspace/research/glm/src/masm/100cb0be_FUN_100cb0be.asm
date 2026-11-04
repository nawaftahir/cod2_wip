.686
.MODEL FLAT, C
EXTRN sub_100C4E6B:PROC
EXTRN sub_100C9909:PROC
.CODE
FUN_100cb0be PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 24
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax]
    mov ebx, ecx
    mov eax, 0000FFFFFh
    and ebx, eax
    sub ecx, 070500003h
    push edi
    je L3
    sub ecx, 000100000h
    je L2
    dec ecx
    je L1
    sub ecx, eax
    je L0
    dec ecx
    jne L5
    push 20
    jmp L4
L0:
    push 22
    jmp L4
L1:
    push 21
    jmp L4
L2:
    push 23
    jmp L4
L3:
    push 24
L4:
    pop eax
    jmp L6
L5:
    mov eax, dword ptr [ebp - 24]
L6:
    push eax
    mov ecx, esi
    call sub_100C9909
    test eax, eax
    jl L7
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
    jl L7
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
    jl L7
    push dword ptr [ebp - 24]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L7
    mov edx, dword ptr [esi + 20]
    xor eax, eax
    cmp ebx, 3
    setne al
    lea ecx, [ebp - 12]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    dec eax
    and eax, 0FFF80000h
    add eax, 0000F0000h
    mov dword ptr [ebp - 8], eax
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L7
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 16]
    push ecx
    push dword ptr [ebp - 8]
    mov ecx, dword ptr [esi + 000000100h]
    push ebx
    push dword ptr [ecx + 8]
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L7
    push dword ptr [ebp - 12]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 16]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L7
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    mov edi, ebx
    shl edi, 2
    mov ecx, dword ptr [edi + ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L7
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 16]
    push ecx
    push dword ptr [ebp - 8]
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    add ecx, edi
    push ebx
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L7
    push dword ptr [ebp - 12]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 16]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L7
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L7
    mov ecx, esi
    call sub_100C4E6B
    test eax, eax
    jl L7
    xor eax, eax
L7:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100cb0be ENDP
END
