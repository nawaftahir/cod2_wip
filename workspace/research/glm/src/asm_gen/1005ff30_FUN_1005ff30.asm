; FUN_1005ff30 @ 0x1005ff30 — auto-synthesized
    EXTRN g_101aac70:DWORD
    sub_1005f6d0 PROTO C
    sub_100f7475 PROTO C
.CODE
FUN_1005ff30 PROC
    mov eax, dword ptr [g_101aac70]
    imul eax, eax, 0x45c
    add eax, 0x101a66b0
    mov dl, byte ptr [eax + 0x404]
    test dl, dl
    je L0
    mov edx, dword ptr [eax + 0x418]
    mov byte ptr [eax + 0x404], 0
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 0x414]
    mov dword ptr [eax + 0x400], edx
    push ecx
    mov eax, 1
    call sub_1005f6d0
    push eax
    call sub_100f7475
    add esp, 8
    ret
FUN_1005ff30 ENDP
END