.686
.MODEL FLAT, C
EXTRN sub_100C4DFC:PROC
EXTRN sub_100C9900:PROC
.CODE
FUN_100af8a6 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 16
    push ebx
    push esi
    mov esi, ecx
    mov eax, dword ptr [esi + 000000100h]
    mov ebx, dword ptr [eax]
    mov ecx, dword ptr [eax + 8]
    mov edx, dword ptr [esi + 000000100h]
    push edi
    push dword ptr [ebp + 8]
    and ebx, 0000FFFFFh
    mov edi, ebx
    sub edi, dword ptr [eax + 4]
    lea eax, [ecx + ebx*4]
    neg edi
    sbb edi, edi
    and edi, eax
    lea eax, [ebx + ebx]
    cmp eax, dword ptr [edx + 4]
    mov dword ptr [ebp - 12], ecx
    lea ecx, [ecx + ebx*8]
    sbb eax, eax
    and eax, ecx
    mov ecx, esi
    mov dword ptr [ebp - 16], eax
    call sub_100C9900
    test eax, eax
    jl L2
    mov eax, dword ptr [ebp - 12]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [esi + 20]
    mov eax, dword ptr [ecx + eax*4]
    movzx eax, byte ptr [eax + 109]
    mov edx, dword ptr [esi]
    mov dword ptr [ebp + 8], eax
    push 0
    and eax, 0000007FFh
    or eax, 0B0000000h
    push 0000F0000h
    push eax
    mov ecx, esi
    mov dword ptr [ebp - 4], eax
    call dword ptr [edx + 0x64]
    test eax, eax
    jl L2
    test edi, edi
    je L0
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp + 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [edi]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L2
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    push 0000F0000h
    push ebx
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L2
    push dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L2
L0:
    mov edi, dword ptr [ebp - 16]
    test edi, edi
    je L1
    mov edx, dword ptr [esi + 20]
    mov eax, dword ptr [esi]
    lea ecx, [ebp + 8]
    push ecx
    lea ecx, [ebp - 4]
    push ecx
    mov ecx, dword ptr [edi]
    push dword ptr [edx + ecx*4]
    mov ecx, esi
    call dword ptr [eax + 0x74]
    test eax, eax
    jl L2
    mov eax, dword ptr [esi]
    lea ecx, [ebp - 8]
    push ecx
    push 0000F0000h
    push ebx
    push edi
    mov ecx, esi
    call dword ptr [eax + 0x78]
    test eax, eax
    jl L2
    push dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    push dword ptr [ebp - 8]
    mov ecx, esi
    push dword ptr [ebp - 4]
    call dword ptr [eax + 0x68]
    test eax, eax
    jl L2
L1:
    mov eax, dword ptr [esi]
    mov ecx, esi
    call dword ptr [eax + 0x60]
    test eax, eax
    jl L2
    mov ecx, esi
    call sub_100C4DFC
    test eax, eax
    jl L2
    xor eax, eax
L2:
    pop edi
    pop esi
    pop ebx
    leave
    ret 4
FUN_100af8a6 ENDP
END
