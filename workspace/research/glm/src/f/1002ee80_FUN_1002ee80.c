extern int g_1072d9b0;
extern int g_1072d9bc;
extern int g_1072d9c0;
extern int g_1072d9d0;
extern int g_1072d9d4;
extern int g_1072d9e0;
extern int g_1072debd;
extern void sub_1002df40(void);
extern void sub_1002e020(void);
extern void sub_1002e470(void);
extern void sub_1003a5f0(void);
extern void sub_1003a8d0(void);

__declspec(naked) void FUN_1002ee80(void)
{
    __asm {
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov al, byte ptr g_1072debd
    test al, al
    push ebx
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    mov ebx, dword ptr [edi]
    jne L0
    call sub_1002e020
    mov eax, dword ptr [ebx + 4]
    cmp dword ptr g_1072d9bc, eax
    mov dword ptr [esp + 0xc], eax
    mov esi, 3
    jne L1
    cmp dword ptr g_1072d9c0, esi
    je L2
    mov eax, dword ptr g_1072d9d0
    test eax, eax
    jne L3
    mov eax, dword ptr g_1072d9e0
    test eax, eax
    je L4
    call sub_1003a8d0
    mov edi, dword ptr [esp + 0xc]
    push 0x1f
    call sub_1003a5f0
    mov edi, dword ptr [ebp + 8]
    add esp, 4
    mov eax, dword ptr g_1072d9d4
    add eax, 4
    cmp eax, 0x154a
    jg L5
    mov ecx, dword ptr g_1072d9d0
    add ecx, 6
    cmp ecx, 0x100000
    jle L6
    call sub_1002df40
    mov edx, dword ptr g_1072d9d4
    mov esi, dword ptr g_1072d9d0
    mov ecx, esi
    mov eax, edx
    add edx, 4
    mov dword ptr g_1072d9d4, edx
    add esi, 6
    mov dword ptr g_1072d9d0, esi
    mov esi, dword ptr g_1072d9b0
    lea edx, [eax + 3]
    mov word ptr [esi + ecx*2], dx
    mov edx, dword ptr g_1072d9b0
    mov word ptr [edx + ecx*2 + 2], ax
    mov esi, dword ptr g_1072d9b0
    lea edx, [eax + 2]
    mov word ptr [esi + ecx*2 + 4], dx
    mov esi, dword ptr g_1072d9b0
    mov word ptr [esi + ecx*2 + 6], dx
    mov edx, dword ptr g_1072d9b0
    mov word ptr [edx + ecx*2 + 8], ax
    mov esi, dword ptr g_1072d9b0
    lea edx, [eax + 1]
    mov word ptr [esi + ecx*2 + 0xa], dx
    mov ecx, dword ptr [ebx + 8]
    push 0
    movzx esi, ax
    mov eax, dword ptr [ebx + 0xc]
    push 0
    push eax
    push ecx
    mov ecx, dword ptr [ebx + 0x28]
    mov eax, esi
    call sub_1002e470
    mov edx, dword ptr [ebx + 0x14]
    mov eax, dword ptr [ebx + 0x10]
    mov ecx, dword ptr [ebx + 0x28]
    push 0
    push 0x3f800000
    push edx
    push eax
    lea eax, [esi + 1]
    call sub_1002e470
    mov ecx, dword ptr [ebx + 0x1c]
    mov edx, dword ptr [ebx + 0x18]
    push 0x3f800000
    push 0x3f800000
    push ecx
    mov ecx, dword ptr [ebx + 0x28]
    push edx
    lea eax, [esi + 2]
    call sub_1002e470
    mov eax, dword ptr [ebx + 0x24]
    mov ecx, dword ptr [ebx + 0x20]
    push 0x3f800000
    push 0
    push eax
    push ecx
    mov ecx, dword ptr [ebx + 0x28]
    lea eax, [esi + 3]
    call sub_1002e470
    mov eax, dword ptr [edi]
    movzx edx, word ptr [eax + 2]
    add esp, 0x40
    add edx, eax
    mov dword ptr [edi], edx
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
    }
}
