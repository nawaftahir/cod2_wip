; FUN_10016e70 @ 0x10016e70 — auto-synthesized
    EXTRN g_101d0b04:DWORD
    sub_10016efd PROTO C
    sub_100179c8 PROTO C
.CODE
FUN_10016e70 PROC
    mov eax, dword ptr [g_101d0b04]
    lea eax, [eax*4 + 0x101d0b08]
    mov ecx, eax
    sub ecx, 0x101d0b08
    push 0x10016890
    sar ecx, 2
    push ecx
    push eax
    push 0x101d0b08
    call sub_100179c8
    mov ecx, dword ptr [g_101d0b04]
    add esp, 0x10
    xor eax, eax
    test ecx, ecx
    jle sub_10016efd
    jmp L0
    lea esp, [esp]
    mov edx, dword ptr [eax*4 + 0x101d0b08]
    mov word ptr [edx + 0xa], ax
FUN_10016e70 ENDP
END