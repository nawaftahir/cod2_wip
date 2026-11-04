; FUN_1000d200 @ 0x1000d200 — auto-synthesized
    sub_1000cc5a PROTO C
    sub_1000d14b PROTO C
    sub_1000fa96 PROTO C
    sub_100108c1 PROTO C
    sub_100138f4 PROTO C
.CODE
FUN_1000d200 PROC
    push ebx
    push edi
    mov ebx, esi
    mov edi, eax
    call sub_1000d14b
    test eax, eax
    jne L0
    cmp byte ptr [esi], 0x24
    jne L1
    mov bl, byte ptr [esp + 0xc]
    mov edx, edi
    mov eax, esi
    call sub_100108c1
    mov edi, eax
    test edi, edi
    jne L2
    push esi
    push 0x10193544
    push 1
    call sub_100138f4
    add esp, 0xc
    mov eax, edi
    pop edi
    pop ebx
    ret
    mov eax, dword ptr [esp + 0xc]
    push edi
    push eax
    push 3
    push esi
    call sub_1000cc5a
    add esp, 0x10
    mov edi, eax
    mov ebx, edi
    call sub_1000fa96
    test al, al
    jne L3
    xor edi, edi
    jmp L4
FUN_1000d200 ENDP
END