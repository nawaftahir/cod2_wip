; _StringCopyWorkerA@12 @ 0x100cc691 — auto-synthesized
.CODE
_StringCopyWorkerA@12 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    xor eax, eax
    cmp dword ptr [ebp + 0xc], eax
    jne L0
    mov eax, 0x80070057
    jmp L1
    mov edx, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [ebp + 0x10]
    mov cl, byte ptr [esi]
    test cl, cl
    je L2
    mov byte ptr [edx], cl
    inc edx
    inc esi
    dec dword ptr [ebp + 0xc]
    jne L3
    cmp dword ptr [ebp + 0xc], 0
    pop esi
    jne L4
    dec edx
    mov eax, 0x8007007a
    mov byte ptr [edx], 0
    pop ebp
    ret 0xc
_StringCopyWorkerA@12 ENDP
END