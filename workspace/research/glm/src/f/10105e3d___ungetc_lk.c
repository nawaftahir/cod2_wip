extern void sub_10106ae9(void);

__declspec(naked) void __ungetc_lk(void)
{
    __asm {
    push ebx
    mov ebx, dword ptr [esp + 8]
    cmp ebx, -1
    push esi
    je L7
    mov esi, dword ptr [esp + 0x10]
    mov eax, dword ptr [esi + 0xc]
    test al, 1
    jne L7
    test al, al
    jns L7
    test al, 2
    jne L7
    cmp dword ptr [esi + 8], 0
    jne L7
    push esi
    call sub_10106ae9
    pop ecx
    mov eax, dword ptr [esi]
    cmp eax, dword ptr [esi + 8]
    jne L7
    cmp dword ptr [esi + 4], 0
    jne L7
    inc eax
    mov dword ptr [esi], eax
    dec dword ptr [esi]
    test byte ptr [esi + 0xc], 0x40
    mov eax, dword ptr [esi]
    je L7
    cmp byte ptr [eax], bl
    je L7
    inc eax
    mov dword ptr [esi], eax
    or eax, 0xffffffff
    pop esi
    pop ebx
    ret
    mov byte ptr [eax], bl
    mov eax, dword ptr [esi + 0xc]
    inc dword ptr [esi + 4]
    and eax, 0xffffffef
    or eax, 1
    mov dword ptr [esi + 0xc], eax
    mov eax, ebx
    and eax, 0xff
    jmp L7
    }
}
