; ___ansicp @ 0x10107f87 — auto-synthesized
    EXTRN fp_1010c190:DWORD
    EXTRN g_101a50d0:DWORD
    sub_100f73df PROTO C
    sub_10100d8e PROTO C
.CODE
___ansicp PROC
    push ebp
    mov ebp, esp
    sub esp, 0xc
    mov eax, dword ptr [g_101a50d0]
    push 6
    mov dword ptr [ebp - 4], eax
    lea eax, [ebp - 0xc]
    push eax
    push 0x1004
    push dword ptr [ebp + 8]
    mov byte ptr [ebp - 6], 0
    call dword ptr [fp_1010c190]
    test eax, eax
    jne L0
    or eax, 0xffffffff
    jmp L1
    lea eax, [ebp - 0xc]
    push eax
    call sub_100f73df
    pop ecx
    mov ecx, dword ptr [ebp - 4]
    call sub_10100d8e
    leave
    ret
___ansicp ENDP
END