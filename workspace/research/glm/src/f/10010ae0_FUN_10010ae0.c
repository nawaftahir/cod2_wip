extern int g_101ce708;
extern void sub_1000ceac(void);
extern void sub_1000cebe(void);

__declspec(naked) void FUN_10010ae0(void)
{
    __asm {
    push ebx
    push esi
    mov esi, eax
    mov eax, dword ptr g_101ce708
    mov ecx, dword ptr [eax + 8]
    mov ax, word ptr [esi + 0x1a]
    push 0
    cmp ecx, 2
    mov cx, word ptr [esi + 0x18]
    push 0x200
    jne L1
    push 1
    mov ebx, 0x16
    call sub_1000ceac
    add esp, 0xc
    pop esi
    pop ebx
    ret
    push 0
    mov ebx, 0x32
    call sub_1000cebe
    add esp, 0xc
    pop esi
    pop ebx
    ret
    }
}
