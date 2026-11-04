extern void sub_100853cf(void);
extern void sub_100c9a7f(void);

__declspec(naked) void FUN_100ca3b2(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x10
    push ebx
    push esi
    push edi
    mov edi, ecx
    mov ecx, dword ptr [edi + 0x100]
    mov eax, dword ptr [ecx + 0xc]
    mov esi, dword ptr [ecx]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ecx + 0x10]
    mov dword ptr [ebp - 8], eax
    lea eax, [ebp - 0x10]
    push eax
    xor ebx, ebx
    push ebx
    and esi, 0xfffff
    call sub_100853cf
    mov ecx, dword ptr [edi + 0x100]
    lea eax, [ebp - 0xc]
    push eax
    push 1
    call sub_100853cf
    push ebx
    push ebx
    push ebx
    push ebx
    push esi
    push ebx
    push dword ptr [ebp - 0x10]
    mov ecx, edi
    push dword ptr [ebp - 0xc]
    push dword ptr [ebp - 4]
    push dword ptr [ebp - 8]
    push 0x5f
    call sub_100c9a7f
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
