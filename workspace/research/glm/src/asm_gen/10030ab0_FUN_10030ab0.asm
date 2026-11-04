; FUN_10030ab0 @ 0x10030ab0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101ce6d0:DWORD
    EXTRN g_101ce708:DWORD
    EXTRN g_101ce71c:DWORD
    EXTRN g_101ce7a4:DWORD
    EXTRN g_101d4848:DWORD
    EXTRN g_101d496d:DWORD
    EXTRN g_10730558:DWORD
    sub_1002eab3 PROTO C
    sub_100305dc PROTO C
    sub_10030700 PROTO C
    sub_100307ba PROTO C
    sub_1003ea87 PROTO C
.CODE
FUN_10030ab0 PROC
    cmp dword ptr [g_10730558], 0xe
    jne L0
    mov eax, dword ptr [g_101d4848]
    call sub_1002eab3
    mov dword ptr [g_10730558], 2
    mov eax, dword ptr [g_101ce708]
    cmp dword ptr [eax + 8], 2
    je L1
    mov al, byte ptr [g_101d496d]
    test al, al
    je L1
    mov ecx, dword ptr [g_101ce71c]
    mov al, byte ptr [ecx + 8]
    test al, al
    je L1
    mov edx, dword ptr [g_101ce6d0]
    mov al, byte ptr [edx + 8]
    test al, al
    jne L1
    call sub_10030700
    xor eax, eax
    call sub_1003ea87
    call sub_100305dc
    mov eax, dword ptr [g_101ce708]
    cmp dword ptr [eax + 8], 2
    je L2
    mov ecx, dword ptr [g_101ce7a4]
    fld dword ptr [ecx + 8]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    je L3
    fld dword ptr [esp + 4]
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    jne L2
    fld dword ptr [ecx + 8]
    push ecx
    fld st(0)
    fmulp st(1)
    fld dword ptr [esp + 8]
    fmul dword ptr [esp + 8]
    faddp st(1)
    fsqrt
    fstp dword ptr [esp]
    call sub_100307ba
    pop ecx
    ret
FUN_10030ab0 ENDP
END