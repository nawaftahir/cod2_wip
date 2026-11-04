; _StringCopyWorkerW@12 @ 0x100cc6ce — auto-synthesized
.CODE
_StringCopyWorkerW@12 PROC
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
    mov cx, word ptr [esi]
    test cx, cx
    je L2
    mov word ptr [edx], cx
    inc edx
    inc edx
    inc esi
    inc esi
    dec dword ptr [ebp + 0xc]
    jne L3
    cmp dword ptr [ebp + 0xc], 0
    pop esi
    jne L4
    dec edx
    dec edx
    mov eax, 0x8007007a
    and word ptr [edx], 0
    pop ebp
    ret 0xc
_StringCopyWorkerW@12 ENDP
END