; FUN_1003fae0 @ 0x1003fae0 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    sub_1003f724 PROTO C
    sub_1003f9e1 PROTO C
.CODE
FUN_1003fae0 PROC
    sub esp, 0x18
    fld dword ptr [edi + 0x70]
    mov eax, dword ptr [edi + 0x64]
    fcomp dword ptr [g_1019bc84]
    mov ecx, dword ptr [edi + 0x68]
    push esi
    lea esi, [edi + 0x64]
    mov dword ptr [esp + 8], eax
    fnstsw ax
    mov dword ptr [esp + 0xc], ecx
    test ah, 0x41
    jne L0
    lea eax, [edi + 0x3c]
    lea edx, [esp + 0x10]
    call sub_1003f9e1
    test al, al
    je L1
    fld dword ptr [esp + 0x14]
    fcomp dword ptr [edi + 0x70]
    fnstsw ax
    test ah, 5
    jp L0
    fld dword ptr [edi + 0x70]
    fdiv dword ptr [esp + 0x14]
    fld st(0)
    fmul dword ptr [esi]
    fstp dword ptr [esp + 8]
    fmul dword ptr [esi + 4]
    fstp dword ptr [esp + 0xc]
    lea edx, [esp + 8]
    mov eax, edi
    call sub_1003f724
    pop esi
    add esp, 0x18
    ret
FUN_1003fae0 ENDP
END