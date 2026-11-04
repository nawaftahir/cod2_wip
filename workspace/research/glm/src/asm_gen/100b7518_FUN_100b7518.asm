; FUN_100b7518 @ 0x100b7518 — auto-synthesized
    sub_100c99cc PROTO C
    sub_100c9a4b PROTO C
.CODE
FUN_100b7518 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    or edi, dword ptr [ebp + 0xc]
    mov esi, ecx
    push edi
    call sub_100c99cc
    test eax, eax
    jl L0
    test edi, 0x2000
    je L1
    mov eax, dword ptr [esi + 0xc8]
    and eax, 0xffff
    cmp eax, 0x200
    jb L1
    mov eax, dword ptr [ebp + 0x10]
    mov ecx, dword ptr [esi + 0x14]
    mov edx, dword ptr [esi + 0x10]
    shl eax, 2
    mov ecx, dword ptr [ecx + eax]
    mov ecx, dword ptr [ecx + 4]
    mov ecx, dword ptr [edx + ecx*4]
    test byte ptr [ecx + 4], 0x10
    je L2
    mov eax, 0xf0e40800
    jmp L3
    mov ecx, dword ptr [esi + 0x14]
    mov ecx, dword ptr [eax + ecx]
    mov eax, dword ptr [ecx + 0xc]
    mov ecx, dword ptr [ecx + 0x10]
    and eax, 0x7ff
    or eax, 0xb0000000
    sub ecx, 0
    je L3
    dec ecx
    je L4
    dec ecx
    je L5
    dec ecx
    jne L3
    or eax, 0xff0000
    jmp L3
    or eax, 0xaa0000
    jmp L3
    or eax, 0x550000
    push eax
    mov ecx, esi
    call sub_100c9a4b
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 0xc
FUN_100b7518 ENDP
END