; FUN_100a6eb2 @ 0x100a6eb2 — auto-synthesized
    sub_100c8d49 PROTO C
    sub_100f789f PROTO C
    sub_100f78ac PROTO C
.CODE
FUN_100a6eb2 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi
    mov esi, ecx
    push 8
    xor eax, eax
    pop ecx
    lea edi, [esi + 0x1f8]
    rep stosd dword ptr es:[edi], eax
    lea edi, [esi + 0x218]
    stosd dword ptr es:[edi], eax
    stosd dword ptr es:[edi], eax
    and dword ptr [esi + 0x220], 0
    and dword ptr [esi + 0x224], 0
    lea edi, [esi + 0x22c]
    push dword ptr [edi]
    call sub_100f789f
    lea ebx, [esi + 0x230]
    push dword ptr [ebx]
    call sub_100f78ac
    and dword ptr [edi], 0
    and dword ptr [ebx], 0
    pop ecx
    pop ecx
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100c8d49
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
FUN_100a6eb2 ENDP
END