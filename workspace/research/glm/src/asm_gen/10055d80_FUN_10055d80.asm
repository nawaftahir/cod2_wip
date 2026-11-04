; FUN_10055d80 @ 0x10055d80 — auto-synthesized
.CODE
FUN_10055d80 PROC
    push ebx
    push ebp
    push esi
    push edi
    push 0x400
    mov esi, ecx
    mov ecx, dword ptr [eax + 4]
    push 1
    push eax
    call dword ptr [ecx]
    shl esi, 9
    add esp, 0xc
    sub esi, 0x200
    mov ebp, eax
    mov ebx, esi
    mov edi, 0x101910f0
    mov esi, ebp
    lea ebx, [ebx]
    xor ecx, ecx
    jmp L0
    lea esp, [esp]
    jmp L0
    lea ecx, [ecx]
    movzx edx, byte ptr [edi + ecx]
    imul edx, edx, 0x1fe
    mov eax, 0xfe01
    sub eax, edx
    cdq
    idiv ebx
    inc ecx
    add esi, 4
    cmp ecx, 0x10
    mov dword ptr [esi - 4], eax
    jl L0
    add edi, 0x10
FUN_10055d80 ENDP
END