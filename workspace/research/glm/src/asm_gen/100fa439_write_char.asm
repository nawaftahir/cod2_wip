; write_char @ 0x100fa439 — auto-synthesized
    sub_100fa346 PROTO C
.CODE
write_char PROC
    test byte ptr [ecx + 0xc], 0x40
    je L0
    cmp dword ptr [ecx + 8], 0
    je L1
    dec dword ptr [ecx + 4]
    js L2
    mov edx, dword ptr [ecx]
    mov byte ptr [edx], al
    inc dword ptr [ecx]
    movzx eax, al
    jmp L3
    movsx eax, al
    push ecx
    push eax
    call sub_100fa346
    pop ecx
    pop ecx
    cmp eax, -1
    jne L1
    or dword ptr [esi], eax
    ret
    inc dword ptr [esi]
    ret
write_char ENDP
END