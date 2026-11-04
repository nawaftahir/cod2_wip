; FUN_100827da @ 0x100827da — auto-synthesized
.CODE
FUN_100827da PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L0
    mov eax, dword ptr [eax + 4]
    sub eax, dword ptr [ecx + 4]
    neg eax
    sbb eax, eax
    inc eax
    pop ebp
    ret 4
FUN_100827da ENDP
END