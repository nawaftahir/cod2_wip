; FUN_10031420 @ 0x10031420 — auto-synthesized
    EXTRN g_1072debd:DWORD
    sub_10030dfd PROTO C
    sub_100310a4 PROTO C
.CODE
FUN_10031420 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov cl, byte ptr [g_1072debd]
    test cl, cl
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    push eax
    je L0
    call sub_10030dfd
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add esp, 4
    add ecx, eax
    mov dword ptr [esi], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
    call sub_100310a4
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add esp, 4
    add ecx, eax
    mov dword ptr [esi], ecx
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_10031420 ENDP
END