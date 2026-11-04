extern int g_1042e778;

__declspec(naked) void R_BlendSavedScreen(void)
{
    __asm {
    mov eax, dword ptr g_1042e778
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    sub ecx, edx
    cmp ecx, 0x1c
    jge L_ok
    xor ecx, ecx
    mov dword ptr [eax + 0x30008], ecx
    jmp L_merge
L_ok:
    lea ecx, [edx + eax]
    add edx, 0x1c
    mov dword ptr [eax + 0x30000], edx
    add dword ptr [eax + 0x30004], 0x1c
    mov dword ptr [eax + 0x30008], ecx
    mov word ptr [ecx], 0xb
    mov word ptr [ecx + 2], 0x1c
L_merge:
    mov al, byte ptr [esp + 4]
    mov dl, byte ptr [esp + 0x10]
    mov byte ptr [ecx + 4], al
    mov eax, dword ptr [esp + 0xc]
    mov dword ptr [ecx + 8], eax
    mov eax, dword ptr [esp + 8]
    mov byte ptr [ecx + 5], dl
    mov edx, dword ptr [eax]
    mov dword ptr [ecx + 0xc], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 0x10], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 0x14], edx
    mov eax, dword ptr [eax + 0xc]
    mov dword ptr [ecx + 0x18], eax
    ret
    }
}
