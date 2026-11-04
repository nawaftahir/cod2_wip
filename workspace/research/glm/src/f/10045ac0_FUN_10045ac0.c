extern void sub_10044e56(void);
extern void sub_100456e1(void);
extern void sub_10045914(void);

__declspec(naked) void FUN_10045ac0(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esi + 0x154]
    push 0xd8
    call sub_10044e56
    mov dword ptr [edi + 0x1c], 0
    mov al, byte ptr [esi + 0xcc]
    add esp, 4
    test al, al
    je L2
    mov eax, esi
    call sub_100456e1
    mov al, byte ptr [esi + 0xd4]
    test al, al
    pop edi
    je L2
    mov eax, esi
    pop esi
    jmp sub_10045914
    pop esi
    ret
    }
}
