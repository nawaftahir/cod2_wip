; __mtinitlocknum @ 0x100fbfdd — auto-synthesized
    sub_100f852d PROTO C
    sub_100f8554 PROTO C
    sub_100fb61c PROTO C
    sub_100fb6e1 PROTO C
    sub_100fc0bb PROTO C
    sub_100fc102 PROTO C
    sub_100fc245 PROTO C
    sub_100fc278 PROTO C
    sub_100fc487 PROTO C
    sub_10101115 PROTO C
    sub_10107ab7 PROTO C
.CODE
__mtinitlocknum PROC
    push 8
    push 0x1017c8b0
    call sub_100fb61c
    mov esi, dword ptr [ebp + 8]
    lea esi, [esi*8 + 0x101a4b28]
    xor ebx, ebx
    cmp dword ptr [esi], ebx
    jne L0
    push 0x18
    call sub_100fc487
    pop ecx
    mov edi, eax
    cmp edi, ebx
    jne L1
    call sub_100fc245
    mov dword ptr [eax], 0xc
    jmp L2
    push 0xa
    call sub_100fc0bb
    pop ecx
    mov dword ptr [ebp - 4], ebx
    cmp dword ptr [esi], ebx
    jne L3
    push 0xfa0
    push edi
    call sub_10107ab7
    pop ecx
    pop ecx
    test eax, eax
    jne L4
    push edi
    call sub_100f852d
    call sub_100fc278
    mov dword ptr [eax], 0xc
    push -1
    lea eax, [ebp - 0x10]
    push eax
    call sub_10101115
    add esp, 0xc
    xor eax, eax
    jmp L5
    mov dword ptr [esi], edi
    jmp L6
    push edi
    call sub_100f8554
    pop ecx
    or dword ptr [ebp - 4], 0xffffffff
    call sub_100fc102
    xor eax, eax
    inc eax
    call sub_100fb6e1
    ret
__mtinitlocknum ENDP
END