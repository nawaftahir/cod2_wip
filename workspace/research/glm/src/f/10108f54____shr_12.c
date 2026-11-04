
__declspec(naked) void ___shr_12(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    mov edx, dword ptr [eax + 8]
    mov ecx, dword ptr [eax + 4]
    push esi
    push edi
    mov edi, ecx
    mov esi, edx
    shr ecx, 1
    shl esi, 0x1f
    or ecx, esi
    mov dword ptr [eax + 4], ecx
    mov ecx, dword ptr [eax]
    shl edi, 0x1f
    shr ecx, 1
    or ecx, edi
    shr edx, 1
    pop edi
    mov dword ptr [eax + 8], edx
    mov dword ptr [eax], ecx
    pop esi
    ret
    }
}
