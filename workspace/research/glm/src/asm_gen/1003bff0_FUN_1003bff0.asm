; FUN_1003bff0 @ 0x1003bff0 — auto-synthesized
    EXTRN g_101ce684:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_1072debd:DWORD
    sub_1002e3b4 PROTO C
    sub_1003b596 PROTO C
    sub_1003bf4f PROTO C
.CODE
FUN_1003bff0 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101ce684]
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L0
    mov ecx, dword ptr [g_101d1b9c]
    mov al, byte ptr [ecx + 0x160]
    test al, al
    je L0
    mov al, byte ptr [g_1072debd]
    test al, al
    je L1
    call sub_1002e3b4
    lea esi, [esi + esi*2]
    shl esi, 4
    add esi, 0x10764590
    push esi
    call sub_1003b596
    add esp, 4
    push esi
    call sub_1003bf4f
    add esp, 4
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_1003bff0 ENDP
END