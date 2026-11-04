; FUN_1000d880 @ 0x1000d880 — auto-synthesized
    EXTRN g_101a59f8:DWORD
    EXTRN g_101cea4a:DWORD
    EXTRN g_101cea4c:DWORD
    EXTRN g_101cea5e:DWORD
    EXTRN g_101cea60:DWORD
    EXTRN g_101d1b08:DWORD
    EXTRN g_101d1b98:DWORD
    EXTRN g_101d1be8:DWORD
    EXTRN g_101d1be9:DWORD
    EXTRN g_101d1bec:DWORD
    sub_1000cb92 PROTO C
    sub_1000d56d PROTO C
    sub_1000d688 PROTO C
    sub_1003d973 PROTO C
.CODE
FUN_1000d880 PROC
    push ecx
    push esi
    push edi
    call sub_1000d688
    call sub_1000d56d
    xor edi, edi
    nop
    xor eax, eax
    mov al, byte ptr [edi + 0x10766764]
    push eax
    mov eax, dword ptr [g_101d1b08]
    call sub_1003d973
    add esp, 4
    inc edi
    cmp edi, 0x10
    jl L0
    mov esi, dword ptr [g_101a59f8]
    mov dword ptr [g_101cea60], esi
    mov byte ptr [g_101cea5e], 4
    mov byte ptr [g_101cea4a], 0
    mov byte ptr [g_101cea4c], 0
    call sub_1000cb92
    mov ecx, 0x101cea40
    pop edi
    mov dword ptr [eax*4 + 0x101cea68], ecx
    mov dword ptr [g_101d1b98], ecx
    mov byte ptr [g_101d1be8], 0x32
    mov byte ptr [g_101d1be9], 0
    mov dword ptr [g_101d1bec], ecx
    pop esi
    pop ecx
    ret
FUN_1000d880 ENDP
END