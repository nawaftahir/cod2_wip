extern int g_1019bc78;
extern int g_1019bd80;

__declspec(naked) void FUN_100259a0(void)
{
    __asm {
    sub esp, 0x44
    fild dword ptr [esp + 0x48]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 0x54]
    fdivr dword ptr g_1019bc78
    imul ebp, dword ptr [esp + 0x58]
    test ecx, ecx
    push esi
    push edi
    mov dword ptr [esp + 0x14], ebp
    mov esi, ecx
    fstp dword ptr [esp + 0x5c]
    jle L0
    fld qword ptr g_1019bd80
    mov dword ptr [esp + 0x18], ecx
    fstp qword ptr [esp + 0x28]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x30]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x38]
    mov edi, edi
    movzx ebx, byte ptr [eax + 2]
    movzx edx, byte ptr [eax]
    imul ebx, esi
    movzx edi, byte ptr [eax + 1]
    imul edx, esi
    mov dword ptr [esp + 0x4c], ebx
    imul edi, esi
    add eax, ebp
    mov ebp, dword ptr [esp + 0x58]
    mov ebx, esi
    sub ebx, ebp
    add ebx, ecx
    test ebx, ebx
    jg L1
    mov ebp, dword ptr [esp + 0x4c]
    mov dword ptr [esp + 0x60], ebx
    movzx ebx, byte ptr [eax]
    imul ebx, ecx
    add edx, ebx
    movzx ebx, byte ptr [eax + 1]
    imul ebx, ecx
    add edi, ebx
    movzx ebx, byte ptr [eax + 2]
    add eax, dword ptr [esp + 0x14]
    imul ebx, ecx
    add ebp, ebx
    mov ebx, dword ptr [esp + 0x60]
    add ebx, ecx
    add esi, ecx
    test ebx, ebx
    mov dword ptr [esp + 0x60], ebx
    jle L2
    mov dword ptr [esp + 0x4c], ebp
    mov ebp, dword ptr [esp + 0x58]
    mov ebx, ecx
    sub ebx, ebp
    movzx ebp, byte ptr [eax]
    add esi, ebx
    mov ebx, ecx
    sub ebx, esi
    imul ebp, ebx
    add edx, ebp
    mov dword ptr [esp + 0x44], edx
    movzx edx, byte ptr [eax + 1]
    fild dword ptr [esp + 0x44]
    mov ebp, dword ptr [esp + 0x4c]
    imul edx, ebx
    fmul dword ptr [esp + 0x5c]
    fstp dword ptr [esp + 0x60]
    add edi, edx
    movzx edx, byte ptr [eax + 2]
    imul edx, ebx
    add ebp, edx
    mov dword ptr [esp + 0x48], edi
    mov dword ptr [esp + 0x4c], ebp
    fld dword ptr [esp + 0x60]
    fadd qword ptr [esp + 0x28]
    fistp dword ptr [esp + 0x1c]
    mov dl, byte ptr [esp + 0x1c]
    fild dword ptr [esp + 0x48]
    mov edi, dword ptr [esp + 0x64]
    mov byte ptr [edi], dl
    fmul dword ptr [esp + 0x5c]
    fstp dword ptr [esp + 0x60]
    fld dword ptr [esp + 0x60]
    fadd qword ptr [esp + 0x30]
    fistp dword ptr [esp + 0x20]
    fild dword ptr [esp + 0x4c]
    mov dl, byte ptr [esp + 0x20]
    mov byte ptr [edi + 1], dl
    fmul dword ptr [esp + 0x5c]
    fstp dword ptr [esp + 0x60]
    fld dword ptr [esp + 0x60]
    fadd qword ptr [esp + 0x38]
    fistp dword ptr [esp + 0x24]
    mov dl, byte ptr [esp + 0x24]
    mov ebp, dword ptr [esp + 0x14]
    mov byte ptr [edi + 2], dl
    mov edx, dword ptr [esp + 0x18]
    add edi, ebp
    dec edx
    mov dword ptr [esp + 0x64], edi
    mov dword ptr [esp + 0x18], edx
    jne L3
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 0x44
    ret
    }
}
