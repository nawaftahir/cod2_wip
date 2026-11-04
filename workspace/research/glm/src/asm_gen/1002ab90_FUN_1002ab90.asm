; FUN_1002ab90 @ 0x1002ab90 — auto-synthesized
    EXTRN g_101da9c8:DWORD
    sub_1002aae5 PROTO C
.CODE
FUN_1002ab90 PROC
    mov eax, dword ptr [g_101da9c8]
    mov ecx, dword ptr [eax]
    push esi
    mov esi, dword ptr [edi + 0xc428]
    sub ecx, dword ptr [esi + 8]
    cmp ecx, 3
    jge L0
    xor al, al
    pop esi
    ret
    push 4
    push 0
    push esi
    push edi
    call sub_1002aae5
    mov edx, dword ptr [esi + 4]
    mov eax, dword ptr [esi]
    mov dword ptr [edx], eax
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 4]
    mov dword ptr [ecx + 4], edx
    lea eax, [esi + 0x88]
    lea ecx, [edi + 0xc400]
    mov dword ptr [eax], ecx
    mov edx, dword ptr [ecx + 4]
    mov dword ptr [eax + 4], edx
    mov dword ptr [ecx + 4], eax
    mov ecx, dword ptr [eax + 4]
    add esp, 0x10
    mov dword ptr [ecx], eax
    mov al, 1
    pop esi
    ret
FUN_1002ab90 ENDP
END