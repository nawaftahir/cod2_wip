extern int g_101d49b8;

__declspec(naked) void FUN_1002b790(void)
{
    __asm {
    mov edx, dword ptr [eax + 8]
    mov eax, dword ptr [eax]
    mov ecx, dword ptr g_101d49b8
    push esi
    mov esi, dword ptr [edx + 8]
    push edi
    mov edi, eax
    shl edi, 0x10
    or edi, eax
    lea eax, [eax + eax*2]
    lea ecx, [ecx + eax*4]
    movsx eax, word ptr [edx + 4]
    cdq
    sub eax, edx
    sar eax, 1
    mov edx, dword ptr [esi]
    add edx, edi
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esi + 4]
    add esi, 4
    add ecx, 4
    add edx, edi
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esi + 4]
    add esi, 4
    add ecx, 4
    add edx, edi
    mov dword ptr [ecx], edx
    add ecx, 4
    add esi, 4
    dec eax
    jne L1
    pop edi
    pop esi
    ret
    }
}
