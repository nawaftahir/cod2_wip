; FUN_100249c0 @ 0x100249c0 — auto-synthesized
    EXTRN g_101ce694:DWORD
    EXTRN g_101ce708:DWORD
    EXTRN g_101d4818:DWORD
    EXTRN g_101d489c:DWORD
    sub_10022279 PROTO C
    sub_10024969 PROTO C
.CODE
FUN_100249c0 PROC
    mov eax, dword ptr [g_101d4818]
    sub esp, 0x10
    test eax, eax
    push esi
    je L0
    mov eax, dword ptr [esp + 0x18]
    mov esi, 1
    cmp eax, esi
    je L1
    mov eax, dword ptr [g_101ce708]
    cmp dword ptr [eax + 8], 2
    je L0
    mov ecx, dword ptr [g_101ce694]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L0
    mov eax, dword ptr [g_101d489c]
    test eax, eax
    jne L1
    mov esi, 7
    lea eax, [esp + 4]
    call sub_10024969
    push 0
    push 0x3f800000
    mov edx, eax
    push edx
    push esi
    call sub_10022279
    add esp, 0x10
    pop esi
    add esp, 0x10
    ret
FUN_100249c0 ENDP
END