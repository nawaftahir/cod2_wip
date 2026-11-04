; FUN_10033090 @ 0x10033090 — auto-synthesized
    EXTRN fp_1010c02c:DWORD
.CODE
FUN_10033090 PROC
    sub esp, 0x10
    lea eax, [esp + 8]
    push eax
    call dword ptr [fp_1010c02c]
    mov edx, dword ptr [edi]
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [edi + 4]
    sub ecx, edx
    mov edx, dword ptr [esi + 4]
    sbb edx, eax
    mov dword ptr [esp], ecx
    mov dword ptr [esp + 4], edx
    fild qword ptr [esp]
    fild qword ptr [esp + 8]
    fdivp st(1)
    add esp, 0x10
    ret
FUN_10033090 ENDP
END