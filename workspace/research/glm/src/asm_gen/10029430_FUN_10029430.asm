; FUN_10029430 @ 0x10029430 — auto-synthesized
.CODE
FUN_10029430 PROC
    push esi
    xor dl, dl
    mov eax, 0x10696c44
    or ecx, 0xffffffff
    push edi
    lea esp, [esp]
    mov byte ptr [eax - 4], dl
    mov dword ptr [eax], ecx
    lea edi, [eax + 4]
    mov esi, ecx
    mov dword ptr [edi], esi
    mov dword ptr [edi + 4], esi
    mov dword ptr [edi + 8], esi
    mov dword ptr [edi + 0xc], esi
    mov dword ptr [eax + 0x14], ecx
    add eax, 0x1c
    cmp eax, 0x10696cd0
    jne L0
    pop edi
    pop esi
    ret
FUN_10029430 ENDP
END