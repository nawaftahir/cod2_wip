; FUN_10037670 @ 0x10037670 — auto-synthesized
    EXTRN g_10198384:DWORD
    EXTRN g_10198388:DWORD
    sub_10060358 PROTO C
    sub_10061cfe PROTO C
.CODE
FUN_10037670 PROC
    push edi
    mov edi, eax
    call sub_10060358
    mov eax, edi
    lea edx, [eax + 1]
    lea ecx, [ecx]
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    add eax, 5
    cmp eax, 0x40
    jb L1
    push edi
    push 0x1019838c
    push 1
    call sub_10061cfe
    add esp, 0xc
    dec edi
    mov al, byte ptr [edi + 1]
    inc edi
    test al, al
    jne L2
    mov eax, dword ptr [g_10198384]
    mov dword ptr [edi], eax
    mov cx, word ptr [g_10198388]
    mov word ptr [edi + 4], cx
    pop edi
    ret
FUN_10037670 ENDP
END