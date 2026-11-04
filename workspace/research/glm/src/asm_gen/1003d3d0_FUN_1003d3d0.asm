; FUN_1003d3d0 @ 0x1003d3d0 — auto-synthesized
    sub_1003d263 PROTO C
.CODE
FUN_1003d3d0 PROC
    sub esp, 0x10
    push 0x107666d4
    push eax
    push ecx
    lea eax, [esp + 0xc]
    mov dword ptr [esp + 0xc], 1
    mov dword ptr [esp + 0x10], 2
    mov dword ptr [esp + 0x14], 3
    mov dword ptr [esp + 0x18], 0x1a
    call sub_1003d263
    add esp, 0x1c
    ret
FUN_1003d3d0 ENDP
END