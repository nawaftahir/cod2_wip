extern int g_101ce708;
extern int g_101d1b9c;
extern int g_1072d9c0;
extern int g_1072da50;
extern int g_1072da54;
extern int g_1072da58;
extern int g_1072da5c;
extern int g_1072db20;
extern int g_1072db24;
extern int g_1072db28;
extern int g_1072db2c;
extern int g_1072db30;
extern int g_1072db34;
extern int g_1072db38;
extern int g_1072db3c;
extern int g_1072db40;
extern int g_1072db44;
extern int g_1072db48;
extern int g_1072db4c;
extern int g_1072db50;
extern int g_1072db54;
extern int g_1072db58;
extern int g_1072db5c;
extern int g_1072db60;
extern int g_1072db64;
extern int g_1072db68;
extern int g_1072db6c;
extern int g_1072db70;
extern int g_1072db74;
extern int g_1072db78;
extern int g_1072db7c;
extern int g_1072db80;
extern int g_1072db84;
extern int g_1072db88;
extern int g_1072db8c;
extern int g_1072db90;
extern int g_1072db94;
extern int g_1072db98;
extern int g_1072db9c;
extern int g_1072ddb4;
extern int g_1072de40;
extern int g_1072de44;
extern int g_10730580;
extern int g_10730584;
extern int g_10730588;
extern int g_1073058c;
extern void sub_100366b0(void);
extern void sub_1003a1a0(void);

__declspec(naked) void FUN_1003a340(void)
{
    __asm {
    mov eax, dword ptr g_101ce708
    cmp dword ptr [eax + 8], 2
    push esi
    jne L0
    mov eax, dword ptr g_1072d9c0
    cmp eax, 0xf
    je L1
    cmp eax, 0x10
    je L1
    cmp eax, 0x11
    je L1
    mov esi, dword ptr g_1072de44
    test esi, esi
    je L2
    mov ecx, dword ptr [esi]
    cmp ecx, dword ptr g_1072ddb4
    je L3
    mov eax, dword ptr g_1072de40
    call sub_100366b0
    mov esi, dword ptr g_1072de44
    mov edx, dword ptr [esi + 4]
    push edx
    lea ecx, [esi + 8]
    call sub_1003a1a0
    add esp, 4
    pop esi
    ret
    mov eax, dword ptr g_1072de40
    cmp dword ptr [eax], 2
    jne L1
    mov ecx, dword ptr [eax + 0xc]
    push ecx
    mov ecx, dword ptr [eax + 8]
    call sub_1003a1a0
    add esp, 4
    pop esi
    ret
    mov esi, dword ptr g_1072de44
    test esi, esi
    je L4
    mov edx, dword ptr [esi]
    cmp edx, dword ptr g_1072ddb4
    je L5
    mov eax, dword ptr g_1072de40
    call sub_100366b0
    mov esi, dword ptr g_1072de44
    fld dword ptr [esi + 4]
    mov eax, dword ptr g_10730580
    mov ecx, dword ptr g_10730584
    fstp dword ptr g_1072da5c
    mov edx, dword ptr g_10730588
    mov dword ptr g_1072da50, eax
    mov dword ptr g_1072da54, ecx
    mov dword ptr g_1072da58, edx
    mov eax, dword ptr [esi + 8]
    mov dword ptr g_1072db20, eax
    mov ecx, dword ptr [esi + 0xc]
    mov dword ptr g_1072db24, ecx
    mov edx, dword ptr [esi + 0x10]
    mov dword ptr g_1072db28, edx
    mov eax, dword ptr [esi + 0x14]
    mov dword ptr g_1072db2c, eax
    mov ecx, dword ptr [esi + 0x18]
    mov dword ptr g_1072db30, ecx
    mov edx, dword ptr [esi + 0x1c]
    mov dword ptr g_1072db34, edx
    mov eax, dword ptr [esi + 0x20]
    mov dword ptr g_1072db38, eax
    mov ecx, dword ptr [esi + 0x24]
    mov dword ptr g_1072db3c, ecx
    mov edx, dword ptr [esi + 0x28]
    mov dword ptr g_1072db40, edx
    mov eax, dword ptr [esi + 0x2c]
    mov dword ptr g_1072db44, eax
    mov ecx, dword ptr [esi + 0x30]
    mov dword ptr g_1072db48, ecx
    mov edx, dword ptr [esi + 0x34]
    mov dword ptr g_1072db4c, edx
    mov eax, dword ptr [esi + 0x38]
    mov dword ptr g_1072db50, eax
    mov ecx, dword ptr [esi + 0x3c]
    mov dword ptr g_1072db54, ecx
    mov edx, dword ptr [esi + 0x40]
    mov dword ptr g_1072db58, edx
    mov eax, dword ptr [esi + 0x44]
    mov dword ptr g_1072db5c, eax
    mov ecx, dword ptr [esi + 0x48]
    mov dword ptr g_1072db60, ecx
    mov edx, dword ptr [esi + 0x4c]
    mov dword ptr g_1072db64, edx
    mov eax, dword ptr [esi + 0x50]
    mov dword ptr g_1072db68, eax
    mov ecx, dword ptr [esi + 0x54]
    mov dword ptr g_1072db6c, ecx
    mov edx, dword ptr [esi + 0x58]
    mov dword ptr g_1072db70, edx
    mov eax, dword ptr [esi + 0x5c]
    mov dword ptr g_1072db74, eax
    mov ecx, dword ptr [esi + 0x60]
    mov dword ptr g_1072db78, ecx
    mov edx, dword ptr [esi + 0x64]
    mov dword ptr g_1072db7c, edx
    pop esi
    ret
    mov eax, dword ptr g_10730580
    mov ecx, dword ptr g_10730584
    mov edx, dword ptr g_10730588
    mov dword ptr g_1072da50, eax
    mov eax, dword ptr g_1073058c
    mov dword ptr g_1072da5c, eax
    mov eax, dword ptr g_1072de40
    mov dword ptr g_1072da54, ecx
    mov dword ptr g_1072da58, edx
    cmp dword ptr [eax], 2
    jne L1
    mov ecx, dword ptr g_101d1b9c
    mov edx, dword ptr [ecx + 0x110]
    mov dword ptr g_1072db90, edx
    mov edx, dword ptr [ecx + 0x114]
    mov dword ptr g_1072db94, edx
    mov ecx, dword ptr [ecx + 0x118]
    mov dword ptr g_1072db98, ecx
    mov dword ptr g_1072db9c, 0
    mov edx, dword ptr [eax + 8]
    mov dword ptr g_1072db80, edx
    mov ecx, dword ptr [eax + 0xc]
    mov dword ptr g_1072db84, ecx
    mov edx, dword ptr [eax + 0x10]
    mov dword ptr g_1072db88, edx
    mov dword ptr g_1072db8c, 0
    pop esi
    ret
    }
}
