; FUN_10038920 @ 0x10038920 — auto-synthesized
    EXTRN g_101ce700:DWORD
    EXTRN g_101ce7a0:DWORD
    EXTRN g_101ce7f0:DWORD
    EXTRN g_101d1b10:DWORD
    sub_1002c969 PROTO C
    sub_10038914 PROTO C
    sub_10038922 PROTO C
.CODE
FUN_10038920 PROC
    push ecx
    mov eax, dword ptr [edx]
    cmp dword ptr [eax], 3
    jne L0
    movzx ecx, byte ptr [edi + 5]
    cmp ecx, 5
    ja L0
    jmp dword ptr [ecx*4 + 0x10038984]
    mov eax, dword ptr [g_101ce7a0]
    mov ecx, esi
    call sub_10038914
    pop ecx
    ret
    mov eax, dword ptr [g_101ce700]
    mov ecx, esi
    call sub_10038922
    pop ecx
    ret
    mov eax, dword ptr [g_101ce7f0]
    cmp dword ptr [eax + 8], 1
    jne L0
    mov ecx, dword ptr [g_101d1b10]
    mov dword ptr [edx], ecx
    mov byte ptr [esi], 1
    pop ecx
    ret
    mov edx, dword ptr [edi + 8]
    mov ecx, dword ptr [edx + 0x1c]
    push ecx
    push eax
    call sub_1002c969
    add esp, 8
    mov byte ptr [esi], 6
    pop ecx
    ret
FUN_10038920 ENDP
END