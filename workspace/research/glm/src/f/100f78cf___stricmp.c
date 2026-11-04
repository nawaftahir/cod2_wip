extern int g_101a4684;
extern void sub_100f7526(void);
extern void sub_100f7534(void);
extern void sub_100f7cd2(void);
extern void sub_100fb11e(void);
extern void sub_100fe3fd(void);

__declspec(naked) void __stricmp(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    call sub_100fb11e
    mov ebx, dword ptr [eax + 0x64]
    cmp ebx, dword ptr g_101a4684
    je L5
    call sub_100f7cd2
    mov ebx, eax
    cmp dword ptr [ebx + 0x14], 0
    jne L5
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100fe3fd
    pop ecx
    pop ecx
    jmp L5
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    movzx eax, byte ptr [esi]
    push eax
    push ebx
    call sub_100f7526
    mov dword ptr [ebp - 4], eax
    movzx eax, byte ptr [edi]
    push eax
    push ebx
    inc esi
    call sub_100f7534
    add esp, 0x10
    mov ecx, eax
    mov eax, dword ptr [ebp - 4]
    inc edi
    test eax, eax
    je L5
    cmp eax, ecx
    je L5
    pop edi
    sub eax, ecx
    pop esi
    pop ebx
    leave
    ret
    }
}
