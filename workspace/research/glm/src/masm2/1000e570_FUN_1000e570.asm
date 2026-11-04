.686
.MODEL FLAT, C
EXTRN sub_1000E5C1:PROC
EXTRN sub_1000E5C8:PROC
EXTRN sub_1000E6A1:PROC
.CODE
FUN_1000e570 PROC
    sub sub eax, edi
    sar sar eax, 2
    push push ebx
    mov mov ebx, eax
    cdq cdq
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    sub sub eax, edx
    push push esi
    mov mov esi, eax
    sar sar esi, 1
    test test esi, esi
    jle sub_1000E5C1
    lea lea esp, [esp]
    mov mov eax, dword ptr [edi + esi*4 - 4]
    dec dec esi
    push push ebp
    push push eax
    push push ebx
    mov mov eax, esi
    mov mov ecx, edi
    call sub_1000E6A1
    add add esp, 12
    test test esi, esi
    jg sub_1000E5C8
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_1000e570 ENDP
END
