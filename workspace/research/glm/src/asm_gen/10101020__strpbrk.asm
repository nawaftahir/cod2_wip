; _strpbrk @ 0x10101020 — auto-synthesized
.CODE
_strpbrk PROC
    push ebp
    mov ebp, esp
    push esi
    xor eax, eax
    push eax
    push eax
    push eax
    push eax
    push eax
    push eax
    push eax
    push eax
    mov edx, dword ptr [ebp + 0xc]
    lea ecx, [ecx]
    mov al, byte ptr [edx]
    or al, al
    je L0
    add edx, 1
    bts dword ptr [esp], eax
    jmp L1
    mov esi, dword ptr [ebp + 8]
    mov edi, edi
    mov al, byte ptr [esi]
    or al, al
    je L2
    add esi, 1
    bt dword ptr [esp], eax
    jae L3
    lea eax, [esi - 1]
    add esp, 0x20
    pop esi
    leave
    ret
_strpbrk ENDP
END