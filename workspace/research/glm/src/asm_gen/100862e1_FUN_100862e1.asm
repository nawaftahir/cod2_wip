; FUN_100862e1 @ 0x100862e1 — auto-synthesized
.CODE
FUN_100862e1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    mov edx, dword ptr [edx + 4]
    mov ecx, dword ptr [ecx + 0x10]
    mov ecx, dword ptr [ecx + edx*4]
    test byte ptr [ecx + 4], 0x20
    mov eax, 0x10110404
    je L0
    mov eax, 0x101103fc
    pop ebp
    ret 4
FUN_100862e1 ENDP
END