; FUN_10017540 @ 0x10017540 — auto-synthesized
    EXTRN g_101d7fc8:DWORD
    EXTRN g_101da2d4:DWORD
    sub_10016dd2 PROTO C
    sub_10017477 PROTO C
.CODE
FUN_10017540 PROC
    push esi
    push edi
    call sub_10017477
    xor eax, eax
    mov ecx, 0xc0
    mov edi, 0x101d7fcc
    rep stosd dword ptr es:[edi], eax
    xor esi, esi
    mov dword ptr [g_101d7fc8], esi
    call sub_10016dd2
    mov ecx, 0x100
    xor eax, eax
    mov edi, 0x101da564
    rep stosd dword ptr es:[edi], eax
    mov dword ptr [g_101da2d4], esi
    cmp dword ptr [eax + 0x101da460], esi
    je L0
    mov dword ptr [eax + 0x101da460], esi
    add eax, 4
    cmp eax, 0x100
    jb L1
    xor eax, eax
    cmp dword ptr [eax + 0x101da3dc], esi
    je L2
    mov dword ptr [eax + 0x101da3dc], esi
    add eax, 4
    cmp eax, 0x80
    jb L3
    xor eax, eax
    lea ebx, [ebx]
    cmp dword ptr [eax + 0x101d92d4], esi
    je L4
    mov dword ptr [eax + 0x101d92d4], esi
    add eax, 4
    cmp eax, 0x1000
    jb L5
    xor eax, eax
    lea ebx, [ebx]
    cmp dword ptr [eax + 0x101d82d0], esi
    je L6
    mov dword ptr [eax + 0x101d82d0], esi
    add eax, 4
    cmp eax, 0x1000
    jb L7
    pop edi
    pop esi
    ret
FUN_10017540 ENDP
END