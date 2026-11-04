; FUN_1009cc93 @ 0x1009cc93 — auto-synthesized
    sub_1006507f PROTO C
    sub_1008285c PROTO C
    sub_10082899 PROTO C
    sub_1009962f PROTO C
    sub_1009b61a PROTO C
.CODE
FUN_1009cc93 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    push 0x14
    mov ebx, ecx
    call sub_1006507f
    xor esi, esi
    cmp eax, esi
    je L0
    push 0x10114b18
    push dword ptr [ebx + 0x14]
    mov ecx, eax
    push esi
    call sub_10082899
    mov edi, eax
    jmp L1
    xor edi, edi
    cmp edi, esi
    jne L2
    push esi
    mov ecx, ebx
    jmp L3
    cmp dword ptr [ebp + 8], esi
    mov dword ptr [ebx + 0x14], edi
    je L4
    push dword ptr [ebp + 8]
    call sub_1008285c
    mov esi, eax
    test esi, esi
    mov dword ptr [edi + 8], esi
    mov ecx, ebx
    jne L5
    push eax
    call sub_1009962f
    mov eax, 0x8007000e
    jmp L6
    push dword ptr [esi + 0x18]
    push esi
    call sub_1009b61a
    test eax, eax
    jl L6
    and byte ptr [esi + 0x11], 0xf1
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_1009cc93 ENDP
END