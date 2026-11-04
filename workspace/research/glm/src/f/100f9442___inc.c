extern void sub_10105d70(void);

__declspec(naked) void __inc(void)
{
    __asm {
    dec dword ptr [edx + 4]
    js L1
    mov ecx, dword ptr [edx]
    movzx eax, byte ptr [ecx]
    inc ecx
    mov dword ptr [edx], ecx
    ret
    push edx
    call sub_10105d70
    pop ecx
    ret
    }
}
