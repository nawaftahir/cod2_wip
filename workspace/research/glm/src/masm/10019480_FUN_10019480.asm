.686
.MODEL FLAT, C
EXTRN sub_1005F3BF:PROC
EXTRN sub_1005FB01:PROC
EXTRN sub_1005FB2C:PROC
EXTRN sub_1005FF54:PROC
.CODE
FUN_10019480 PROC
    push ebx
    push 1
    push 0101958CCh
    mov ecx, edi
    mov ebx, eax
    call sub_1005FB01
    add esp, 8
    test eax, eax
    jne L0
    xor al, al
    pop ebx
    ret
L0:
    push esi
    mov ecx, edi
    call sub_1005FF54
    mov esi, eax
    test esi, esi
    jl L1
    cmp esi, ebx
    jge L1
    push 1
    push 0101958A8h
    mov ecx, edi
    call sub_1005FB2C
    add esp, 8
    test eax, eax
    je L2
    imul esi, dword ptr [esp + 12]
    mov eax, dword ptr [esp + 16]
    mov dword ptr [eax], esi
    pop esi
    mov al, 1
    pop ebx
    ret
L1:
    dec ebx
    push ebx
    push 0101955B4h
    call sub_1005F3BF
    add esp, 8
L2:
    pop esi
    xor al, al
    pop ebx
    ret
FUN_10019480 ENDP
END
