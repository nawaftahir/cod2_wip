; FUN_10012198 @ 0x10012198 — auto-synthesized
    EXTRN fp_101d49c8:DWORD
    EXTRN g_101d1bf8:DWORD
    sub_1003c307 PROTO C
    sub_100efe65 PROTO C
.CODE
FUN_10012198 PROC
    push ebx
    push esi
    push edi
    mov ebx, 0x107645bc
    xor esi, esi
    lea edi, [ebx - 8]
    mov eax, dword ptr [g_101d1bf8]
    mov edx, dword ptr [eax]
    push edi
    push 9
    push eax
    call dword ptr [edx + 0x1d8]
    test eax, eax
    jge L0
    push eax
    push eax
    call sub_100efe65
    push eax
    push 0x10193cd8
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 0x10
    mov byte ptr [ebx + esi], 0
    inc esi
    add edi, 4
    cmp esi, 2
    jl L1
    add ebx, 0x30
    cmp ebx, 0x1076467c
    jl L2
    push 0x10193cbc
    push 0
    call dword ptr [fp_101d49c8]
    add esp, 8
    call sub_1003c307
    pop edi
    pop esi
    mov al, 1
    pop ebx
    ret
FUN_10012198 ENDP
END