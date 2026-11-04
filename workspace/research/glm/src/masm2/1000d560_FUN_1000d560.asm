.686
.MODEL FLAT, C
EXTRN sub_1000D14D:PROC
EXTRN sub_1000D18B:PROC
EXTRN sub_1000D29A:PROC
EXTRN sub_1000D2B0:PROC
EXTRN sub_1000D2C6:PROC
EXTRN sub_1000D2DC:PROC
EXTRN sub_1000D2F2:PROC
EXTRN sub_1000D308:PROC
EXTRN sub_1000D696:PROC
EXTRN sub_100108C1:PROC
EXTRN sub_100108FF:PROC
EXTRN sub_100138F8:PROC
EXTRN sub_10013936:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D1B08:DWORD:DWORD
EXTRN EXTRN g_101D1B0C:DWORD:DWORD
EXTRN EXTRN g_101D1B10:DWORD:DWORD
EXTRN EXTRN g_101D1B14:DWORD:DWORD
EXTRN EXTRN g_101D1B18:DWORD:DWORD
EXTRN EXTRN g_101D1B1C:DWORD:DWORD
EXTRN EXTRN g_101D1B20:DWORD:DWORD
EXTRN EXTRN g_101D1BA4:DWORD:DWORD
.CODE
FUN_1000d560 PROC
    push push ecx
    push push ebx
    push push esi
    mov mov ebx, 010193508h
    call sub_1000D14D
    mov mov esi, eax
    test test esi, esi
    jne L0
    xor xor edx, edx
    mov mov bl, 1
    mov mov eax, 010193508h
    call sub_100108C1
    mov mov esi, eax
    test test esi, esi
    jne L1
    push push 010193508h
    push push 010193544h
    push push 1
    call sub_100138F8
    add add esp, 12
    mov mov ebx, 010193500h
    mov mov dword ptr [g_101D1B08], esi
    call sub_1000D18B
    mov mov esi, eax
    test test esi, esi
    jne L2
    xor xor edx, edx
    mov mov bl, 1
    mov mov eax, 010193500h
    call sub_100108FF
    mov mov esi, eax
    test test esi, esi
    jne L3
    push push 010193500h
    push push 010193544h
    push push 1
    call sub_10013936
    add add esp, 12
    mov mov eax, dword ptr [g_101CE708]
    mov mov dword ptr [g_101D1B0C], esi
    mov mov ecx, dword ptr [eax + 8]
    xor xor eax, eax
    cmp cmp ecx, 2
    push push 1
    jne sub_1000D696
    mov mov esi, 0101934F4h
    call sub_1000D29A
    mov mov dword ptr [g_101D1BA4], eax
    add add esp, 4
    pop pop esi
    pop pop ebx
    pop pop ecx
    ret ret
    mov mov esi, 0101934E0h
    call sub_1000D2B0
    add add esp, 4
    mov mov dword ptr [g_101D1B10], eax
    push push 1
    xor xor eax, eax
    mov mov esi, 0101934D0h
    call sub_1000D2C6
    add add esp, 4
    mov mov dword ptr [g_101D1B14], eax
    push push 1
    xor xor eax, eax
    mov mov esi, 0101934BCh
    call sub_1000D2DC
    add add esp, 4
    mov mov dword ptr [g_101D1B1C], eax
    push push 1
    xor xor eax, eax
    mov mov esi, 0101934A8h
    call sub_1000D2F2
    add add esp, 4
    mov mov dword ptr [g_101D1B20], eax
    push push 1
    xor xor eax, eax
    mov mov esi, 010193494h
    call sub_1000D308
    add add esp, 4
    pop pop esi
    mov mov dword ptr [g_101D1B18], eax
    pop pop ebx
    pop pop ecx
    ret ret
FUN_1000d560 ENDP
END
