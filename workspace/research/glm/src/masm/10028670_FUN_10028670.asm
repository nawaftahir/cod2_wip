.686
.MODEL FLAT, C
EXTRN sub_100287E9:PROC
.CODE
FUN_10028670 PROC
    push ebp
    push esi
    push edi
    mov edi, ecx
    sub eax, edi
    sar eax, 3
    mov ebp, eax
    cdq
    sub eax, edx
    mov esi, eax
    sar esi, 1
    test esi, esi
    jle L1
    push ebx
    lea ebx, [edi + esi*8]
    jmp L0
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [ebx - 4]
    mov edx, dword ptr [ebx - 8]
    push eax
    sub ebx, 8
    push ecx
    push edx
    dec esi
    push ebp
    mov eax, esi
    call sub_100287E9
    add esp, 16
    test esi, esi
    jg L0
    pop ebx
L1:
    pop edi
FUN_10028670 ENDP
END
