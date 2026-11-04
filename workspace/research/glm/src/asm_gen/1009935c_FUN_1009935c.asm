; FUN_1009935c @ 0x1009935c — auto-synthesized
    sub_10098ffa PROTO C
    sub_10099283 PROTO C
.CODE
FUN_1009935c PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, ecx
    and dword ptr [esi + 0xd8], 0
    and dword ptr [esi + 0xdc], 0
    test eax, eax
    je L0
    and dword ptr [eax], 0
    mov ecx, esi
    call sub_10098ffa
    test eax, eax
    jl L1
    mov ecx, esi
    call sub_10099283
    test eax, eax
    jl L1
    xor eax, eax
    pop esi
    pop ebp
    ret 4
FUN_1009935c ENDP
END