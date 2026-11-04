extern int c_101825b4;
extern int c_10696bd0;
extern int g_101ce708;
extern int g_101d1b9c;
extern int g_101d1ba0;
extern int g_101d49b8;
extern int g_10696bd0;
extern int g_10696bd4;
extern void (__stdcall *fp_101d49d4)(void);
extern void sub_10001413(void);
extern void sub_100014ce(void);
extern void sub_10001630(void);
extern void sub_100048aa(void);
extern void sub_1000d29a(void);
extern void sub_10029168(void);
extern void sub_100376d1(void);

__declspec(naked) void R_LoadWorld(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    push esi
    call sub_100376d1
    add esp, 4
    push esi
    call sub_100048aa
    mov ecx, dword ptr [ebp + 0xc]
    add esp, 4
    test ecx, ecx
    mov dword ptr g_101d1b9c, eax
    je L2
    mov eax, dword ptr [eax + 0x154]
    mov dword ptr [ecx], eax
    mov eax, dword ptr g_101d1b9c
L2:
    lea esi, [eax + 0x34]
    call sub_100014ce
    call sub_10001413
    call sub_10029168
    push 0xc0000
    xor ecx, ecx
    mov eax, 8
    mov edi, offset c_10696bd0
    mov dword ptr g_10696bd0, 0x41200000
    mov dword ptr g_10696bd4, 0xffffffff
    call fp_101d49d4
    add esp, 4
    mov dword ptr g_101d49b8, eax
    call sub_10001630
    mov ecx, dword ptr g_101ce708
    cmp dword ptr [ecx + 8], 2
    jne L3
    push 1
    xor eax, eax
    mov esi, offset c_101825b4
    call sub_1000d29a
    add esp, 4
    mov dword ptr g_101d1ba0, eax
L3:
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
    }
}
