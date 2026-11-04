extern void (__stdcall *fp_1010c044)(void);
extern void sub_100fc26a(void);

__declspec(naked) void ___wctomb_mt(void)
{
    __asm {
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    push esi
    xor esi, esi
    cmp ecx, esi
    jne L4
    xor eax, eax
    jmp L4
    mov eax, dword ptr [ebp + 8]
    cmp dword ptr [eax + 0x14], esi
    jne L4
    mov ax, word ptr [ebp + 0x10]
    cmp ax, 0xff
    ja L4
    mov byte ptr [ecx], al
    xor eax, eax
    inc eax
    jmp L4
    lea edx, [ebp + 0xc]
    push edx
    push esi
    push dword ptr [eax + 0x28]
    mov dword ptr [ebp + 0xc], esi
    push ecx
    push 1
    lea ecx, [ebp + 0x10]
    push ecx
    push esi
    push dword ptr [eax + 4]
    call fp_1010c044
    cmp eax, esi
    je L4
    cmp dword ptr [ebp + 0xc], esi
    je L4
    call sub_100fc26a
    mov dword ptr [eax], 0x2a
    or eax, 0xffffffff
    pop esi
    pop ebp
    ret
    }
}
