.686
.MODEL FLAT, C
EXTRN sub_100C4DB1:PROC
EXTRN sub_100C4E0A:PROC
EXTRN sub_100C98EC:PROC
EXTRN sub_100C99A9:PROC
.CODE
FUN_100afb98 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    push edi
    mov edi, dword ptr [eax]
    mov eax, dword ptr [esi + 0000000C8h]
    and edi, 0000FFFFFh
    and eax, 00000FFFFh
    cmp eax, 000000104h
    mov dword ptr [ebp - 8], edi
    push 66
    jne L0
    call sub_100C98EC
    xor ebx, ebx
    cmp eax, ebx
    jl L2
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    push ebx
    push ebx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    cmp eax, ebx
    jl L2
    mov eax, dword ptr [esi]
    push ebx
    mov ebx, 0000F0000h
    push ebx
    push dword ptr [ebp - 4]
    mov ecx, esi
    call dword ptr [eax + 0x64]
    test eax, eax
    jl L2
    mov eax, dword ptr [esi + 000000100h]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [esi + 20]
    lea ecx, [ebp - 12]
    push ecx
    lea edi, [eax + edi*4]
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [edi]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L2
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 16]
    push ecx
    push ebx
    push dword ptr [ebp - 8]
    mov ecx, esi
    push edi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L2
    push dword ptr [ebp - 12]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 16]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L2
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L2
    mov ecx, esi
    call sub_100C4DB1
    test eax, eax
    jge L1
    jmp L2
L0:
    call sub_100C99A9
    xor edi, edi
    cmp eax, edi
    jl L2
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    push edi
    push edi
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [esi + 000000100h]
    mov ecx, dword ptr [ecx + 16]
    mov ecx, dword ptr [ecx]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x6c]
    cmp eax, edi
    jl L2
    mov eax, dword ptr [esi]
    push edi
    push 0000F0000h
    push dword ptr [ebp - 4]
    mov ecx, esi
    call dword ptr [eax + 0x64]
    cmp eax, edi
    jl L2
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    cmp eax, edi
    jl L2
    mov ecx, esi
    call sub_100C4E0A
    cmp eax, edi
    jl L2
L1:
    xor eax, eax
L2:
    pop edi
    pop esi
    pop ebx
    leave
    ret
FUN_100afb98 ENDP
END
