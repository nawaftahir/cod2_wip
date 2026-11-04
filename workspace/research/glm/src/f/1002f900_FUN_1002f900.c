extern int g_1072d9d0;
extern int g_1072d9e0;
extern int g_1072debc;
extern int g_1072debd;
extern int g_10766748;
extern void sub_1002e3ba(void);
extern void sub_1002f494(void);
extern void sub_1003a8fc(void);
extern void sub_1003e9f8(void);

__declspec(naked) void FUN_1002f900(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov eax, dword ptr [ebp + 8]
    push esi
    mov esi, dword ptr [eax]
    movzx ecx, word ptr [esi + 2]
    add ecx, esi
    mov dword ptr [eax], ecx
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    jne L5
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L5
    call sub_1003a8fc
    mov al, byte ptr g_1072debd
    test al, al
    je L5
    call sub_1002e3ba
    mov al, byte ptr g_1072debc
    test al, al
    je L5
    call sub_1003e9f8
    mov al, byte ptr g_10766748
    test al, al
    jne L5
    mov edx, dword ptr [esi + 4]
    mov eax, dword ptr [esi + 0x10]
    mov ecx, dword ptr [esi + 0xc]
    push edx
    push eax
    mov eax, dword ptr [esi + 8]
    call sub_1002f494
    add esp, 8
    pop esi
    mov esp, ebp
    pop ebp
    ret
    }
}
