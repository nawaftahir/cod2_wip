; FUN_1003a580 @ 0x1003a580 — auto-synthesized
    EXTRN g_101ce708:DWORD
    EXTRN g_1072d9c0:DWORD
    EXTRN g_1072debc:DWORD
    sub_10034947 PROTO C
    sub_1003a06b PROTO C
    sub_1003a363 PROTO C
    sub_1003e9bf PROTO C
.CODE
FUN_1003a580 PROC
    mov al, byte ptr [g_1072debc]
    test al, al
    push esi
    je L0
    call sub_1003e9bf
    mov eax, dword ptr [g_1072d9c0]
    cmp eax, 6
    jl L1
    cmp eax, 0x11
    jg L1
    call sub_1003a363
    mov eax, dword ptr [g_1072d9c0]
    cmp eax, 3
    jl L2
    cmp eax, 0x1a
    jg L2
    call sub_10034947
    mov eax, dword ptr [g_1072d9c0]
    mov edx, dword ptr [g_101ce708]
    mov esi, dword ptr [edx + 8]
    xor ecx, ecx
    cmp esi, 2
    jne L3
    cmp eax, 9
    jl L3
    cmp eax, 0xe
    jg L3
    mov ecx, 0x10190690
    mov edx, dword ptr [esp + 8]
    push ecx
    mov ecx, dword ptr [esp + 0x10]
    push ecx
    push edx
    call sub_1003a06b
    add esp, 0xc
    pop esi
    ret
FUN_1003a580 ENDP
END