; FUN_10061cd0 @ 0x10061cd0 — auto-synthesized
    sub_10013908 PROTO C
    sub_100f61e2 PROTO C
    sub_100f883a PROTO C
.CODE
FUN_10061cd0 PROC
    mov eax, 0x1000
    call sub_100f883a
    mov ecx, dword ptr [esp + 0x1008]
    lea eax, [esp + 0x100c]
    push eax
    push ecx
    lea edx, [esp + 8]
    push 0x1000
    push edx
    call sub_100f61e2
    mov ecx, dword ptr [esp + 0x1014]
    lea eax, [esp + 0x10]
    push eax
    push 0x10193358
    push ecx
    mov byte ptr [esp + 0x101b], 0
    call sub_10013908
    add esp, 0x101c
    ret
FUN_10061cd0 ENDP
END