; FUN_100c99ce @ 0x100c99ce — auto-synthesized
    sub_100c99cb PROTO C
    sub_100c99df PROTO C
.CODE
FUN_100c99ce PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    or eax, dword ptr [ebp + 0xc]
    push esi
    push eax
    mov esi, ecx
    call sub_100c99cb
    test eax, eax
    jl L0
    cmp dword ptr [ebp + 0x10], 0
    je L1
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    call sub_100c99df
    test eax, eax
    jl L0
    mov eax, dword ptr [esi + 0x118]
    mov ecx, dword ptr [esi + 0x10c]
    lea eax, [ecx + eax*4]
    or byte ptr [eax + 3], 0x10
    xor eax, eax
    pop esi
    pop ebp
    ret 0xc
FUN_100c99ce ENDP
END