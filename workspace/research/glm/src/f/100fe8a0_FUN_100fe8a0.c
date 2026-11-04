
__declspec(naked) void FUN_100fe8a0(void)
{
    __asm {
    mov ecx, dword ptr [esp + 4]
    push edi
    test ecx, 3
    je L0
    mov al, byte ptr [ecx]
    add ecx, 1
    test al, al
    je L1
    test ecx, 3
    jne L2
    mov edi, edi
    mov eax, dword ptr [ecx]
    mov edx, 0x7efefeff
    add edx, eax
    xor eax, 0xffffffff
    xor eax, edx
    add ecx, 4
    test eax, 0x81010100
    je L0
    mov eax, dword ptr [ecx - 4]
    test al, al
    je L3
    test ah, ah
    je L4
    test eax, 0xff0000
    je L5
    test eax, 0xff000000
    je L1
    jmp L0
    lea edi, [ecx - 1]
    jmp L6
    lea edi, [ecx - 2]
    jmp L6
    lea edi, [ecx - 3]
    jmp L6
    lea edi, [ecx - 4]
    mov ecx, dword ptr [esp + 0xc]
    test ecx, 3
    je L7
    mov dl, byte ptr [ecx]
    add ecx, 1
    test dl, dl
    je L8
    mov byte ptr [edi], dl
    add edi, 1
    test ecx, 3
    jne L9
    jmp L7
    mov dword ptr [edi], edx
    add edi, 4
    mov edx, 0x7efefeff
    mov eax, dword ptr [ecx]
    add edx, eax
    xor eax, 0xffffffff
    xor eax, edx
    mov edx, dword ptr [ecx]
    add ecx, 4
    test eax, 0x81010100
    je L10
    test dl, dl
    je L8
    test dh, dh
    je L11
    test edx, 0xff0000
    je L12
    test edx, 0xff000000
    je L13
    jmp L10
    mov dword ptr [edi], edx
    mov eax, dword ptr [esp + 8]
    pop edi
    ret
    mov word ptr [edi], dx
    mov eax, dword ptr [esp + 8]
    mov byte ptr [edi + 2], 0
    pop edi
    ret
    mov word ptr [edi], dx
    mov eax, dword ptr [esp + 8]
    pop edi
    ret
    mov byte ptr [edi], dl
    mov eax, dword ptr [esp + 8]
    pop edi
    ret
    }
}
