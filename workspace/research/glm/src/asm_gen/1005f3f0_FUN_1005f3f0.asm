; FUN_1005f3f0 @ 0x1005f3f0 — auto-synthesized
    EXTRN g_101aac70:DWORD
    EXTRN g_101aac74:DWORD
    EXTRN g_101aac78:DWORD
    sub_1005f2f7 PROTO C
.CODE
FUN_1005f3f0 PROC
    push esi
    mov esi, dword ptr [g_101aac70]
    imul esi, esi, 0x45c
    add esi, 0x101a66b0
    mov al, byte ptr [esi + 0x404]
    test al, al
    je L0
    push 0x1019b90c
    call sub_1005f2f7
    mov byte ptr [esi + 0x404], 1
    mov eax, dword ptr [g_101aac78]
    add esp, 4
    mov dword ptr [g_101aac74], eax
    pop esi
    ret
    mov byte ptr [esi + 0x404], 1
    mov ecx, dword ptr [g_101aac78]
    mov dword ptr [g_101aac74], ecx
    pop esi
    ret
FUN_1005f3f0 ENDP
END