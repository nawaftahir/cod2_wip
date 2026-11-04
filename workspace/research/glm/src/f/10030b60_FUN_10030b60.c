extern int g_1072d9d0;
extern int g_1072d9e0;
extern void sub_1003a8f4(void);
extern void sub_1003c07c(void);

__declspec(naked) void FUN_10030b60(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [esi]
    jne L2
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L2
    call sub_1003a8f4
    mov eax, dword ptr [edi + 4]
    call sub_1003c07c
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add ecx, eax
    pop edi
    mov dword ptr [esi], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
    }
}
