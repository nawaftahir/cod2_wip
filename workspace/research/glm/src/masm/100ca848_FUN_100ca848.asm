.686
.MODEL FLAT, C
EXTRN sub_100C4E78:PROC
EXTRN sub_100C9938:PROC
.CODE
FUN_100ca848 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 28
    push esi
    mov esi, ecx
    xor ecx, ecx
    cmp dword ptr [esi + 52], ecx
    jne L0
    mov eax, 080004001h
    jmp L10
L0:
    mov eax, dword ptr [esi + 000000100h]
    cmp dword ptr [eax + 12], ecx
    jne L1
    xor eax, eax
    jmp L10
L1:
    mov eax, dword ptr [eax + 16]
    mov eax, dword ptr [eax]
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [edx + eax*4]
    push ebx
    mov dword ptr [ebp - 28], eax
    mov dword ptr [ebp - 4], ecx
    push edi
L2:
    mov ecx, dword ptr [esi + 000000100h]
    mov edx, dword ptr [ecx + 12]
    imul edx, dword ptr [ebp - 4]
    mov ecx, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx + edx*4]
    mov edx, dword ptr [esi + 20]
    mov edi, dword ptr [edx + ecx*4]
    mov ecx, dword ptr [edi + 4]
    cmp ecx, dword ptr [eax + 4]
    jne L3
    mov ecx, dword ptr [edi + 8]
    cmp ecx, dword ptr [eax + 8]
    jne L3
    mov ecx, dword ptr [edi + 12]
    cmp ecx, dword ptr [eax + 12]
    jne L3
    mov ecx, dword ptr [edi + 16]
    cmp ecx, dword ptr [eax + 16]
    je L8
L3:
    push 1
    mov ecx, esi
    call sub_100C9938
    test eax, eax
    jl L9
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [edi + 20]
    mov eax, dword ptr [ecx + eax*4]
    mov ebx, dword ptr [eax + 12]
    mov eax, dword ptr [eax + 16]
    and ebx, 0000007FFh
    xor ecx, ecx
    or ebx, 0B0001000h
    sub eax, ecx
    je L6
    dec eax
    je L5
    dec eax
    je L4
    dec eax
    jne L6
    or ebx, 000FF0000h
    jmp L6
L4:
    or ebx, 000AA0000h
    jmp L6
L5:
    or ebx, 000550000h
L6:
    cmp dword ptr [edi + 24], ecx
    jne L7
    or ebx, 00D000000h
L7:
    mov eax, dword ptr [esi]
    lea edx, [ebp - 16]
    push edx
    mov edx, dword ptr [esi + 20]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    test eax, eax
    jl L9
    push dword ptr [ebp - 16]
    mov eax, dword ptr [esi + 000000100h]
    mov edx, dword ptr [esi]
    lea ecx, [ebp - 12]
    push ecx
    push dword ptr [eax + 12]
    mov ecx, esi
    push dword ptr [eax + 16]
    call dword ptr [edx + 0x70]
    test eax, eax
    jl L9
    mov eax, dword ptr [esi]
    push ebx
    push dword ptr [ebp - 12]
    mov ecx, esi
    push dword ptr [ebp - 8]
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L9
    mov eax, dword ptr [esi + 000000100h]
    mov edx, dword ptr [esi]
    lea ecx, [ebp - 20]
    push ecx
    lea ecx, [ebp - 8]
    push ecx
    mov ecx, dword ptr [eax + 12]
    imul ecx, dword ptr [ebp - 4]
    mov eax, dword ptr [eax + 8]
    mov eax, dword ptr [eax + ecx*4]
    mov ecx, dword ptr [esi + 20]
    push dword ptr [ecx + eax*4]
    mov ecx, esi
    call dword ptr [edx + 0x74]
    test eax, eax
    jl L9
    mov ecx, dword ptr [esi + 000000100h]
    mov eax, dword ptr [ecx + 12]
    mov ecx, dword ptr [ecx + 8]
    mov edx, dword ptr [esi]
    lea edi, [ebp - 24]
    push edi
    push dword ptr [ebp - 12]
    push eax
    imul eax, dword ptr [ebp - 4]
    lea eax, [ecx + eax*4]
    push eax
    mov ecx, esi
    call dword ptr [edx + 0x78]
    test eax, eax
    jl L9
    push dword ptr [ebp - 20]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 24]
    mov ecx, esi
    push dword ptr [ebp - 8]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L9
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L9
    mov ecx, esi
    call sub_100C4E78
    test eax, eax
    jl L9
    mov eax, dword ptr [ebp - 28]
L8:
    inc dword ptr [ebp - 4]
    cmp dword ptr [ebp - 4], 2
    jb L2
    xor eax, eax
L9:
    pop edi
    pop ebx
L10:
    pop esi
    leave
    ret
FUN_100ca848 ENDP
END
