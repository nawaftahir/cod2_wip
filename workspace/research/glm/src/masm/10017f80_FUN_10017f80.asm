.686
.MODEL FLAT, C
EXTRN sub_100180B1:PROC
.CODE
FUN_10017f80 PROC
    sub eax, edi
    sar eax, 2
    push ebx
    mov ebx, eax
    cdq
    push ebp
    mov ebp, dword ptr [esp + 12]
    sub eax, edx
    push esi
    mov esi, eax
    sar esi, 1
    test esi, esi
    jle L1
    lea esp, [esp]
L0:
    mov eax, dword ptr [edi + esi*4 - 4]
    dec esi
    push ebp
    push eax
    push ebx
    mov eax, esi
    mov ecx, edi
    call sub_100180B1
    add esp, 12
    test esi, esi
    jg L0
L1:
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10017f80 ENDP
END
