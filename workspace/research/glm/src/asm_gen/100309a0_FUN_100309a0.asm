; FUN_100309a0 @ 0x100309a0 — auto-synthesized
    EXTRN g_101ce830:DWORD
    EXTRN g_1072d9d0:DWORD
    EXTRN g_1072d9e0:DWORD
    sub_1003095f PROTO C
    sub_1003096e PROTO C
    sub_1003a8ef PROTO C
.CODE
FUN_100309a0 PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push ecx
    mov eax, dword ptr [g_1072d9d0]
    test eax, eax
    push esi
    jne L0
    mov eax, dword ptr [g_1072d9e0]
    test eax, eax
    je L1
    call sub_1003a8ef
    mov eax, dword ptr [g_101ce830]
    mov ecx, dword ptr [eax + 8]
    xor esi, esi
    test ecx, ecx
    jle L2
    lea ecx, [ecx]
    push 0x3f7f0000
    push 0x3c400000
    call sub_1003095f
    push 0x3f7d0000
    push 0x3b800000
    call sub_1003096e
    mov ecx, dword ptr [g_101ce830]
    mov eax, dword ptr [ecx + 8]
    add esp, 0x10
    inc esi
    cmp esi, eax
    jl L3
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx]
    movzx edx, word ptr [eax + 2]
    add edx, eax
    mov dword ptr [ecx], edx
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_100309a0 ENDP
END