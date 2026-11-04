extern void sub_10031d20(void);

__declspec(naked) void FUN_10031e90(void)
{
    __asm {
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 0x10]
    mov edx, dword ptr [esi]
    push edi
    mov di, word ptr [edx + 0xe]
    movsx eax, di
    lea ecx, [eax + 1]
    shl ecx, 4
    lea ebx, [eax + eax*2]
    lea ebx, [ecx + ebx*4]
    lea ebp, [ebx + eax*4]
    mov dword ptr [esp + 0x14], ebp
    add ebp, edx
    push ebp
    add ecx, edx
    add ebx, edx
    push ebx
    push ecx
    lea ecx, [edx + 0x10]
    push ecx
    mov ecx, dword ptr [esp + 0x24]
    lea eax, [ecx + eax*8]
    mov ecx, dword ptr [edx + 8]
    add eax, edx
    push edi
    push eax
    mov ax, word ptr [edx + 0xc]
    mov edx, dword ptr [edx + 4]
    call sub_10031d20
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add esp, 0x18
    pop edi
    add ecx, eax
    mov dword ptr [esi], ecx
    pop esi
    pop ebp
    pop ebx
    ret
    }
}
