; __getptd @ 0x100fb114 — auto-synthesized
    EXTRN fp_1010c054:DWORD
    EXTRN fp_1010c0fc:DWORD
    EXTRN fp_1010c110:DWORD
    EXTRN fp_101addbc:DWORD
    EXTRN fp_101addc0:DWORD
    EXTRN g_101a4898:DWORD
    sub_100f7896 PROTO C
    sub_100fd7f1 PROTO C
.CODE
__getptd PROC
    push ebx
    push esi
    call dword ptr [fp_1010c054]
    push dword ptr [g_101a4898]
    mov ebx, eax
    call dword ptr [fp_101addbc]
    mov esi, eax
    test esi, esi
    jne L0
    push 0x8c
    push 1
    call sub_100fd7f1
    mov esi, eax
    test esi, esi
    pop ecx
    pop ecx
    je L1
    push esi
    push dword ptr [g_101a4898]
    call dword ptr [fp_101addc0]
    test eax, eax
    je L1
    mov dword ptr [esi + 0x54], 0x101a4e88
    mov dword ptr [esi + 0x14], 1
    call dword ptr [fp_1010c0fc]
    or dword ptr [esi + 4], 0xffffffff
    mov dword ptr [esi], eax
    jmp L0
    push 0x10
    call sub_100f7896
    pop ecx
    push ebx
    call dword ptr [fp_1010c110]
    mov eax, esi
    pop esi
    pop ebx
    ret
__getptd ENDP
END