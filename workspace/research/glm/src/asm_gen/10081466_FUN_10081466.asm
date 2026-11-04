; FUN_10081466 @ 0x10081466 — auto-synthesized
    sub_100811cd PROTO C
.CODE
FUN_10081466 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    jge L0
    neg eax
    jmp L1
    lea ecx, [ebp + 0xc]
    push ecx
    mov ecx, dword ptr [ebp + 8]
    push eax
    call sub_100811cd
    test eax, eax
    jl L2
    mov eax, dword ptr [ebp + 0xc]
    cmp word ptr [eax + 8], 3
    je L3
    or eax, 0xffffffff
    jmp L4
    movzx eax, word ptr [eax + 0xa]
    pop ebp
    ret 8
FUN_10081466 ENDP
END