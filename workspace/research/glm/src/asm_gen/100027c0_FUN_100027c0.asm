; FUN_100027c0 @ 0x100027c0 — auto-synthesized
    sub_10061d32 PROTO C
.CODE
FUN_100027c0 PROC
    push ebp
    push esi
    xor esi, esi
    xor edx, edx
    test edi, edi
    jle L0
    add eax, 6
    lea ecx, [ecx]
    mov ecx, dword ptr [eax - 6]
    cmp ecx, dword ptr [esp + 0xc]
    jne L1
    mov ecx, dword ptr [eax + 2]
    mov ebp, dword ptr [ecx + 0x1c]
    cmp ebp, dword ptr [ebx + 0x1c]
    jne L2
    mov cx, word ptr [ecx + 0x20]
    cmp cx, word ptr [ebx + 0x20]
    je L3
    xor ecx, ecx
    mov cx, word ptr [eax]
    cmp si, cx
    ja L1
    lea esi, [ecx + 1]
    inc edx
    add eax, 0xc
    cmp edx, edi
    jl L4
    cmp si, 0x800
    jb L0
    mov edx, dword ptr [esp + 0xc]
    mov eax, dword ptr [edx]
    push 0x800
    push eax
    push 0x10191a08
    push 1
    call sub_10061d32
    add esp, 0x10
    mov ax, si
    pop esi
    pop ebp
    ret
    mov ax, word ptr [eax]
    pop esi
    pop ebp
    ret
FUN_100027c0 ENDP
END