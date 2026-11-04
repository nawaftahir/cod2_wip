; FUN_100b872e @ 0x100b872e — auto-synthesized
    sub_100c410e PROTO C
.CODE
FUN_100b872e PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 2
    mov esi, ecx
    call sub_100c410e
    test eax, eax
    jl L0
    mov edx, dword ptr [esi + 0x10c]
    lea eax, [esi + 0x110]
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [ebp + 8]
    mov dword ptr [edx + ecx*4], esi
    mov esi, dword ptr [ebp + 0xc]
    mov dword ptr [edx + ecx*4 + 4], esi
    add dword ptr [eax], 2
    xor eax, eax
    pop esi
    pop ebp
    ret 8
FUN_100b872e ENDP
END