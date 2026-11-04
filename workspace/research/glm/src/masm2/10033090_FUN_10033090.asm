.686
.MODEL FLAT, C
EXTRN EXTRN fp_1010C02C:DWORD:DWORD
.CODE
FUN_10033090 PROC
    sub sub esp, 16
    lea lea eax, [esp + 8]
    push push eax
    call dword ptr [fp_1010C02C]
    mov mov edx, dword ptr [edi]
    mov mov ecx, dword ptr [esi]
    mov mov eax, dword ptr [edi + 4]
    sub sub ecx, edx
    mov mov edx, dword ptr [esi + 4]
    sbb sbb edx, eax
    mov mov dword ptr [esp], ecx
    mov mov dword ptr [esp + 4], edx
    fild fild qword ptr [esp]
    fild fild qword ptr [esp + 8]
    fdivp fdivp st(1)
    add add esp, 16
    ret ret
FUN_10033090 ENDP
END
