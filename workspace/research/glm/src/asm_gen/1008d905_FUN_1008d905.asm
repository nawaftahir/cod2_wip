; FUN_1008d905 @ 0x1008d905 — auto-synthesized
    sub_1008d8a4 PROTO C
.CODE
FUN_1008d905 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    mov edx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax + edx*4]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    mov edi, dword ptr [eax + edi*4]
    push edi
    push esi
    mov dword ptr [edi + 0x30], edx
    call sub_1008d8a4
    test eax, eax
    jl L0
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [edi]
    push ebx
    mov ebx, 0xe000000
    mov edx, ecx
    and edx, ebx
    and eax, ebx
    and ecx, 0xf1ffffff
    cmp edx, eax
    mov dword ptr [esi], ecx
    pop ebx
    jbe L1
    mov eax, edx
    or ecx, eax
    cmp dword ptr [esi + 0x60], 0
    mov dword ptr [esi], ecx
    jne L2
    mov eax, dword ptr [edi + 0x60]
    mov dword ptr [esi + 0x60], eax
    mov eax, dword ptr [edi + 0x64]
    mov dword ptr [esi + 0x64], eax
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 8
FUN_1008d905 ENDP
END