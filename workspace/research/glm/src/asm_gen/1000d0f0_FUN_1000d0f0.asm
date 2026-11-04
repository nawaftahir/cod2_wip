; FUN_1000d0f0 @ 0x1000d0f0 — auto-synthesized
    EXTRN g_101ce708:DWORD
    sub_1000ceb2 PROTO C
    sub_1000cec4 PROTO C
.CODE
FUN_1000d0f0 PROC
    push esi
    mov esi, eax
    cmp byte ptr [esi + 0x1e], 5
    jne L0
    mov eax, dword ptr [g_101ce708]
    mov ecx, dword ptr [eax + 8]
    mov ax, word ptr [esi + 0x1a]
    push ebx
    push 0
    cmp ecx, 2
    mov cx, word ptr [esi + 0x18]
    push 0x200
    jne L1
    push 1
    mov ebx, 0x16
    call sub_1000ceb2
    add esp, 0xc
    pop ebx
    pop esi
    ret
    push 0
    mov ebx, 0x32
    call sub_1000cec4
    add esp, 0xc
    pop ebx
    pop esi
    ret
FUN_1000d0f0 ENDP
END