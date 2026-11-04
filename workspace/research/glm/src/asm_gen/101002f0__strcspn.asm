; _strcspn @ 0x101002f0 — auto-synthesized
.CODE
_strcspn PROC
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
    or ecx, 0xffffffff
    lea ecx, [ecx]
    add ecx, 1
    mov al, byte ptr [esi]
    or al, al
    je L2
    add esi, 1
    bt dword ptr [esp], eax
    jae L3
    mov eax, ecx
    add esp, 0x20
    pop esi
    leave
    ret
_strcspn ENDP
END