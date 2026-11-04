; FUN_1001f5b0 @ 0x1001f5b0 — auto-synthesized
    sub_1001d760 PROTO C
.CODE
FUN_1001f5b0 PROC
    mov eax, dword ptr [esp + 4]
    push ebx
    movzx ebx, byte ptr [eax + 0x1d]
    push esi
    xor esi, esi
    test ebx, ebx
    push edi
    mov edi, dword ptr [eax + 8]
    jle L0
    push ebp
    mov ebp, dword ptr [esp + 0x18]
    lea esp, [esp]
    mov ecx, esi
    and ecx, 0x1f
    mov edx, 1
    shl edx, cl
    mov ecx, esi
    sar ecx, 5
    test dword ptr [eax + ecx*4 + 0xc], edx
    je L1
    mov eax, ebp
    mov ecx, edi
    call sub_1001d760
    mov eax, dword ptr [esp + 0x14]
    inc esi
    add ebp, 0x40
    add edi, 0x20
    cmp esi, ebx
    jl L2
    pop ebp
    pop edi
    pop esi
    pop ebx
    ret
FUN_1001f5b0 ENDP
END