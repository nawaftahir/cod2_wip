; FUN_1001c7f0 @ 0x1001c7f0 — auto-synthesized
    EXTRN fp_101d49e4:DWORD
    EXTRN fp_101d4b04:DWORD
    EXTRN fp_101d4b1c:DWORD
    EXTRN fp_101d4b20:DWORD
    sub_10060c33 PROTO C
    sub_100f5f91 PROTO C
.CODE
FUN_1001c7f0 PROC
    mov eax, dword ptr [esp + 8]
    sub esp, 0x44
    push ebp
    mov ebp, dword ptr [esp + 0x4c]
    push esi
    push edi
    push ebp
    push eax
    push 0x10194938
    mov esi, 0x40
    lea edi, [esp + 0x1c]
    call sub_10060c33
    push 1
    lea ecx, [esp + 0x1c]
    push ecx
    mov edx, edi
    push edx
    call dword ptr [fp_101d4b04]
    mov edi, eax
    mov eax, dword ptr [esp + 0x70]
    add esp, 0x18
    lea edx, [eax + 1]
    nop
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    mov esi, eax
    mov eax, ebp
    lea ecx, [eax + 1]
    mov dl, byte ptr [eax]
    inc eax
    test dl, dl
    jne L1
    sub eax, ecx
    add eax, esi
    lea eax, [eax + edi + 2]
    push 1
    push eax
    call dword ptr [fp_101d49e4]
    mov ecx, dword ptr [esp + 0x60]
    push ebp
    push ecx
    mov esi, eax
    push 0x10194930
    push esi
    mov dword ptr [ebx], esi
    call sub_100f5f91
    mov edx, dword ptr [esp + 0x24]
    push edx
    lea esi, [esi + eax + 1]
    push edi
    push esi
    mov dword ptr [ebx + 4], esi
    call dword ptr [fp_101d4b20]
    mov eax, dword ptr [esp + 0x30]
    push eax
    call dword ptr [fp_101d4b1c]
    add esp, 0x28
    mov byte ptr [esi + edi], 0
    mov dword ptr [ebx + 8], edi
    pop edi
    pop esi
    pop ebp
    add esp, 0x44
    ret
FUN_1001c7f0 ENDP
END