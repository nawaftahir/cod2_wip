; FUN_100228d0 @ 0x100228d0 — auto-synthesized
    EXTRN g_101d1bf8:DWORD
    EXTRN g_101d4878:DWORD
    sub_10061d2c PROTO C
    sub_100efe81 PROTO C
.CODE
FUN_100228d0 PROC
    push ecx
    mov eax, dword ptr [g_101d4878]
    test eax, eax
    je L0
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 4]
    mov eax, dword ptr [g_101d4878]
    pop ecx
    ret
    mov eax, dword ptr [g_101d1bf8]
    mov edx, dword ptr [eax]
    push 0
    lea ecx, [esp + 4]
    push ecx
    push 0
    push 0
    push 0
    push 0x4b
    push 0x80
    push 0x80
    push eax
    call dword ptr [edx + 0x74]
    test eax, eax
    jge L1
    push eax
    call sub_100efe81
    push eax
    push 0x80
    push 0x80
    push 0x10196b6c
    push 0
    call sub_10061d2c
    add esp, 0x14
    mov eax, dword ptr [esp]
    pop ecx
    ret
FUN_100228d0 ENDP
END