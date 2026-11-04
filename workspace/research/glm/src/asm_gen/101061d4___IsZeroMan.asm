; __IsZeroMan @ 0x101061d4 — auto-synthesized
.CODE
__IsZeroMan PROC
    xor eax, eax
    mov ecx, dword ptr [esp + 4]
    cmp dword ptr [ecx + eax*4], 0
    jne L0
    inc eax
    cmp eax, 3
    jl L1
    xor eax, eax
    inc eax
    ret
    xor eax, eax
    ret
__IsZeroMan ENDP
END