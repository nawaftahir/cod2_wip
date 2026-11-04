extern void sub_1005ead4(void);

__declspec(naked) void FUN_1005ec20(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 0x10]
    cmp eax, 8
    mov edx, dword ptr [ebp + 0xc]
    push ebx
    jge L6
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 0xc]
    mov ah, al
    mov ebx, eax
    and ebx, 0xffff
    shl eax, 0x10
    add eax, ebx
    mov ecx, dword ptr [ebp + 0x10]
    cmp ecx, 4
    jl L6
    mov dword ptr [edx], eax
    add edx, 4
    sub ecx, 4
    cmp ecx, 2
    jl L6
    mov word ptr [edx], ax
    add edx, 2
    sub ecx, 2
    cmp ecx, 0
    je L6
    mov byte ptr [edx], al
    pop ebx
    mov esp, ebp
    pop ebp
    ret
    mov ecx, edx
    shl ecx, 8
    or ecx, edx
    mov edx, ecx
    shl edx, 0x10
    or ecx, edx
    cdq
    and edx, 3
    add eax, edx
    sar eax, 2
    push eax
    mov eax, dword ptr [ebp + 8]
    push ecx
    push eax
    mov dword ptr [ebp - 4], ecx
    call sub_1005ead4
    add esp, 0xc
    mov ecx, dword ptr [ebp + 0x10]
    mov eax, ecx
    and ecx, 3
    je L6
    and eax, 0xfffffffc
    mov ebx, dword ptr [ebp + 8]
    add ebx, eax
    mov eax, dword ptr [ebp - 4]
    cmp ecx, 2
    jl L6
    mov word ptr [ebx], ax
    cmp ecx, 2
    je L6
    mov byte ptr [ebx + 2], al
    jmp L6
    cmp ecx, 0
    je L6
    mov byte ptr [ebx], al
    pop ebx
    mov esp, ebp
    pop ebp
    ret
    }
}
