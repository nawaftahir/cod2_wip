; write_multi_char @ 0x101054b5 — auto-synthesized
    sub_101054a6 PROTO C
.CODE
write_multi_char PROC
    push ebp
    mov ebp, esp
    push esi
    mov esi, eax
    jmp L0
    push dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 0x10]
    dec dword ptr [ebp + 0xc]
    call sub_101054a6
    cmp dword ptr [esi], -1
    pop ecx
    je L1
    cmp dword ptr [ebp + 0xc], 0
    jg L2
    pop esi
    pop ebp
    ret
write_multi_char ENDP
END