extern int g_101ce708;
extern void sub_1003f64c(void);
extern void sub_100405f0(void);
extern void sub_10040982(void);

__declspec(naked) void FUN_10041030(void)
{
    __asm {
    sub esp, 0x1c
    push ebx
    push edi
    mov edi, eax
    mov al, byte ptr [edi + 0x58]
    mov cl, byte ptr [edi + 0x59]
    mov dl, byte ptr [edi + 0x5a]
    mov byte ptr [esp + 0xe], al
    mov al, byte ptr [edi + 0x5b]
    mov byte ptr [esp + 0xd], cl
    lea ecx, [esp + 0x10]
    mov byte ptr [esp + 0xc], dl
    mov byte ptr [esp + 0xf], al
    call sub_1003f64c
    mov ecx, dword ptr g_101ce708
    mov eax, dword ptr [ecx + 8]
    mov edx, dword ptr [esp + 0x1c]
    mov ecx, dword ptr [esp + 0x14]
    push edx
    mov edx, dword ptr [esp + 0x14]
    cmp eax, 2
    mov eax, dword ptr [esp + 0x1c]
    push eax
    mov eax, dword ptr [esp + 0x14]
    push ecx
    mov ecx, dword ptr [edi + 0x64]
    push edx
    push eax
    lea ebx, [edi + 0x3c]
    lea eax, [edi + 0x48]
    push ecx
    jne L1
    call sub_10040982
    add esp, 0x18
    pop edi
    pop ebx
    add esp, 0x1c
    ret
    call sub_100405f0
    add esp, 0x18
    pop edi
    pop ebx
    add esp, 0x1c
    ret
    }
}
