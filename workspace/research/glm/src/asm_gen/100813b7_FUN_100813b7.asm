; FUN_100813b7 @ 0x100813b7 — auto-synthesized
    sub_100811d0 PROTO C
.CODE
FUN_100813b7 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jge L0
    mov ecx, dword ptr [ebp + 0xc]
    neg eax
    mov dword ptr [ecx], eax
    xor eax, eax
    jmp L1
    push dword ptr [ebp + 0xc]
    push eax
    call sub_100811d0
    pop ebp
    ret 8
FUN_100813b7 ENDP
END