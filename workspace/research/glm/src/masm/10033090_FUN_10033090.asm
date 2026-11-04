.686
.MODEL FLAT, C
EXTRN fp_1010C02C:DWORD
.CODE
FUN_10033090 PROC
    sub esp, 16
    lea eax, [esp + 8]
    push eax
    call dword ptr [fp_1010C02C]
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
    add esp, 16
    ret
FUN_10033090 ENDP
END
