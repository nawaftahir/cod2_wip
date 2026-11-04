; FUN_100046e0 @ 0x100046e0 — auto-synthesized
.CODE
FUN_100046e0 PROC
    mov eax, dword ptr [esp + 8]
    push esi
    mov esi, dword ptr [esp + 8]
    mov dword ptr [esi + 4], eax
    cmp dword ptr [esi], -1
    jne L0
    mov ecx, dword ptr [esi + 0x10]
    push esi
    push ecx
    call L1
    mov edx, dword ptr [esi + 0x14]
    push esi
    push edx
    call L1
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [esi + 0x14]
    mov dword ptr [esi + 8], 0xfffffffe
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [ecx + 8]
    add esp, 0x10
    cmp eax, edx
    jne L0
    mov dword ptr [esi + 8], eax
    pop esi
    ret
FUN_100046e0 ENDP
END