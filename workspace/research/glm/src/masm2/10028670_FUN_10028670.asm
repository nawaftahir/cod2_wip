.686
.MODEL FLAT, C
EXTRN sub_100286C8:PROC
EXTRN sub_100286D0:PROC
EXTRN sub_100287E9:PROC
.CODE
FUN_10028670 PROC
    push push ebp
    push push esi
    push push edi
    mov mov edi, ecx
    sub sub eax, edi
    sar sar eax, 3
    mov mov ebp, eax
    cdq cdq
    sub sub eax, edx
    mov mov esi, eax
    sar sar esi, 1
    test test esi, esi
    jle sub_100286C8
    push push ebx
    lea lea ebx, [edi + esi*8]
    jmp L0
    lea lea ecx, [ecx]
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [ebx - 4]
    mov mov edx, dword ptr [ebx - 8]
    push push eax
    sub sub ebx, 8
    push push ecx
    push push edx
    dec dec esi
    push push ebp
    mov mov eax, esi
    call sub_100287E9
    add add esp, 16
    test test esi, esi
    jg sub_100286D0
    pop pop ebx
    pop pop edi
FUN_10028670 ENDP
END
