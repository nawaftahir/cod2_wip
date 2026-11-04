; FUN_10046da0 @ 0x10046da0 — auto-synthesized
    sub_10046cf6 PROTO C
    sub_10046d09 PROTO C
    sub_10046d1c PROTO C
    sub_10046d2f PROTO C
.CODE
FUN_10046da0 PROC
    push ebx
    mov ebx, eax
    lea eax, [ebx + 0x60]
    push 0x10190b84
    push eax
    mov eax, 0x10190b70
    call sub_10046cf6
    lea ecx, [ebx + 0x70]
    push 0x10190bc8
    push ecx
    mov eax, 0x10190bb0
    call sub_10046d09
    lea edx, [ebx + 0x64]
    push 0x10190ba4
    push edx
    mov eax, 0x10190b90
    call sub_10046d1c
    lea eax, [ebx + 0x74]
    push 0x10190c80
    push eax
    mov eax, 0x10190c6c
    call sub_10046d2f
    add esp, 0x20
    pop ebx
    ret
FUN_10046da0 ENDP
END