.686
.MODEL FLAT, C
EXTRN sub_1000DDF2:PROC
EXTRN sub_1002CA6F:PROC
EXTRN sub_1002CD65:PROC
EXTRN sub_10061CBB:PROC
EXTRN EXTRN g_101D5D28:DWORD:DWORD
.CODE
FUN_1000dd70 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    push push esi
    push push edi
    mov mov edi, dword ptr [g_101D5D28]
    xor xor esi, esi
    test test edi, edi
    jle L1
    mov mov edx, 0101D5D2Ch
    mov mov ecx, ebp
    call sub_1002CA6F
    test test eax, eax
    jne L2
    inc inc esi
    add add edx, 68
    cmp cmp esi, edi
    jl L0
    cmp cmp esi, 16
    jne sub_1000DDF2
    push push esi
    push push 0101931D8h
    call sub_10061CBB
    add add esp, 8
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebp
L0:
    ret ret
    mov mov eax, esi
    imul imul eax, eax, 68
    pop pop edi
    pop pop esi
    add add eax, 0101D5D2Ch
    pop pop ebp
    ret ret
    mov mov eax, esi
    imul imul eax, eax, 68
    push push ebx
    push push esi
    lea lea ebx, [eax + 0101D5D2Ch]
    push push ebp
    call sub_1002CD65
L1:
    mov mov eax, dword ptr [g_101D5D28]
    add add esp, 8
    inc inc eax
    mov mov dword ptr [g_101D5D28], eax
    mov mov eax, ebx
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ebp
    ret ret
FUN_1000dd70 ENDP
END
