extern void (__stdcall *fp_1010c094)(void);

__declspec(naked) void ___sbh_alloc_new_group(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 8]
    push ebx
    push esi
    mov esi, dword ptr [ecx + 0x10]
    push edi
    xor ebx, ebx
    jmp L0
    shl eax, 1
    inc ebx
    test eax, eax
    jge L1
    mov eax, ebx
    imul eax, eax, 0x204
    lea eax, [eax + esi + 0x144]
    push 0x3f
    mov dword ptr [ebp - 8], eax
    pop edx
    mov dword ptr [eax + 8], eax
    mov dword ptr [eax + 4], eax
    add eax, 8
    dec edx
    jne L2
    push 4
    mov edi, ebx
    push 0x1000
    shl edi, 0xf
    add edi, dword ptr [ecx + 0xc]
    push 0x8000
    push edi
    call fp_1010c094
    test eax, eax
    jne L3
    or eax, 0xffffffff
    jmp L4
    lea edx, [edi + 0x7000]
    cmp edi, edx
    mov dword ptr [ebp - 4], edx
    ja L5
    mov ecx, edx
    sub ecx, edi
    shr ecx, 0xc
    lea eax, [edi + 0x10]
    inc ecx
    or dword ptr [eax - 8], 0xffffffff
    or dword ptr [eax + 0xfec], 0xffffffff
    lea edx, [eax + 0xffc]
    mov dword ptr [eax], edx
    lea edx, [eax - 0x1004]
    mov dword ptr [eax - 4], 0xff0
    mov dword ptr [eax + 4], edx
    mov dword ptr [eax + 0xfe8], 0xff0
    add eax, 0x1000
    dec ecx
    jne L6
    mov edx, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 8]
    add eax, 0x1f8
    lea ecx, [edi + 0xc]
    mov dword ptr [eax + 4], ecx
    mov dword ptr [ecx + 8], eax
    lea ecx, [edx + 0xc]
    mov dword ptr [eax + 8], ecx
    mov dword ptr [ecx + 4], eax
    and dword ptr [esi + ebx*4 + 0x44], 0
    xor edi, edi
    inc edi
    mov dword ptr [esi + ebx*4 + 0xc4], edi
    mov al, byte ptr [esi + 0x43]
    mov cl, al
    inc cl
    test al, al
    mov eax, dword ptr [ebp + 8]
    mov byte ptr [esi + 0x43], cl
    jne L7
    or dword ptr [eax + 4], edi
    mov edx, 0x80000000
    mov ecx, ebx
    shr edx, cl
    not edx
    and dword ptr [eax + 8], edx
    mov eax, ebx
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}
