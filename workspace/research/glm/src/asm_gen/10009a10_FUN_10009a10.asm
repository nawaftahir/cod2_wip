; FUN_10009a10 @ 0x10009a10 — auto-synthesized
    EXTRN g_1019bc84:DWORD
    EXTRN g_101ce5d0:DWORD
    EXTRN g_101ce5d4:DWORD
    EXTRN g_101ce5d8:DWORD
    EXTRN g_101ce5dc:DWORD
    sub_10007e5c PROTO C
    sub_10009755 PROTO C
.CODE
FUN_10009a10 PROC
    push ebx
    mov ebx, eax
    mov al, byte ptr [ebx + 1]
    test al, al
    je L0
    mov al, 1
    pop ebx
    ret
    fld dword ptr [g_101ce5d4]
    fmul dword ptr [ebx + 0xc]
    fld dword ptr [g_101ce5d8]
    fmul dword ptr [ebx + 0x10]
    faddp st(1)
    fld dword ptr [g_101ce5dc]
    fmul dword ptr [ebx + 0x14]
    faddp st(1)
    fld dword ptr [g_101ce5d0]
    fmul dword ptr [ebx + 8]
    faddp st(1)
    fcomp dword ptr [g_1019bc84]
    fnstsw ax
    test ah, 0x41
    je L1
    mov eax, ebx
    call sub_10007e5c
    test al, al
    jne L1
    call sub_10009755
    test al, al
    setne al
    pop ebx
    ret
FUN_10009a10 ENDP
END