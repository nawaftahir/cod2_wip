extern int g_1072debd;
extern void sub_10030dfd(void);
extern void sub_100310a4(void);

__declspec(naked) void FUN_10031420(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov cl, byte ptr g_1072debd
    test cl, cl
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    push eax
    je L1
    call sub_10030dfd
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add esp, 4
    add ecx, eax
    mov dword ptr [esi], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
    call sub_100310a4
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add esp, 4
    add ecx, eax
    mov dword ptr [esi], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
    }
}
