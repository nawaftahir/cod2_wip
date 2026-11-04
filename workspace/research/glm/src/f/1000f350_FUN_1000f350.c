
__declspec(naked) void FUN_1000f350(void)
{
    __asm {
    push ebx
    push esi
    mov esi, edx
    mov dl, 0xff
    mov bl, byte ptr [ecx]
    mov byte ptr [eax], bl
    mov bl, byte ptr [ecx + 1]
    mov byte ptr [eax + 1], bl
    mov bl, byte ptr [ecx + 2]
    mov byte ptr [eax + 2], bl
    mov byte ptr [eax + 3], dl
    add eax, 4
    add ecx, 3
    dec esi
    jne L1
    pop esi
    pop ebx
    ret
    }
}
