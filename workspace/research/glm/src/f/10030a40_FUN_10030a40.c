extern int g_1019bc84;
extern int g_101ce6d0;
extern int g_101ce708;
extern int g_101ce71c;
extern int g_101ce754;
extern int g_101ce7a4;
extern int g_101d496d;

__declspec(naked) void FUN_10030a40(void)
{
    __asm {
    mov eax, dword ptr g_101ce708
    mov eax, dword ptr [eax + 8]
    cmp eax, 2
    je L3
    mov cl, byte ptr g_101d496d
    test cl, cl
    je L3
    mov ecx, dword ptr g_101ce71c
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L3
    mov edx, dword ptr g_101ce6d0
    mov cl, byte ptr [edx + 8]
    test cl, cl
    je L3
    mov ecx, dword ptr g_101ce754
    cmp dword ptr [ecx + 8], 2
    je L3
    cmp eax, 2
    je L3
    mov edx, dword ptr g_101ce7a4
    fld dword ptr [edx + 8]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    je L3
    fld dword ptr [esp + 4]
    fcomp dword ptr g_1019bc84
    fnstsw ax
    test ah, 0x41
    jne L3
    mov al, 1
    ret
    xor al, al
    ret
    }
}
