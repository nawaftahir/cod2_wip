; R_DrawSprite @ 0x10021f40 — auto-synthesized
    EXTRN fp_101d4af4:DWORD
    EXTRN g_101ce70c:DWORD
    EXTRN g_101d0b00:DWORD
    EXTRN g_101d4d00:DWORD
    sub_10016e91 PROTO C
    sub_1001e4f4 PROTO C
    sub_10021e76 PROTO C
.CODE
R_DrawSprite PROC
    mov al, byte ptr [g_101d4d00]
    test al, al
    je L0
    mov eax, dword ptr [g_101d0b00]
    test eax, eax
    je L1
    mov dword ptr [g_101d0b00], 0
    call sub_10016e91
    call sub_10021e76
    push 0
    call dword ptr [fp_101d4af4]
    mov eax, dword ptr [g_101ce70c]
    mov cl, byte ptr [eax + 8]
    add esp, 4
    test cl, cl
    je L0
    push 0
    call sub_1001e4f4
    pop ecx
    ret
R_DrawSprite ENDP
END