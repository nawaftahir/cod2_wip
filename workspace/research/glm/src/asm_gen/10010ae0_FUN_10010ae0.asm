; FUN_10010ae0 @ 0x10010ae0 — auto-synthesized
    EXTRN g_101ce708:DWORD
    sub_1000ceac PROTO C
    sub_1000cebe PROTO C
.CODE
FUN_10010ae0 PROC
    push ebx
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101ce708]
    mov ecx, dword ptr [eax + 8]
    mov ax, word ptr [esi + 0x1a]
    push 0
    cmp ecx, 2
    mov cx, word ptr [esi + 0x18]
    push 0x200
    jne L0
    push 1
    mov ebx, 0x16
    call sub_1000ceac
    add esp, 0xc
    pop esi
    pop ebx
    ret
    push 0
    mov ebx, 0x32
    call sub_1000cebe
    add esp, 0xc
    pop esi
    pop ebx
    ret
FUN_10010ae0 ENDP
END