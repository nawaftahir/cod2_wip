; write_string @ 0x100fa490 — auto-synthesized
    sub_100fa460 PROTO C
.CODE
write_string PROC
    test byte ptr [edi + 0xc], 0x40
    push ebx
    push esi
    mov esi, eax
    mov ebx, ecx
    je L0
    cmp dword ptr [edi + 8], 0
    jne L0
    mov eax, dword ptr [esp + 0xc]
    add dword ptr [esi], eax
    jmp L1
    mov al, byte ptr [ebx]
    dec dword ptr [esp + 0xc]
    mov ecx, edi
    call sub_100fa460
    inc ebx
    cmp dword ptr [esi], -1
    je L1
    cmp dword ptr [esp + 0xc], 0
    jg L2
    pop esi
    pop ebx
    ret
write_string ENDP
END