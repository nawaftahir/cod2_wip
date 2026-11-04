; FUN_100150e0 @ 0x100150e0 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN fp_101d4afc:DWORD
    EXTRN fp_101d4b00:DWORD
    sub_10015109 PROTO C
    sub_10015111 PROTO C
    sub_10060b68 PROTO C
    sub_10060c7e PROTO C
.CODE
FUN_100150e0 PROC
    push ecx
    push ebx
    push esi
    push edi
    push 0x101942b4
    call sub_10060c7e
    lea ecx, [esp + 0x10]
    push ecx
    push eax
    call dword ptr [fp_101d4afc]
    add esp, 0x10
    test eax, eax
    jl L0
    jne L1
    mov edx, dword ptr [esp + 8]
    push edx
    call dword ptr [fp_101d4b00]
    add esp, 4
    xor eax, eax
    pop esi
    pop ebx
    pop ecx
    ret
    push 0x18
    call dword ptr [fp_101d49d4]
    mov esi, eax
    mov eax, edi
    add esp, 4
    lea edx, [eax + 1]
    lea esp, [esp]
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L2
    sub eax, edx
    inc eax
    push eax
    call dword ptr [fp_101d49d4]
    mov dword ptr [esi + 0x14], eax
    mov eax, dword ptr [esp + 0xc]
    movzx ecx, byte ptr [eax]
    add esp, 4
    lea ebx, [esi + 4]
    inc eax
    mov dword ptr [esi], ecx
    call sub_10015109
    lea ebx, [esi + 0xc]
    call sub_10015111
    mov ecx, dword ptr [esi + 0x14]
    mov eax, edi
    mov dl, byte ptr [eax]
    inc eax
    mov byte ptr [ecx], dl
    inc ecx
    test dl, dl
    jne L3
    mov eax, dword ptr [esi + 0x14]
    call sub_10060b68
    mov edx, dword ptr [esp + 8]
    push edx
    call dword ptr [fp_101d4b00]
    add esp, 4
    mov eax, esi
    pop esi
    pop ebx
    pop ecx
    ret
FUN_100150e0 ENDP
END