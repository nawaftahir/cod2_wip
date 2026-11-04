extern int g_1072debd;
extern void sub_10031495(void);
extern void sub_100317c9(void);

__declspec(naked) void FUN_10031cc0(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov cl, byte ptr g_1072debd
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    test cl, cl
    lea ecx, [eax + 8]
    je L1
    movsx edx, word ptr [eax + 4]
    push ecx
    push edx
    call sub_10031495
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add esp, 8
    add ecx, eax
    mov dword ptr [esi], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
    movsx edx, word ptr [eax + 6]
    movsx eax, word ptr [eax + 4]
    push 1
    push ecx
    push edx
    push eax
    call sub_100317c9
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add esp, 0x10
    add ecx, eax
    mov dword ptr [esi], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
    }
}
