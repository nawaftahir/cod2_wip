; FUN_10101136 @ 0x10101136 — auto-synthesized
.CODE
FUN_10101136 PROC
    push ebx
    push ecx
    mov ebx, 0x101a50ec
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [ebx + 8], ecx
    mov dword ptr [ebx + 4], eax
    mov dword ptr [ebx + 0xc], ebp
    pop ecx
    pop ebx
    ret 4
FUN_10101136 ENDP
END