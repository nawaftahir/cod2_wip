; FUN_100a0aba @ 0x100a0aba — auto-synthesized
    sub_100650c3 PROTO C
    sub_10082ea3 PROTO C
    sub_10099562 PROTO C
    sub_1009957b PROTO C
    sub_100a0803 PROTO C
    sub_100a0815 PROTO C
.CODE
FUN_100a0aba PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    mov esi, ecx
    je L0
    lea eax, [ebp + 0xc]
    push eax
    push dword ptr [ebp + 0xc]
    call sub_100a0803
    test eax, eax
    jl L1
    lea eax, [ebp + 8]
    push eax
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    call sub_100a0815
    test eax, eax
    jl L1
    cmp dword ptr [ebp + 0xc], 1
    jb L2
    cmp dword ptr [ebp + 0xc], 4
    ja L2
    cmp dword ptr [ebp + 8], 1
    jb L2
    cmp dword ptr [ebp + 8], 4
    ja L2
    push 0x24
    call sub_100650c3
    test eax, eax
    je L0
    push 0
    push dword ptr [ebp + 8]
    mov ecx, eax
    push dword ptr [ebp + 0xc]
    push dword ptr [edi + 0x14]
    push 2
    call sub_10082ea3
    jmp L3
    push 4
    push 0x10115288
    push 0xbed
    lea eax, [esi + 0x20]
    push eax
    push esi
    call sub_10099562
    add esp, 0x14
    jmp L0
    push 0x10115250
    push 0xbf5
    lea eax, [esi + 0x20]
    push eax
    push esi
    call sub_1009957b
    add esp, 0x10
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 0xc
FUN_100a0aba ENDP
END