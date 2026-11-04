; FUN_10020d50 @ 0x10020d50 — auto-synthesized
    EXTRN g_101da9c8:DWORD
    EXTRN g_1042e778:DWORD
    sub_100210af PROTO C
    sub_10033b8a PROTO C
    sub_10033d82 PROTO C
.CODE
FUN_10020d50 PROC
    mov eax, dword ptr [g_1042e778]
    mov edx, dword ptr [eax + 0x30000]
    mov ecx, 0x30000
    sub ecx, edx
    cmp ecx, 4
    jge L0
    xor edx, edx
    mov dword ptr [eax + 0x30008], edx
    jmp L1
    lea ecx, [edx + eax]
    add edx, 4
    mov dword ptr [eax + 0x30000], edx
    add dword ptr [eax + 0x30004], 4
    mov dword ptr [eax + 0x30008], ecx
    xor edx, edx
    mov word ptr [ecx], dx
    mov word ptr [ecx + 2], 4
    mov eax, dword ptr [g_101da9c8]
    push eax
    mov dword ptr [eax + 0x249d0c], edx
    mov dword ptr [eax + 0x249d10], edx
    mov dword ptr [eax + 0x249d14], edx
    call sub_10033d82
    add esp, 4
    call sub_10033b8a
    jmp sub_100210af
FUN_10020d50 ENDP
END