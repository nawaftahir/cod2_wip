
__declspec(naked) void ___shl_12(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    push esi
    mov esi, dword ptr [eax]
    mov ecx, esi
    add esi, esi
    push edi
    mov edi, dword ptr [eax + 4]
    shr ecx, 0x1f
    mov dword ptr [eax], esi
    lea esi, [edi + edi]
    or esi, ecx
    mov ecx, dword ptr [eax + 8]
    mov edx, edi
    shr edx, 0x1f
    shl ecx, 1
    or ecx, edx
    pop edi
    mov dword ptr [eax + 4], esi
    mov dword ptr [eax + 8], ecx
    pop esi
    ret
    }
}
