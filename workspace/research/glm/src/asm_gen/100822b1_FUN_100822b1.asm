; FUN_100822b1 @ 0x100822b1 — auto-synthesized
    sub_1006387a PROTO C
.CODE
FUN_100822b1 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    dec dword ptr [ecx + 4]
    mov eax, dword ptr [ecx + 4]
    jne L0
    push 1
    call sub_1006387a
    xor eax, eax
    pop ebp
    ret 4
FUN_100822b1 ENDP
END