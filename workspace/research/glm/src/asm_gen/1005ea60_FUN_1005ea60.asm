; FUN_1005ea60 @ 0x1005ea60 — auto-synthesized
    sub_1005eb39 PROTO C
.CODE
FUN_1005ea60 PROC
    push ebp
    mov ebp, esp
    push ebx
    mov edx, dword ptr [ebp + 8]
    mov eax, dword ptr [ebp + 0xc]
    mov ecx, dword ptr [ebp + 0x10]
    and ecx, 0xfffffff8
    je L0
    sub ecx, 8
    jmp L1
    jmp L1
    lea esp, [esp]
    test dword ptr [edx + ecx*4 + 0x1c], ebx
    mov dword ptr [edx + ecx*4], eax
    mov dword ptr [edx + ecx*4 + 4], eax
    mov dword ptr [edx + ecx*4 + 8], eax
    mov dword ptr [edx + ecx*4 + 0xc], eax
    mov dword ptr [edx + ecx*4 + 0x10], eax
    mov dword ptr [edx + ecx*4 + 0x14], eax
    mov dword ptr [edx + ecx*4 + 0x18], eax
    mov dword ptr [edx + ecx*4 + 0x1c], eax
    sub ecx, 8
    jge L1
    mov ecx, dword ptr [ebp + 0x10]
    mov ebx, ecx
    and ecx, 7
    je sub_1005eb39
    and ebx, 0xfffffff8
    lea edx, [edx + ebx*4]
    test dword ptr [edx], eax
    cmp ecx, 4
    jl L2
    mov dword ptr [edx], eax
    mov dword ptr [edx + 4], eax
    mov dword ptr [edx + 8], eax
    mov dword ptr [edx + 0xc], eax
    add edx, 0x10
    sub ecx, 4
    cmp ecx, 2
    jl L3
    mov dword ptr [edx], eax
    mov dword ptr [edx + 4], eax
    add edx, 8
    sub ecx, 2
FUN_1005ea60 ENDP
END