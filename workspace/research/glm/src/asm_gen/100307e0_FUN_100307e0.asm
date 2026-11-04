; FUN_100307e0 @ 0x100307e0 — auto-synthesized
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d4934:DWORD
.CODE
FUN_100307e0 PROC
    sub esp, 0x600
    push esi
    lea edx, [esp + 0x204]
    lea esi, [esp + 0x404]
    push edi
    sub edx, eax
    sub esi, eax
    mov edi, 0x100
    nop
    mov cx, word ptr [eax]
    mov word ptr [edx + eax - 0x200], cx
    mov word ptr [edx + eax], cx
    mov word ptr [esi + eax], cx
    add eax, 2
    dec edi
    jne L0
    mov eax, dword ptr [g_101d1bf8]
    mov ecx, dword ptr [eax]
    lea edx, [esp + 8]
    push edx
    mov edx, dword ptr [g_101d4934]
    push 0
    push edx
    push eax
    call dword ptr [ecx + 0x54]
    pop edi
    pop esi
    add esp, 0x600
    ret
FUN_100307e0 ENDP
END