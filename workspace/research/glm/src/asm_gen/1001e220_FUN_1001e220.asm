; FUN_1001e220 @ 0x1001e220 — auto-synthesized
    EXTRN g_101ce7c8:DWORD
    sub_1001da96 PROTO C
    sub_1001de8d PROTO C
.CODE
FUN_1001e220 PROC
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101ce7c8]
    test byte ptr [eax + 8], 1
    je L0
    push ebx
    mov eax, edi
    call sub_1001da96
    add esp, 4
    mov ecx, dword ptr [g_101ce7c8]
    test byte ptr [ecx + 8], 2
    je L1
    push ebx
    mov eax, edi
    call sub_1001de8d
    add esp, 4
    pop esi
    ret
FUN_1001e220 ENDP
END