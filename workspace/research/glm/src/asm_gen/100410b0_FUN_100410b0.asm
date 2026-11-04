; FUN_100410b0 @ 0x100410b0 — auto-synthesized
    EXTRN g_101ce708:DWORD
    sub_1003fb67 PROTO C
    sub_1003fbbe PROTO C
    sub_1003fdfc PROTO C
    sub_100401e2 PROTO C
    sub_10040c27 PROTO C
    sub_10040f87 PROTO C
    sub_1004105e PROTO C
.CODE
FUN_100410b0 PROC
    push ecx
    mov ecx, dword ptr [eax]
    add ecx, -4
    cmp ecx, 5
    ja L0
    jmp dword ptr [ecx*4 + 0x1004110c]
    call sub_1003fb67
    pop ecx
    ret
    call sub_1003fbbe
    pop ecx
    ret
    mov ecx, eax
    call sub_10040c27
    pop ecx
    ret
    call sub_1004105e
    pop ecx
    ret
    mov ecx, dword ptr [g_101ce708]
    cmp dword ptr [ecx + 8], 2
    push eax
    jne L1
    call sub_100401e2
    add esp, 4
    pop ecx
    ret
    call sub_1003fdfc
    add esp, 4
    pop ecx
    ret
    push eax
    call sub_10040f87
    add esp, 4
    pop ecx
    ret
FUN_100410b0 ENDP
END