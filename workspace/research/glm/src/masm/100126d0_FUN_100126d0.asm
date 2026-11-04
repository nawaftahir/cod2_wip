.686
.MODEL FLAT, C
EXTRN sub_10012783:PROC
EXTRN sub_1001279A:PROC
EXTRN fp_1010C0E0:DWORD
EXTRN fp_101D49C8:DWORD
EXTRN g_101D1BF4:DWORD
EXTRN g_101D1BFC:DWORD
.CODE
FUN_100126d0 PROC
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    jmp L0
    lea esp, [esp]
L0:
    push 010193C40h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 8
    xor edi, edi
L1:
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [g_101D1BF4]
    mov ecx, dword ptr [eax]
    push 0101D1BF8h
    push ebx
    push ebp
    push edx
    mov edx, dword ptr [g_101D1BFC]
    push 1
    push edx
    push eax
    call dword ptr [ecx + 0x40]
    mov esi, eax
    test esi, esi
    jge sub_10012783
    push 100
    call dword ptr [fp_1010C0E0]
    inc edi
    cmp edi, 20
    jne L1
    mov eax, dword ptr [g_101D1BFC]
    test eax, eax
    je sub_1001279A
    mov dword ptr [g_101D1BFC], 0
FUN_100126d0 ENDP
END
