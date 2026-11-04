.686
.MODEL FLAT, C
EXTRN sub_1008B0F5:PROC
EXTRN sub_100C4DB1:PROC
EXTRN sub_100C9931:PROC
.CODE
FUN_100b7415 PROC
L0:
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 12
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 20]
    mov ecx, dword ptr [ebp + 8]
    mov ebx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [esi + 0000000C8h]
    and eax, 00000FFFFh
    cmp eax, 000000100h
    ja L1
    mov eax, dword ptr [esi + 000000100h]
    push 010115CD0h
    push 00000119Fh
    push dword ptr [eax + 60]
    push esi
    call sub_1008B0F5
    add esp, 16
    mov eax, 080004001h
    jmp L5
L1:
    mov eax, dword ptr [ebx + 8]
    cmp eax, -1
    je L2
    push eax
    mov ecx, esi
    call L0
    test eax, eax
    jl L5
L2:
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [esi + 000000138h], eax
    jne L3
    xor eax, eax
    jmp L5
L3:
    push 1
    mov ecx, esi
    call sub_100C9931
    test eax, eax
    jl L5
    mov eax, dword ptr [esi]
    push edi
    push 0
    mov edi, 000010000h
    push edi
    push 0B0000000h
    mov ecx, esi
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L4
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    lea ecx, [ebp - 12]
    push ecx
    push ebx
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L4
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    push edi
    push 1
    lea ecx, [ebp + 8]
    push ecx
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L4
    push dword ptr [ebp - 4]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 12]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L4
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L4
    mov ecx, esi
    call sub_100C4DB1
    test eax, eax
    jl L4
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 000000138h], eax
    xor eax, eax
L4:
    pop edi
L5:
    pop esi
    pop ebx
    leave
    ret 4
FUN_100b7415 ENDP
END
