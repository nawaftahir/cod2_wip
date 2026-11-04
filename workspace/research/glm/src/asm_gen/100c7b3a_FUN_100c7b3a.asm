; FUN_100c7b3a @ 0x100c7b3a — auto-synthesized
    sub_100c410e PROTO C
.CODE
FUN_100c7b3a PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 1
    mov esi, ecx
    call sub_100c410e
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 0x10c]
    lea eax, [esi + 0x110]
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [edx + ecx*4], esi
    inc dword ptr [eax]
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_100c7b3a ENDP
END