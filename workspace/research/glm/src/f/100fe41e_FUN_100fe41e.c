extern int g_101a50e4;
extern void sub_100f75b9(void);
extern void sub_100f8611(void);

__declspec(naked) void FUN_100fe41e(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f75b9
    cmp eax, 0x65
    jmp L3
    inc esi
    movsx eax, byte ptr [esi]
    push eax
    call sub_100f8611
    test eax, eax
    pop ecx
    jne L3
    mov al, byte ptr [esi]
    mov cl, byte ptr g_101a50e4
    mov byte ptr [esi], cl
    inc esi
    mov cl, byte ptr [esi]
    mov byte ptr [esi], al
    mov al, cl
    mov cl, byte ptr [esi]
    inc esi
    test cl, cl
    jne L3
    pop esi
    ret
    }
}
