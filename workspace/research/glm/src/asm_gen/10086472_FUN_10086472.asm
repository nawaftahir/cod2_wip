; FUN_10086472 @ 0x10086472 — auto-synthesized
    sub_10086314 PROTO C
    sub_100f5e10 PROTO C
    sub_100f78be PROTO C
.CODE
FUN_10086472 PROC
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x40
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi + 0x68]
    push edi
    push 0x3f
    push dword ptr [eax + 0x18]
    lea eax, [ebp - 0x40]
    push eax
    mov edi, ecx
    call sub_100f5e10
    add esp, 0xc
    lea eax, [ebp - 0x40]
    push eax
    push esi
    mov ecx, edi
    mov byte ptr [ebp - 1], 0
    call sub_10086314
    mov esi, dword ptr [ebp + 0x10]
    mov edi, dword ptr [ebp + 0xc]
    push eax
    push 0x1011040c
    push esi
    push edi
    call sub_100f78be
    add esp, 0x14
    mov byte ptr [edi + esi - 1], 0
    pop edi
    xor eax, eax
    pop esi
    leave
    ret 0xc
FUN_10086472 ENDP
END