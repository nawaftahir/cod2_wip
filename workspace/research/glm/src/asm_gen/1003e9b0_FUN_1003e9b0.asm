; FUN_1003e9b0 @ 0x1003e9b0 — auto-synthesized
    EXTRN g_1072dde0:DWORD
    EXTRN g_1072dde4:DWORD
    EXTRN g_1072dde8:DWORD
    EXTRN g_1072ddec:DWORD
    EXTRN g_1072debc:DWORD
    EXTRN g_1076671c:DWORD
    EXTRN g_10766720:DWORD
    EXTRN g_10766724:DWORD
    EXTRN g_10766748:DWORD
    sub_1003e900 PROTO C
.CODE
FUN_1003e9b0 PROC
    mov ecx, dword ptr [g_10766724]
    xor eax, eax
    sub esp, 0x10
    cmp ecx, 1
    mov byte ptr [g_1072debc], al
    jne L0
    mov ecx, dword ptr [g_1076671c]
    mov edx, dword ptr [g_10766720]
    mov dword ptr [esp], eax
    mov dword ptr [esp + 4], eax
    jmp L1
    mov ecx, dword ptr [g_1072dde0]
    mov edx, dword ptr [g_1072dde4]
    mov dword ptr [esp], ecx
    mov ecx, dword ptr [g_1072dde8]
    mov dword ptr [esp + 4], edx
    mov edx, dword ptr [g_1072ddec]
    push esi
    lea esi, [esp + 4]
    mov dword ptr [esp + 0xc], ecx
    mov dword ptr [esp + 0x10], edx
    mov byte ptr [g_10766748], al
    call sub_1003e900
    pop esi
    add esp, 0x10
    ret
FUN_1003e9b0 ENDP
END