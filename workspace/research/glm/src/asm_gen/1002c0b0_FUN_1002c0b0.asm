; FUN_1002c0b0 @ 0x1002c0b0 — auto-synthesized
    EXTRN g_1019bcac:DWORD
    sub_1010a8c1 PROTO C
    sub_1010a8d1 PROTO C
    sub_1010a8e1 PROTO C
    sub_1010a8f2 PROTO C
.CODE
FUN_1002c0b0 PROC
    test esi, esi
    jne L0
    mov dword ptr [edi], 0xffffffff
    ret
    fld dword ptr [esi + 8]
    fmul dword ptr [g_1019bcac]
    call sub_1010a8c1
    mov byte ptr [edi], al
    fld dword ptr [esi + 4]
    fmul dword ptr [g_1019bcac]
    call sub_1010a8d1
    mov byte ptr [edi + 1], al
    fld dword ptr [esi]
    fmul dword ptr [g_1019bcac]
    call sub_1010a8e1
    mov byte ptr [edi + 2], al
    fld dword ptr [esi + 0xc]
    fmul dword ptr [g_1019bcac]
    call sub_1010a8f2
    mov byte ptr [edi + 3], al
    ret
FUN_1002c0b0 ENDP
END