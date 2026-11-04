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
EXTRN sub_100108C1:PROC
EXTRN sub_100108FF:PROC
EXTRN sub_100138F8:PROC
EXTRN sub_10013936:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101D1B08:DWORD
EXTRN g_101D1B0C:DWORD
EXTRN g_101D1B10:DWORD
EXTRN g_101D1B14:DWORD
EXTRN g_101D1B18:DWORD
EXTRN g_101D1B1C:DWORD
EXTRN g_101D1B20:DWORD
EXTRN g_101D1BA4:DWORD
.CODE
FUN_1000d560 PROC
    push ecx
    push ebx
    push esi
    mov ebx, 010193508h
    call sub_1000D14D
    mov esi, eax
    test esi, esi
    jne L0
    xor edx, edx
    mov bl, 1
    mov eax, 010193508h
    call sub_100108C1
    mov esi, eax
    test esi, esi
    jne L0
    push 010193508h
    push 010193544h
    push 1
    call sub_100138F8
    add esp, 12
L0:
    mov ebx, 010193500h
    mov dword ptr [g_101D1B08], esi
    call sub_1000D18B
    mov esi, eax
    test esi, esi
    jne L1
    xor edx, edx
    mov bl, 1
    mov eax, 010193500h
    call sub_100108FF
    mov esi, eax
    test esi, esi
    jne L1
    push 010193500h
    push 010193544h
    push 1
    call sub_10013936
    add esp, 12
L1:
    mov eax, dword ptr [g_101CE708]
    mov dword ptr [g_101D1B0C], esi
    mov ecx, dword ptr [eax + 8]
    xor eax, eax
    cmp ecx, 2
    push 1
    jne L2
    mov esi, 0101934F4h
    call sub_1000D29A
    mov dword ptr [g_101D1BA4], eax
    add esp, 4
    pop esi
    pop ebx
    pop ecx
    ret
L2:
    mov esi, 0101934E0h
    call sub_1000D2B0
    add esp, 4
    mov dword ptr [g_101D1B10], eax
    push 1
    xor eax, eax
    mov esi, 0101934D0h
    call sub_1000D2C6
    add esp, 4
    mov dword ptr [g_101D1B14], eax
    push 1
    xor eax, eax
    mov esi, 0101934BCh
    call sub_1000D2DC
    add esp, 4
    mov dword ptr [g_101D1B1C], eax
    push 1
    xor eax, eax
    mov esi, 0101934A8h
    call sub_1000D2F2
    add esp, 4
    mov dword ptr [g_101D1B20], eax
    push 1
    xor eax, eax
    mov esi, 010193494h
    call sub_1000D308
    add esp, 4
    pop esi
    mov dword ptr [g_101D1B18], eax
    pop ebx
    pop ecx
    ret
FUN_1000d560 ENDP
END
