; FUN_1005f2d0 @ 0x1005f2d0 — auto-synthesized
    EXTRN g_101aac70:DWORD
    sub_10061d39 PROTO C
    sub_10061d55 PROTO C
    sub_100f7357 PROTO C
    sub_100f883a PROTO C
.CODE
FUN_1005f2d0 PROC
    mov eax, 0x1000
    call sub_100f883a
    mov ecx, dword ptr [esp + 0x1004]
    push esi
    mov esi, dword ptr [g_101aac70]
    imul esi, esi, 0x45c
    lea eax, [esp + 0x100c]
    push eax
    push ecx
    lea edx, [esp + 0xc]
    push edx
    add esi, 0x101a66b0
    call sub_100f7357
    mov eax, dword ptr [g_101aac70]
    add esp, 0xc
    test eax, eax
    je L0
    mov ecx, dword ptr [esi + 0x400]
    lea eax, [esp + 4]
    push eax
    mov eax, dword ptr [esi + 0x40c]
    push ecx
    lea edx, [esi + 0x41c]
    push edx
    push eax
    push 0x1019b940
    push 1
    call sub_10061d39
    add esp, 0x18
    pop esi
    add esp, 0x1000
    ret
    lea ecx, [esp + 4]
    push ecx
    push 0x1019b93c
    push 1
    call sub_10061d55
    add esp, 0xc
    pop esi
    add esp, 0x1000
    ret
FUN_1005f2d0 ENDP
END