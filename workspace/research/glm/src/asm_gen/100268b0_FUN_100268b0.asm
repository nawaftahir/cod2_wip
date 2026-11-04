; FUN_100268b0 @ 0x100268b0 — auto-synthesized
    EXTRN fp_101d49dc:DWORD
    EXTRN g_101ce668:DWORD
    EXTRN g_101d4928:DWORD
    EXTRN g_101d492a:DWORD
    EXTRN g_101d4c94:DWORD
    sub_10012040 PROTO C
    sub_10025ebd PROTO C
    sub_10026735 PROTO C
.CODE
FUN_100268b0 PROC
    push ebx
    movzx ebx, word ptr [g_101d4928]
    imul ebx, ebx
    push edi
    shl ebx, 2
    push ebx
    call dword ptr [fp_101d49dc]
    movzx edx, word ptr [g_101d4928]
    mov edi, eax
    mov eax, dword ptr [esp + 0x10]
    push edi
    mov dword ptr [eax*4 + 0x10696bb0], edi
    movzx eax, word ptr [g_101d492a]
    push 4
    push edx
    push edx
    mov ecx, eax
    call sub_10025ebd
    add esp, 0x14
    call sub_10026735
    mov ecx, dword ptr [g_101ce668]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    jle L0
    mov al, byte ptr [g_101d4c94]
    test al, al
    je L0
    call sub_10012040
    pop edi
    pop ebx
    ret
FUN_100268b0 ENDP
END