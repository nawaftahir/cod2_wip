.686
.MODEL FLAT, C
EXTRN sub_1002CA6F:PROC
EXTRN sub_1002CD65:PROC
EXTRN sub_10061CBB:PROC
EXTRN g_101D5D28:DWORD
.CODE
FUN_1000dd70 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, dword ptr [g_101D5D28]
    xor esi, esi
    test edi, edi
    jle L2
    mov edx, 0101D5D2Ch
L0:
    mov ecx, ebp
    call sub_1002CA6F
    test eax, eax
    jne L1
    inc esi
    add edx, 68
    cmp esi, edi
    jl L0
    cmp esi, 16
    jne L2
    push esi
    push 0101931D8h
    call sub_10061CBB
    add esp, 8
    pop edi
    pop esi
    xor eax, eax
    pop ebp
    ret
L1:
    mov eax, esi
    imul eax, eax, 68
    pop edi
    pop esi
    add eax, 0101D5D2Ch
    pop ebp
    ret
L2:
    mov eax, esi
    imul eax, eax, 68
    push ebx
    push esi
    lea ebx, [eax + 0101D5D2Ch]
    push ebp
    call sub_1002CD65
    mov eax, dword ptr [g_101D5D28]
    add esp, 8
    inc eax
    mov dword ptr [g_101D5D28], eax
    mov eax, ebx
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
FUN_1000dd70 ENDP
END
