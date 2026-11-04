; R_LoadWorld @ 0x10001690 — auto-synthesized
    EXTRN fp_101d49d4:DWORD
    EXTRN g_101ce708:DWORD
    EXTRN g_101d1b9c:DWORD
    EXTRN g_101d1ba0:DWORD
    EXTRN g_101d49b8:DWORD
    EXTRN g_10696bd0:DWORD
    EXTRN g_10696bd4:DWORD
    sub_10001413 PROTO C
    sub_100014ce PROTO C
    sub_10001630 PROTO C
    sub_100048aa PROTO C
    sub_1000d29a PROTO C
    sub_10029168 PROTO C
    sub_100376d1 PROTO C
.CODE
R_LoadWorld PROC
    push ebp
    mov ebp, esp
    and esp, 0xfffffff8
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    push esi
    call sub_100376d1
    add esp, 4
    push esi
    call sub_100048aa
    mov ecx, dword ptr [ebp + 0xc]
    add esp, 4
    test ecx, ecx
    mov dword ptr [g_101d1b9c], eax
    je L0
    mov eax, dword ptr [eax + 0x154]
    mov dword ptr [ecx], eax
    mov eax, dword ptr [g_101d1b9c]
    lea esi, [eax + 0x34]
    call sub_100014ce
    call sub_10001413
    call sub_10029168
    push 0xc0000
    xor ecx, ecx
    mov eax, 8
    mov edi, 0x10696bd0
    mov dword ptr [g_10696bd0], 0x41200000
    mov dword ptr [g_10696bd4], 0xffffffff
    call dword ptr [fp_101d49d4]
    add esp, 4
    mov dword ptr [g_101d49b8], eax
    call sub_10001630
    mov ecx, dword ptr [g_101ce708]
    cmp dword ptr [ecx + 8], 2
    jne L1
    push 1
    xor eax, eax
    mov esi, 0x101825b4
    call sub_1000d29a
    add esp, 4
    mov dword ptr [g_101d1ba0], eax
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
R_LoadWorld ENDP
END