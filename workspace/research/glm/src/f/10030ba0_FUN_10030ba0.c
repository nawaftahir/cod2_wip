extern int g_1072d9d0;
extern int g_1072d9e0;
extern int g_10730558;
extern int g_10766718;
extern void sub_1003091e(void);
extern void sub_10030a7f(void);
extern void sub_10030aff(void);
extern void sub_1003a8f6(void);
extern void sub_1003ea89(void);

__declspec(naked) void FUN_10030ba0(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    push ebx
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [esi]
    jne L3
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L3
    call sub_1003a8f6
    mov ebx, dword ptr g_10766718
    mov dword ptr g_10730558, 0xe
    mov eax, dword ptr [edi + 4]
    push eax
    call sub_10030a7f
    add esp, 4
    test al, al
    je L3
    mov ecx, dword ptr [edi + 4]
    push ecx
    call sub_10030aff
    add esp, 4
    mov eax, ebx
    call sub_1003ea89
    call sub_1003091e
    mov eax, dword ptr [esi]
    movzx edx, word ptr [eax + 2]
    add edx, eax
    pop edi
    mov dword ptr [esi], edx
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
    }
}
