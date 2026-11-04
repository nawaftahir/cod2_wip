; R_AbortRenderCommands @ 0x10032f40 — auto-synthesized
    EXTRN g_101d494c:DWORD
    EXTRN g_101d4958:DWORD
.CODE
R_AbortRenderCommands PROC
    mov al, byte ptr [g_101d4958]
    test al, al
    je L0
    mov eax, dword ptr [g_101d494c]
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 0x88760868
    je L1
    cmp eax, 1
    setne al
    test al, al
    jne L1
    xor eax, eax
    ret
    mov byte ptr [g_101d4958], 0
    mov eax, 1
    ret
R_AbortRenderCommands ENDP
END