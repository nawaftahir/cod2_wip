; write_multi_char @ 0x100fa46c — auto-synthesized
    sub_100fa44f PROTO C
.CODE
write_multi_char PROC
    push ebp
    mov ebp, esp
    push esi
    mov esi, eax
    jmp L0
    mov ecx, dword ptr [ebp + 0x10]
    mov al, byte ptr [ebp + 8]
    dec dword ptr [ebp + 0xc]
    call sub_100fa44f
    cmp dword ptr [esi], -1
    je L1
    cmp dword ptr [ebp + 0xc], 0
    jg L2
    pop esi
    pop ebp
    ret
write_multi_char ENDP
END