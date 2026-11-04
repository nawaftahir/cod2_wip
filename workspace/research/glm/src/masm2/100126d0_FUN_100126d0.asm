.686
.MODEL FLAT, C
EXTRN sub_10012748:PROC
EXTRN sub_10012783:PROC
EXTRN sub_1001279A:PROC
EXTRN EXTRN fp_1010C0E0:DWORD:DWORD
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
EXTRN EXTRN g_101D1BFC:DWORD:DWORD
.CODE
FUN_100126d0 PROC
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    jmp L0
    lea lea esp, [esp]
    push push 010193C40h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 8
    xor xor edi, edi
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [g_101D1BF4]
    mov mov ecx, dword ptr [eax]
    push push 0101D1BF8h
    push push ebx
    push push ebp
    push push edx
    mov mov edx, dword ptr [g_101D1BFC]
    push push 1
    push push edx
    push push eax
    call call dword ptr [ecx + 64]
    mov mov esi, eax
    test test esi, esi
    jge sub_10012783
    push push 100
    call dword ptr [fp_1010C0E0]
    inc inc edi
    cmp cmp edi, 20
    jne sub_10012748
    mov mov eax, dword ptr [g_101D1BFC]
    test test eax, eax
    je sub_1001279A
    mov mov dword ptr [g_101D1BFC], 0
FUN_100126d0 ENDP
END
