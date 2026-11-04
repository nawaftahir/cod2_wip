extern int g_101ce708;
extern void sub_1000cc23(void);
extern void sub_1000cec5(void);
extern void sub_1000ceda(void);

__declspec(naked) void FUN_10010b30(void)
{
    __asm {
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push esi
    push 9
    push 5
    push 5
    push eax
    call sub_1000cc23
    mov ecx, dword ptr g_101ce708
    mov esi, eax
    add esp, 0x10
    mov word ptr [esi + 0x18], bp
    mov word ptr [esi + 0x1a], di
    mov eax, dword ptr [ecx + 8]
    push 0
    cmp eax, 2
    mov ecx, ebp
    push 0x200
    mov eax, edi
    jne L1
    push 1
    mov ebx, 0x16
    call sub_1000cec5
    add esp, 0xc
    mov eax, esi
    pop esi
    pop ebp
    pop ebx
    ret
    push 0
    mov ebx, 0x32
    call sub_1000ceda
    add esp, 0xc
    mov eax, esi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}
