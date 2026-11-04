; FUN_1002baf0 @ 0x1002baf0 — auto-synthesized
    EXTRN g_106a3104:DWORD
    EXTRN g_106a312c:DWORD
    sub_1002aae3 PROTO C
    sub_1002ba0e PROTO C
.CODE
FUN_1002baf0 PROC
    mov eax, dword ptr [g_106a312c]
    test eax, eax
    je L0
    cmp eax, 0x106a3128
    je L1
    push esi
    push edi
    push 4
    push 0
    push eax
    push 0x10696d00
    mov esi, eax
    call sub_1002aae3
    mov eax, dword ptr [g_106a312c]
    mov edx, dword ptr [eax + 4]
    mov edi, dword ptr [eax]
    lea ecx, [eax + 4]
    mov dword ptr [edx], edi
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [ecx]
    mov dword ptr [eax + 4], ecx
    lea eax, [esi + 0x88]
    mov dword ptr [eax], 0x106a3100
    mov edx, dword ptr [g_106a3104]
    mov dword ptr [eax + 4], edx
    mov dword ptr [g_106a3104], eax
    mov ecx, dword ptr [eax + 4]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [g_106a312c]
    add esp, 0x10
    cmp eax, 0x106a3128
    jne L2
    pop edi
    pop esi
    jmp sub_1002ba0e
    ret
FUN_1002baf0 ENDP
END