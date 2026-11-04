; FUN_10061c80 @ 0x10061c80 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    sub_100f61e2 PROTO C
    sub_100f883a PROTO C
.CODE
FUN_10061c80 PROC
    mov eax, 0x1000
    call sub_100f883a
    mov ecx, dword ptr [esp + 0x1004]
    lea eax, [esp + 0x1008]
    push eax
    push ecx
    lea edx, [esp + 8]
    push 0x1000
    push edx
    call sub_100f61e2
    lea eax, [esp + 0x10]
    push eax
    push 0x10193358
    push 0
    mov byte ptr [esp + 0x101b], 0
    call dword ptr [fp_101d49c8]
    add esp, 0x101c
    ret
FUN_10061c80 ENDP
END