extern int g_1072d9bc;
extern int g_1072d9c0;
extern int g_1072d9c4;
extern int g_1072d9cc;
extern int g_1072d9d0;
extern int g_1072d9e0;
extern void sub_1003a615(void);
extern void sub_1003a8de(void);
extern void sub_1003a918(void);

__declspec(naked) void FUN_1002df40(void)
{
    __asm {
    push ebx
    mov ebx, dword ptr g_1072d9cc
    push esi
    push edi
    call sub_1003a8de
    mov eax, dword ptr g_1072d9c4
    mov esi, dword ptr g_1072d9c0
    mov edi, dword ptr g_1072d9bc
    push eax
    call sub_1003a615
    mov eax, dword ptr g_1072d9cc
    add esp, 4
    cmp eax, ebx
    je L3
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    jne L3
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L3
    call sub_1003a918
    mov dword ptr g_1072d9cc, ebx
    pop edi
    pop esi
    pop ebx
    ret
    }
}
