; FUN_10082643 @ 0x10082643 — auto-synthesized
    EXTRN fp_1010c08c:DWORD
.CODE
FUN_10082643 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x24
    push esi
    lea eax, [ebp - 0x24]
    mov esi, ecx
    and dword ptr [esi], 0
    push eax
    call dword ptr [fp_1010c08c]
    mov ecx, dword ptr [ebp - 0x20]
    mov eax, dword ptr [ebp + 0xc]
    and dword ptr [esi + 8], 0
    and dword ptr [esi + 0xc], 0
    and dword ptr [esi + 0x10], 0
    mov dword ptr [esi + 4], ecx
    lea eax, [ecx + eax - 1]
    dec ecx
    not ecx
    and eax, ecx
    mov ecx, dword ptr [ebp + 8]
    test ecx, ecx
    mov dword ptr [esi + 4], eax
    jne L0
    mov ecx, 0x100000
    lea ecx, [eax + ecx - 1]
    dec eax
    not eax
    and ecx, eax
    mov dword ptr [esi + 0x14], ecx
    mov eax, esi
    pop esi
    leave
    ret 8
FUN_10082643 ENDP
END