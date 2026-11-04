; FUN_100868d1 @ 0x100868d1 — auto-synthesized
    sub_1008686b PROTO C
    sub_100868b6 PROTO C
.CODE
FUN_100868d1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov edx, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebp + 8]
    call sub_1008686b
    test eax, eax
    jne L0
    pop ebp
    jmp sub_100868b6
    pop ebp
    ret 0xc
FUN_100868d1 ENDP
END