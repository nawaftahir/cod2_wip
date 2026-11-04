extern void sub_100389bc(void);
extern void sub_10038c2b(void);
extern void sub_1003d98d(void);

__declspec(naked) void FUN_10039980(void)
{
    __asm {
    sub esp, 0xc
    cmp word ptr [ecx], 3
    push ebx
    mov ebx, dword ptr [ecx + 4]
    push esi
    push edi
    jne L2
    lea edi, [esp + 0x10]
    lea esi, [esp + 0x14]
    call sub_100389bc
    jmp L2
    lea eax, [esp + 0x10]
    lea edx, [esp + 0x14]
    call sub_10038c2b
    mov eax, dword ptr [esp + 0x10]
    mov edi, dword ptr [esp + 0x1c]
    push eax
    mov eax, dword ptr [esp + 0x18]
    call sub_1003d98d
    add esp, 4
    pop edi
    pop esi
    pop ebx
    add esp, 0xc
    ret
    }
}
