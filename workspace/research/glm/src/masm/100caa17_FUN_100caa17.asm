.686
.MODEL FLAT, C
EXTRN sub_100C4DFF:PROC
EXTRN sub_100C9915:PROC
.CODE
FUN_100caa17 PROC
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
    cmp eax, 073000000h
    je L0
    cmp eax, 073900000h
    je L6
    cmp eax, 073A00000h
    je L5
    cmp eax, 073B00000h
    je L4
    cmp eax, 073C00000h
    jne L2
L0:
    push 2
L1:
    pop ecx
L2:
    shl ecx, 16
    or ecx, 41
    push ecx
    mov ecx, esi
    call sub_100C9915
    test eax, eax
    jl L3
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
    jl L3
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
    jl L3
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 12]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L3
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
    jl L3
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
    jl L3
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 12]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L3
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L3
    mov ecx, esi
    call sub_100C4DFF
    test eax, eax
    jl L3
    xor eax, eax
L3:
    pop edi
    pop esi
    pop ebx
    leave
    ret
L4:
    push 5
    jmp L1
L5:
    push 4
    jmp L1
L6:
    push 3
    jmp L1
FUN_100caa17 ENDP
END
