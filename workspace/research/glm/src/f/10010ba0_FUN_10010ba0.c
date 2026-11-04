
__declspec(naked) void FUN_10010ba0(void)
{
    __asm {
    push ebx
    mov dx, word ptr [eax + 2]
    xor ebx, ebx
    push ebp
    push esi
    mov esi, dword ptr [eax + 4]
    mov cx, di
    shr word ptr [eax], cl
    mov bh, byte ptr [esi + 3]
    movzx ecx, byte ptr [esi + 1]
    mov bp, word ptr [eax]
    mov bl, byte ptr [esi + 2]
    shl ebx, 8
    or ebx, ecx
    movzx ecx, byte ptr [esi]
    shl ebx, 8
    or ebx, ecx
    mov cl, dl
    shr ebx, cl
    mov ecx, 0x10
    sub ecx, edi
    shl ebx, cl
    lea ecx, [edx + edi]
    movzx edx, cx
    shr edx, 3
    add edx, esi
    or ebx, ebp
    pop esi
    and ecx, 7
    pop ebp
    mov word ptr [eax], bx
    mov dword ptr [eax + 4], edx
    mov word ptr [eax + 2], cx
    pop ebx
    ret
    }
}
