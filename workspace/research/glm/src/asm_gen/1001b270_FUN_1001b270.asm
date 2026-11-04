; FUN_1001b270 @ 0x1001b270 — auto-synthesized
    sub_100183d0 PROTO C
    sub_1001b024 PROTO C
    sub_1005fb12 PROTO C
    sub_1005fb27 PROTO C
    sub_1005fb3c PROTO C
    sub_1005fb6e PROTO C
.CODE
FUN_1001b270 PROC
    push esi
    push edi
    mov edi, eax
    mov esi, ecx
    mov eax, 0x1019507c
    call sub_100183d0
    test al, al
    je L0
    push 1
    push 0x10195640
    mov ecx, esi
    call sub_1005fb12
    add esp, 8
    test eax, eax
    je L0
    mov eax, dword ptr [esp + 0xc]
    push 1
    push eax
    mov ecx, esi
    call sub_1005fb27
    add esp, 8
    test eax, eax
    je L0
    push 1
    push 0x1019563c
    mov ecx, esi
    call sub_1005fb3c
    add esp, 8
    test eax, eax
    je L0
    mov ecx, dword ptr [esp + 0x14]
    mov edx, dword ptr [esp + 0x10]
    push ecx
    push edx
    push edi
    push esi
    call sub_1001b024
    add esp, 0x10
    test al, al
    jne L1
    pop edi
    xor al, al
    pop esi
    ret
    push 1
    push 0x10195820
    mov ecx, esi
    call sub_1005fb6e
    add esp, 8
    test eax, eax
    pop edi
    setne al
    pop esi
    ret
FUN_1001b270 ENDP
END