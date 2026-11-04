; report_failure @ 0x10100d1c — auto-synthesized
    sub_100fb61c PROTO C
    sub_101088ab PROTO C
.CODE
report_failure PROC
    push 8
    push 0x1017e2a0
    call sub_100fb61c
    and dword ptr [ebp - 4], 0
    push 0
    push 1
    call sub_101088ab
    pop ecx
    pop ecx
    jmp L0
    xor eax, eax
    inc eax
    ret
    mov esp, dword ptr [ebp - 0x18]
    or dword ptr [ebp - 4], 0xffffffff
report_failure ENDP
END