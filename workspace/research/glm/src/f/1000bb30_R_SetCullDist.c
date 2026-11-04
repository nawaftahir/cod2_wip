extern int g_1019bc78;
extern int g_101d616c;
extern int g_101d6178;
extern int g_101d6179;
extern int g_101d617a;
extern int g_101d617b;
extern int g_101d617c;
extern int g_101d6180;
extern int g_101d6184;
extern int g_101d6188;
extern int g_101d6189;
extern int g_101d618a;

__declspec(naked) void R_SetCullDist(void)
{
    __asm {
    mov ecx, dword ptr [esp + 4]
    fld dword ptr [esp + 0x1c]
    mov al, byte ptr [esp + 0x10]
    fcomp dword ptr g_1019bc78
    mov dl, byte ptr [esp + 0x14]
    shl ecx, 5
    mov byte ptr g_101d617a[ecx], al
    mov al, byte ptr [esp + 0x18]
    mov byte ptr g_101d6178[ecx], al
    mov eax, dword ptr [esp + 0xc]
    mov byte ptr g_101d6179[ecx], dl
    mov edx, dword ptr [esp + 8]
    mov byte ptr g_101d617b[ecx], 0xff
    mov dword ptr g_101d6180[ecx], eax
    fnstsw ax
    mov dword ptr g_101d617c[ecx], edx
    test ah, 1
    mov eax, 1
    mov byte ptr g_101d618a[ecx], 0
    mov byte ptr g_101d6188[ecx], al
    mov byte ptr g_101d6189[ecx], al
    jne L_far
    mov dword ptr g_101d616c[ecx], eax
    mov dword ptr g_101d6184[ecx], 0x3f800000
    ret
L_far:
    mov edx, dword ptr [esp + 0x1c]
    mov dword ptr g_101d616c[ecx], 2
    mov dword ptr g_101d6184[ecx], edx
    ret
    }
}
