; __stbuf @ 0x100fb55d — auto-synthesized
    EXTRN g_101addc8:DWORD
    sub_100fc4b4 PROTO C
    sub_10106b10 PROTO C
.CODE
__stbuf PROC
    push esi
    mov esi, dword ptr [esp + 8]
    push dword ptr [esi + 0x10]
    call sub_10106b10
    test eax, eax
    pop ecx
    je L0
    cmp esi, 0x101a48c0
    jne L1
    xor eax, eax
    jmp L2
    cmp esi, 0x101a48e0
    jne L0
    xor eax, eax
    inc eax
    inc dword ptr [g_101addc8]
    test word ptr [esi + 0xc], 0x10c
    jne L0
    push ebx
    push edi
    lea edi, [eax*4 + 0x101addcc]
    cmp dword ptr [edi], 0
    mov ebx, 0x1000
    jne L3
    push ebx
    call sub_100fc4b4
    test eax, eax
    pop ecx
    mov dword ptr [edi], eax
    jne L3
    lea eax, [esi + 0x14]
    push 2
    mov dword ptr [esi + 8], eax
    mov dword ptr [esi], eax
    pop eax
    mov dword ptr [esi + 0x18], eax
    mov dword ptr [esi + 4], eax
    jmp L4
    mov edi, dword ptr [edi]
    mov dword ptr [esi + 8], edi
    mov dword ptr [esi], edi
    mov dword ptr [esi + 0x18], ebx
    mov dword ptr [esi + 4], ebx
    or word ptr [esi + 0xc], 0x1102
    pop edi
    xor eax, eax
    pop ebx
    inc eax
    pop esi
    ret
    xor eax, eax
    pop esi
    ret
__stbuf ENDP
END