extern void sub_100cbad7(void);

__declspec(naked) void FUN_100cbaf5(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 4]
    mov eax, dword ptr [eax + 0x14]
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 0x14]
    cmp eax, -1
    je L1
    push eax
    push dword ptr [ebp + 8]
    call sub_100cbad7
    pop ebp
    ret 8
    }
}
