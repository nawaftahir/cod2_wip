; FUN_100698e2 @ 0x100698e2 — auto-synthesized
    sub_10069860 PROTO C
.CODE
FUN_100698e2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 1
    mov esi, ecx
    call sub_10069860
    test eax, eax
    jl L0
    mov eax, dword ptr [esi + 0x5c]
    mov ecx, dword ptr [esi + 0x58]
    mov edx, dword ptr [ebp + 8]
    mov dword ptr [ecx + eax*4], edx
    inc dword ptr [esi + 0x5c]
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_100698e2 ENDP
END