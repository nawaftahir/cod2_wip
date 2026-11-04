; FUN_10016ed0 @ 0x10016ed0 — auto-synthesized
    EXTRN g_101d0b00:DWORD
    EXTRN g_101d0b04:DWORD
    sub_1001390f PROTO C
.CODE
FUN_10016ed0 PROC
    mov dword ptr [g_101d0b00], 1
    mov word ptr [eax + 8], cx
    mov dx, word ptr [g_101d0b04]
    mov word ptr [eax + 0xa], dx
    mov edx, dword ptr [g_101d0b04]
    movzx ecx, cx
    mov dword ptr [edx*4 + 0x101d0b08], eax
    mov dword ptr [ecx*4 + 0x101d4d28], eax
    mov eax, dword ptr [g_101d0b04]
    inc eax
    cmp eax, 0x400
    mov dword ptr [g_101d0b04], eax
    jne L0
    push eax
    push 0x101943dc
    push 0
    call sub_1001390f
    add esp, 0xc
    ret
FUN_10016ed0 ENDP
END