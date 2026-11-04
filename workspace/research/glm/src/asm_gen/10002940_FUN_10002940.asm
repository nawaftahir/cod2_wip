; FUN_10002940 @ 0x10002940 — auto-synthesized
    EXTRN g_101ae2a8:DWORD
    EXTRN g_101ae2ac:DWORD
    sub_1001391e PROTO C
    sub_100f78f2 PROTO C
.CODE
FUN_10002940 PROC
    push ebp
    xor ebp, ebp
    cmp word ptr [ebx + 0x34], bp
    jbe L0
    push edi
    xor edi, edi
    push esi
    lea ecx, [ecx]
    mov esi, dword ptr [ebx + 0x3c]
    mov eax, dword ptr [esi + edi]
    add esi, edi
    push 0x101919fc
    push eax
    call sub_100f78f2
    add esp, 8
    test eax, eax
    je L1
    movzx ecx, word ptr [ebx + 0x34]
    inc ebp
    add edi, 0xc
    cmp ebp, ecx
    jl L2
    pop esi
    pop edi
    pop ebp
    ret
    cmp byte ptr [esi + 5], 5
    je L3
    mov edx, dword ptr [esi + 8]
    cmp dword ptr [edx], 5
    je L4
    mov eax, dword ptr [ebx]
    mov ecx, dword ptr [esi + 8]
    mov edx, dword ptr [ecx + 0x20]
    push eax
    push edx
    push 0x101919c4
    push 1
    call sub_1001391e
    add esp, 0x10
    mov eax, dword ptr [esi + 8]
    mov dword ptr [g_101ae2a8], eax
    mov cl, byte ptr [esi + 4]
    pop esi
    mov byte ptr [g_101ae2ac], cl
    pop edi
    pop ebp
    ret
FUN_10002940 ENDP
END