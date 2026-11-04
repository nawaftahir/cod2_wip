extern int g_101ce5ec;
extern int g_101ce5ed;
extern int g_101ce5ee;
extern int g_101ce800;
extern void sub_100080d0(void);
extern void sub_10008160(void);
extern void sub_100083a0(void);
extern void sub_10009570(void);

__declspec(naked) void FUN_100092b0(void)
{
    __asm {
    mov al, byte ptr g_101ce5ec
    sub esp, 8
    test al, al
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x1c]
    push esi
    push edi
    je L0
    mov eax, dword ptr [esp + 0x1c]
    mov esi, dword ptr [eax + 0x1c]
    mov eax, dword ptr [esi + 0x28]
    test eax, eax
    je L1
    mov ecx, dword ptr g_101ce800
    mov dl, byte ptr [ecx + 8]
    test dl, dl
    je L1
    xor edi, edi
    test eax, eax
    jle L0
    xor ebx, ebx
    nop
    mov edx, dword ptr [esp + 0x20]
    mov eax, dword ptr [esi + 0x2c]
    push 0
    push ebp
    push edx
    add eax, ebx
    push eax
    call sub_10008160
    mov eax, dword ptr [esi + 0x28]
    add esp, 0x10
    inc edi
    add ebx, 0x30
    cmp edi, eax
    jl L2
    jmp L0
    mov al, byte ptr g_101ce5ee
    test al, al
    je L3
    mov eax, dword ptr [esi + 0x20]
    xor edi, edi
    test eax, eax
    jle L3
    mov ecx, dword ptr [esp + 0x20]
    mov edx, dword ptr [esi + 0x24]
    mov eax, dword ptr [edx + edi*4]
    push 0
    push ebp
    push ecx
    push eax
    call sub_10009570
    mov eax, dword ptr [esi + 0x20]
    add esp, 0x10
    inc edi
    cmp edi, eax
    jl L4
    mov eax, dword ptr [esi + 0x18]
    test eax, eax
    mov edi, dword ptr [esi + 0x1c]
    mov dword ptr [esp + 0x14], 0
    jle L0
    mov ecx, dword ptr [esp + 0x20]
    push ebp
    push ecx
    xor ebx, ebx
    call sub_100080d0
    mov eax, dword ptr [esp + 0x1c]
    mov ecx, dword ptr [esi + 0x18]
    add esp, 8
    inc eax
    inc edi
    cmp eax, ecx
    mov dword ptr [esp + 0x14], eax
    jl L5
    mov al, byte ptr g_101ce5ed
    test al, al
    je L6
    mov edx, dword ptr [esp + 0x20]
    mov eax, dword ptr [esp + 0x1c]
    push ebp
    push edx
    call sub_100083a0
    add esp, 8
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 8
    ret
    }
}
