
__declspec(naked) void FUN_10082999(void)
{
    __asm {
    mov edx, dword ptr [ecx]
    cmp edx, dword ptr [eax]
    je L0
    xor eax, eax
    ret
    cmp edx, 8
    push esi
    jg L1
    cmp edx, 5
    jge L2
    test edx, edx
    je L3
    cmp edx, 1
    je L4
    jle L5
    cmp edx, 4
    jg L5
    mov ecx, dword ptr [ecx + 8]
    cmp ecx, dword ptr [eax + 8]
    je L5
    xor eax, eax
    pop esi
    ret
    lea esi, [eax + 8]
    lea eax, [ecx + 8]
    mov dl, byte ptr [eax]
    mov cl, dl
    cmp dl, byte ptr [esi]
    jne L6
    test cl, cl
    je L7
    mov dl, byte ptr [eax + 1]
    mov cl, dl
    cmp dl, byte ptr [esi + 1]
    jne L6
    inc eax
    inc eax
    inc esi
    inc esi
    test cl, cl
    jne L8
    xor eax, eax
    jmp L9
    fld qword ptr [eax + 8]
    fld qword ptr [ecx + 8]
    fucompp
    fnstsw ax
    test ah, 0x44
    jp L10
    xor eax, eax
    inc eax
    pop esi
    ret
    sub edx, 9
    je L11
    dec edx
    jne L5
    mov esi, dword ptr [eax + 8]
    mov ecx, dword ptr [ecx + 8]
    mov dl, byte ptr [ecx]
    mov al, dl
    cmp dl, byte ptr [esi]
    jne L6
    test al, al
    je L7
    mov dl, byte ptr [ecx + 1]
    mov al, dl
    cmp dl, byte ptr [esi + 1]
    jne L6
    inc ecx
    inc ecx
    inc esi
    inc esi
    test al, al
    jne L12
    jmp L7
    mov esi, dword ptr [eax + 8]
    mov ecx, dword ptr [ecx + 8]
    mov dl, byte ptr [ecx]
    mov al, dl
    cmp dl, byte ptr [esi]
    jne L6
    test al, al
    je L7
    mov dl, byte ptr [ecx + 1]
    mov al, dl
    cmp dl, byte ptr [esi + 1]
    jne L6
    inc ecx
    inc ecx
    inc esi
    inc esi
    test al, al
    jne L13
    jmp L7
    sbb eax, eax
    sbb eax, -1
    test eax, eax
    jmp L14
    }
}
