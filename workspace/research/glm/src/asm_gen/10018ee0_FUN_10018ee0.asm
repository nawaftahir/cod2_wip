; FUN_10018ee0 @ 0x10018ee0 — auto-synthesized
    EXTRN g_101aac70:DWORD
    sub_10018eef PROTO C
    sub_1005f3fb PROTO C
    sub_1005f6e9 PROTO C
    sub_1005fafe PROTO C
    sub_1005fb78 PROTO C
.CODE
FUN_10018ee0 PROC
    push 1
    push 0x101956f0
    mov ecx, esi
    call sub_1005fafe
    add esp, 8
    test eax, eax
    je L0
    mov eax, dword ptr [g_101aac70]
    imul eax, eax, 0x45c
    add eax, 0x101a66b0
    mov cl, byte ptr [eax + 0x404]
    test cl, cl
    je L1
    mov ecx, dword ptr [eax + 0x418]
    mov byte ptr [eax + 0x404], 0
    mov dword ptr [esi], ecx
    mov edx, dword ptr [eax + 0x414]
    mov dword ptr [eax + 0x400], edx
    push esi
    mov eax, 1
    call sub_1005f6e9
    mov cl, byte ptr [eax]
    add esp, 4
    test cl, cl
    je L2
    cmp cl, 0x3b
    je L2
    push edi
    mov edi, eax
    call sub_10018eef
    test eax, eax
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [ecx], eax
    pop edi
    je L0
    push 1
    push 0x10195820
    mov ecx, esi
    call sub_1005fb78
    add esp, 8
    test eax, eax
    setne al
    ret
    push 0x101956d4
    call sub_1005f3fb
    add esp, 4
    xor al, al
    ret
FUN_10018ee0 ENDP
END