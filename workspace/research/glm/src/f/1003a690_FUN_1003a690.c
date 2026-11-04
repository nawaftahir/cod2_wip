extern int g_101ce708;
extern int g_101d1b9c;
extern int g_101d49b4;
extern int g_1072d9b4;
extern int g_1072d9b8;
extern int g_1072d9e0;
extern int g_1072d9e4;
extern int g_1072d9e8;
extern int g_10766750;
extern int g_10766754;
extern int g_10766758;
extern void sub_100386b0(void);
extern void sub_1003a580(void);
extern void sub_1003ed20(void);

__declspec(naked) void FUN_1003a690(void)
{
    __asm {
    sub esp, 0x14
    mov eax, dword ptr g_1072d9e8
    mov ecx, dword ptr g_1072d9e4
    mov dword ptr [esp + 0xc], eax
    mov dword ptr [esp + 4], ecx
    mov ecx, dword ptr g_1072d9e0
    mov eax, 0x55555556
    imul ecx
    push ebx
    push ebp
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    mov edx, dword ptr g_1072d9b4
    push esi
    push edi
    mov dword ptr [esp + 0x18], eax
    xor ebp, ebp
    push edx
    mov eax, ecx
    mov dword ptr [esp + 0x14], ebp
    call sub_100386b0
    mov dword ptr [esp + 0x24], eax
    mov eax, dword ptr g_1072d9b8
    add esp, 4
    cmp eax, 1
    jne L0
    mov ecx, dword ptr g_101ce708
    mov ebx, dword ptr [ecx + 8]
    mov edx, dword ptr g_101d1b9c
    mov ecx, dword ptr g_10766750
    xor eax, eax
    cmp ebx, 2
    setne al
    dec eax
    and eax, 0xffffffdc
    add eax, 0x44
    mov edi, eax
    mov eax, dword ptr [edx + 0x30]
    cmp ecx, eax
    jne L1
    cmp dword ptr g_10766754, ebp
    jne L1
    cmp dword ptr g_10766758, edi
    je L2
    push eax
    xor ebx, ebx
    xor esi, esi
    call sub_1003ed20
    add esp, 4
    lea eax, [esp + 0x10]
    push eax
    push 1
    jmp L3
    mov edx, dword ptr g_101ce708
    mov ebx, dword ptr [edx + 8]
    mov eax, dword ptr g_101d49b4
    xor ecx, ecx
    cmp ebx, 2
    setne cl
    dec ecx
    and ecx, 0xffffffd8
    add ecx, 0x40
    mov edi, ecx
    cmp dword ptr g_10766750, eax
    jne L4
    cmp dword ptr g_10766754, ebp
    jne L4
    cmp dword ptr g_10766758, edi
    je L5
    push eax
    xor ebx, ebx
    xor esi, esi
    call sub_1003ed20
    add esp, 4
    lea eax, [esp + 0x10]
    push eax
    push 3
    call sub_1003a580
    add esp, 8
    pop edi
    pop esi
    mov dword ptr g_1072d9e0, ebp
    mov dword ptr g_1072d9b8, ebp
    pop ebp
    pop ebx
    add esp, 0x14
    ret
    }
}
