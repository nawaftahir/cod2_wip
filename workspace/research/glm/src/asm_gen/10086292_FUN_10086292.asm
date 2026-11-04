; FUN_10086292 @ 0x10086292 — auto-synthesized
    sub_1006c454 PROTO C
    sub_10085394 PROTO C
    sub_10085824 PROTO C
    sub_10085aed PROTO C
    sub_1008606f PROTO C
.CODE
FUN_10086292 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0x74
    mov edi, ecx
    call sub_10085824
    test eax, eax
    je L0
    mov ecx, eax
    call sub_10085394
    mov esi, eax
    jmp L1
    xor esi, esi
    test esi, esi
    je L2
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_10085aed
    test eax, eax
    jge L3
    push 1
    mov ecx, esi
    call sub_1006c454
    or eax, 0xffffffff
    jmp L4
    push esi
    mov ecx, edi
    call sub_1008606f
    pop edi
    pop esi
    pop ebp
    ret 4
FUN_10086292 ENDP
END