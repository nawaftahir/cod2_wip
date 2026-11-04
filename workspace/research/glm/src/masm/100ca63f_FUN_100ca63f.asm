.686
.MODEL FLAT, C
EXTRN sub_100C4E33:PROC
EXTRN sub_100C9926:PROC
.CODE
FUN_100ca63f PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 20
    push esi
    mov esi, ecx
    xor ecx, ecx
    cmp dword ptr [esi + 52], ecx
    jne L0
    mov eax, 080004001h
    jmp L8
L0:
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax]
    push ebx
    push edi
    mov edi, eax
    and eax, 0FFF00000h
    mov ebx, 010F00000h
    and edi, 0000FFFFFh
    cmp eax, ebx
    je L3
    cmp eax, 073500000h
    je L2
    cmp eax, 073600000h
    je L1
    cmp eax, 073700000h
    je L3
    cmp eax, 073800000h
    jne L5
    push 2
    jmp L4
L1:
    push 4
    jmp L4
L2:
    push 3
    jmp L4
L3:
    push 5
L4:
    pop ecx
L5:
    shl ecx, 16
    or ecx, 94
    push ecx
    mov ecx, esi
    call sub_100C9926
    test eax, eax
    jl L7
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 20]
    push ecx
    push 0
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
    lea ecx, [ebp - 16]
    push ecx
    push dword ptr [eax + 12]
    mov ecx, esi
    push dword ptr [eax + 16]
    call dword ptr [edx + 0x70]
    test eax, eax
    jl L7
    mov eax, dword ptr [esi]
    push 0
    push dword ptr [ebp - 16]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L7
    mov eax, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [eax]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esi]
    and ecx, 0FFF00000h
    cmp ecx, ebx
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 20]
    push dword ptr [ecx + eax*4]
    mov ecx, esi
    jne L9
    call dword ptr [edx + 0x74]
    test eax, eax
    jl L7
    mov eax, dword ptr [esi + 000000100h]
    mov edx, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, esi
    push dword ptr [eax + 12]
    push dword ptr [eax + 8]
    call dword ptr [edx + 0x78]
    test eax, eax
    jl L7
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L7
    mov ecx, dword ptr [ebp - 12]
    push dword ptr [ebp - 8]
    xor ecx, 001000000h
    push ecx
L6:
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L7
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L7
    mov ecx, esi
    call sub_100C4E33
    test eax, eax
    jl L7
    xor eax, eax
L7:
    pop edi
    pop ebx
L8:
    pop esi
    leave
    ret
L9:
    call dword ptr [edx + 0x74]
    test eax, eax
    jl L7
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, dword ptr [esi + 000000100h]
    push edi
    push dword ptr [ecx + 8]
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L7
    push dword ptr [ebp - 8]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L7
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    lea ecx, [ebp - 4]
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
    jl L7
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [ebp - 16]
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 8]
    add ecx, ebx
    push edi
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L7
    push dword ptr [ebp - 8]
    push dword ptr [ebp - 12]
    jmp L6
FUN_100ca63f ENDP
END
