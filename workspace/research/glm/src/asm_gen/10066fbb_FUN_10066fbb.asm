; FUN_10066fbb @ 0x10066fbb — auto-synthesized
    sub_10063ab2 PROTO C
    sub_10063d3c PROTO C
    sub_10066413 PROTO C
    sub_100f7879 PROTO C
.CODE
FUN_10066fbb PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 0x70
    mov esi, ecx
    call sub_100f7879
    test eax, eax
    pop ecx
    je L0
    mov ecx, eax
    call sub_10063ab2
    jmp L1
    xor eax, eax
    test eax, eax
    mov dword ptr [esi + 0x268], eax
    jne L2
    mov eax, 0x8007000e
    jmp L3
    lea ecx, [esi + 0x18]
    push ecx
    push esi
    push dword ptr [ebp + 0x10]
    mov ecx, eax
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10063d3c
    test eax, eax
    jl L3
    push dword ptr [ebp + 0x14]
    mov ecx, esi
    call sub_10066413
    test eax, eax
    jl L3
    mov eax, dword ptr [esi + 0x268]
    mov dword ptr [esi + 0x26c], eax
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [esi + 0x270], eax
    xor eax, eax
    pop esi
    pop ebp
    ret 0x14
FUN_10066fbb ENDP
END