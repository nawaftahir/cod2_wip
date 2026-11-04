extern void sub_1000cc29(void);
extern void sub_1000fa63(void);
extern void sub_100108ad(void);

__declspec(naked) void FUN_10010ab0(void)
{
    __asm {
    push ebx
    mov ebx, ecx
    cmp byte ptr [eax], 0x24
    jne L1
    call sub_100108ad
    pop ebx
    ret
    push edx
    push ebx
    push 3
    push eax
    call sub_1000cc29
    add esp, 0x10
    mov ebx, eax
    call sub_1000fa63
    neg al
    sbb eax, eax
    and eax, ebx
    pop ebx
    ret
    }
}
