; FUN_1000cf90 @ 0x1000cf90 — auto-synthesized
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d496b:DWORD
    sub_10013930 PROTO C
    sub_100efe93 PROTO C
.CODE
FUN_1000cf90 PROC
    push ebx
    mov ebx, ecx
    mov word ptr [esi + 0x18], ax
    mov word ptr [esi + 0x1a], ax
    mov word ptr [esi + 0x1c], 1
    mov dword ptr [esi], 5
    mov cl, byte ptr [g_101d496b]
    test cl, cl
    push ebp
    mov ebp, dword ptr [esp + 0xc]
    push edi
    jne L0
    mov ebx, 1
    mov ecx, dword ptr [g_101d1bf8]
    mov edx, dword ptr [ecx]
    push 0
    lea edi, [esi + 4]
    push edi
    mov edi, dword ptr [esp + 0x1c]
    push edi
    push ebp
    push 0
    movzx eax, ax
    push ebx
    push eax
    push ecx
    call dword ptr [edx + 0x64]
    mov edi, eax
    test edi, edi
    jge L1
    push edi
    call sub_100efe93
    movzx ecx, word ptr [esi + 0x18]
    mov edx, dword ptr [esi + 0x20]
    push eax
    push edi
    push ebp
    push ebx
    push ecx
    push edx
    push 0x10193560
    push 1
    call sub_10013930
    add esp, 0x20
    pop edi
    pop ebp
    pop ebx
    ret
FUN_1000cf90 ENDP
END