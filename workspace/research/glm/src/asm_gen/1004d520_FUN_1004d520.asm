; FUN_1004d520 @ 0x1004d520 — auto-synthesized
.CODE
FUN_1004d520 PROC
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi + 0x198]
    mov dword ptr [eax], 0x1004d460
    mov byte ptr [eax + 0x10], 0
    mov byte ptr [eax + 0x11], 0
    mov byte ptr [eax + 0x14], 1
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax + 0x10]
    mov ecx, dword ptr [esi + 0x19c]
    push esi
    call dword ptr [ecx]
    add esp, 8
    mov dword ptr [esi + 0x94], 0
    pop esi
    ret
FUN_1004d520 ENDP
END