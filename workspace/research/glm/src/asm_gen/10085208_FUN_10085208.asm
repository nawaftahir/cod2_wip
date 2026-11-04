; FUN_10085208 @ 0x10085208 — auto-synthesized
    sub_100827ca PROTO C
.CODE
FUN_10085208 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push 0x13
    mov esi, ecx
    call sub_100827ca
    mov eax, dword ptr [ebp + 8]
    mov dword ptr [esi + 0x10], eax
    mov eax, dword ptr [ebp + 0xc]
    mov dword ptr [esi + 0x14], eax
    mov eax, dword ptr [ebp + 0x10]
    mov dword ptr [esi + 0x18], eax
    mov eax, dword ptr [ebp + 0x14]
    mov dword ptr [esi + 0x1c], eax
    mov eax, dword ptr [ebp + 0x18]
    mov dword ptr [esi + 0x28], eax
    mov dword ptr [esi], 0x101103ec
    mov dword ptr [esi + 0x20], 0xf0000
    mov dword ptr [esi + 0x24], 0xe40000
    mov eax, esi
    pop esi
    pop ebp
    ret 0x14
FUN_10085208 ENDP
END