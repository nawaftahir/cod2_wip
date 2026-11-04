; FUN_10010850 @ 0x10010850 — auto-synthesized
    sub_1001019f PROTO C
    sub_100f883a PROTO C
.CODE
FUN_10010850 PROC
    mov eax, 0x1804
    call sub_100f883a
    mov al, byte ptr [esp + 0x180c]
    mov byte ptr [esp + 1], cl
    mov byte ptr [esp], dl
    mov edx, dword ptr [esp + 0x1808]
    push 0x100107e0
    mov byte ptr [esp + 6], al
    mov byte ptr [esp + 7], 0xff
    mov eax, dword ptr [esp + 4]
    push eax
    push 0x10
    lea ecx, [esp + 0x10]
    push ecx
    push edx
    call sub_1001019f
    add esp, 0x1818
    ret
FUN_10010850 ENDP
END