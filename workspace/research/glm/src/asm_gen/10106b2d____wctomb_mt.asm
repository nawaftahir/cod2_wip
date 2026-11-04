; ___wctomb_mt @ 0x10106b2d — auto-synthesized
    EXTRN fp_1010c044:DWORD
    sub_100fc26a PROTO C
.CODE
___wctomb_mt PROC
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    push esi
    xor esi, esi
    cmp ecx, esi
    jne L0
    xor eax, eax
    jmp L1
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [eax + 0x14], esi
    jne L2
    mov ax, word ptr [ebp + 0x10]
    cmp ax, 0xff
    ja L3
    mov byte ptr [ecx], al
    xor eax, eax
    inc eax
    jmp L1
    lea edx, [ebp + 0xc]
    push edx
    push esi
    push dword ptr [eax + 0x28]
    mov dword ptr [ebp + 0xc], esi
    push ecx
    push 1
    lea ecx, [ebp + 0x10]
    push ecx
    push esi
    push dword ptr [eax + 4]
    call dword ptr [fp_1010c044]
    cmp eax, esi
    je L3
    cmp dword ptr [ebp + 0xc], esi
    je L1
    call sub_100fc26a
    mov dword ptr [eax], 0x2a
    or eax, 0xffffffff
    pop esi
    pop ebp
    ret
___wctomb_mt ENDP
END