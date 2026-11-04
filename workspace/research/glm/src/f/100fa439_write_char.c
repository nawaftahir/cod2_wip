extern void sub_100fa346(void);

__declspec(naked) void write_char(void)
{
    __asm {
    test byte ptr [ecx + 0xc], 0x40
    je L4
    cmp dword ptr [ecx + 8], 0
    je L4
    dec dword ptr [ecx + 4]
    js L4
    mov edx, dword ptr [ecx]
    mov byte ptr [edx], al
    inc dword ptr [ecx]
    movzx eax, al
    jmp L4
    movsx eax, al
    push ecx
    push eax
    call sub_100fa346
    pop ecx
    pop ecx
    cmp eax, -1
    jne L4
    or dword ptr [esi], eax
    ret
    inc dword ptr [esi]
    ret
    }
}
