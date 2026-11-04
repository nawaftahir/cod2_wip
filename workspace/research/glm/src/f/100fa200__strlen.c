
__declspec(naked) void _strlen(void)
{
    __asm {
    mov ecx, dword ptr [esp + 4]
    test ecx, 3
    je L6
    mov al, byte ptr [ecx]
    add ecx, 1
    test al, al
    je L6
    test ecx, 3
    jne L6
    add eax, 0
    lea esp, [esp]
    lea esp, [esp]
    mov eax, dword ptr [ecx]
    mov edx, 0x7efefeff
    add edx, eax
    xor eax, 0xffffffff
    xor eax, edx
    add ecx, 4
    test eax, 0x81010100
    je L6
    mov eax, dword ptr [ecx - 4]
    test al, al
    je L6
    test ah, ah
    je L6
    test eax, 0xff0000
    je L6
    test eax, 0xff000000
    je L6
    jmp L6
    lea eax, [ecx - 1]
    mov ecx, dword ptr [esp + 4]
    sub eax, ecx
    ret
    lea eax, [ecx - 2]
    mov ecx, dword ptr [esp + 4]
    sub eax, ecx
    ret
    lea eax, [ecx - 3]
    mov ecx, dword ptr [esp + 4]
    sub eax, ecx
    ret
    lea eax, [ecx - 4]
    mov ecx, dword ptr [esp + 4]
    sub eax, ecx
    ret
    }
}
