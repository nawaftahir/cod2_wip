; FUN_10082aa4 @ 0x10082aa4 — auto-synthesized
    sub_100827e8 PROTO C
    sub_100829b6 PROTO C
.CODE
FUN_10082aa4 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push edx
    call sub_100827e8
    test eax, eax
    je L0
    lea eax, [edx + 0x10]
    add ecx, 0x10
    call sub_100829b6
    neg eax
    sbb eax, eax
    neg eax
    pop ebp
    ret 4
FUN_10082aa4 ENDP
END