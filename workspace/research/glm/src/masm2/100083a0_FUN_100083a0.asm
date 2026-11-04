.686
.MODEL FLAT, C
EXTRN sub_10006444:PROC
EXTRN sub_10006472:PROC
EXTRN sub_100064DE:PROC
EXTRN sub_100084C5:PROC
EXTRN sub_100084CE:PROC
EXTRN sub_100084DA:PROC
EXTRN sub_100084FF:PROC
EXTRN sub_10008511:PROC
EXTRN sub_1000851B:PROC
EXTRN sub_10008545:PROC
EXTRN sub_10008573:PROC
EXTRN sub_1000858E:PROC
EXTRN sub_10008596:PROC
EXTRN sub_1000859F:PROC
EXTRN sub_100085B1:PROC
EXTRN sub_1001F7A3:PROC
EXTRN sub_1001FB3E:PROC
EXTRN sub_10020041:PROC
EXTRN sub_1002471C:PROC
EXTRN sub_10024745:PROC
EXTRN sub_10024760:PROC
EXTRN EXTRN fp_101D4BF8:DWORD:DWORD
EXTRN EXTRN fp_101D4BFC:DWORD:DWORD
EXTRN EXTRN g_101CE5EF:DWORD:DWORD
EXTRN EXTRN g_101CE5F0:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
.CODE
FUN_100083a0 PROC
    push push ecx
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 20]
    push push esi
    push push edi
    mov mov edi, dword ptr [eax + 56]
    test test edi, edi
    je sub_100084CE
    mov mov eax, dword ptr [edi]
    mov mov esi, eax
    imul imul esi, esi, 52
    add add esi, 010678AC4h
    cmp cmp dword ptr [esi + 12], 5
    je sub_100084DA
    mov mov edx, dword ptr [g_10678510]
    imul imul eax, eax, 116
    add add eax, edx
    mov mov ebx, eax
    mov mov eax, dword ptr [ebx]
    cmp cmp eax, 1
    jg sub_100084C5
    mov mov al, byte ptr [g_101CE5EF]
    test test al, al
    je sub_100084FF
    cmp cmp dword ptr [esi + 12], 2
    jge L0
    mov mov ecx, dword ptr [esp + 24]
    lea lea edx, [edi + 4]
    mov mov eax, ebp
    call sub_10006444
    test test al, al
    jne sub_1000851B
    mov mov ecx, dword ptr [esi + 8]
    push push ecx
    call dword ptr [fp_101D4BFC]
    add add esp, 4
    push push esi
    mov mov eax, ebx
    call sub_10020041
    add add esp, 4
    mov mov ecx, dword ptr [esp + 24]
    lea lea edx, [esi + 20]
    mov mov eax, ebp
    call sub_10006472
    test test al, al
    jne sub_10008545
    mov mov edx, dword ptr [esi + 8]
    push push edx
    call dword ptr [fp_101D4BF8]
    mov mov eax, dword ptr [ebx]
    add add esp, 4
    cmp cmp eax, 1
    jne sub_10008511
    push push -1
    push push ebx
    push push esi
    call sub_1001F7A3
    mov mov dword ptr [esi + 12], 5
    mov mov eax, dword ptr [edi]
    add add esp, 12
    push push eax
    call sub_10024745
    jmp sub_10008573
    push push ebx
    push push esi
    call sub_1001FB3E
    mov mov dword ptr [esi + 12], 5
    mov mov eax, dword ptr [edi]
    add add esp, 8
L0:
    push push eax
    call sub_10024760
    jmp sub_1000858E
    cmp cmp eax, 3
    jne sub_10008596
    mov mov al, byte ptr [g_101CE5F0]
    test test al, al
    je sub_1000859F
    mov mov ecx, dword ptr [esp + 24]
    lea lea edx, [edi + 4]
    mov mov eax, ebp
    call sub_100064DE
    test test al, al
    jne sub_100085B1
    mov mov ecx, dword ptr [edi]
    push push ecx
    mov mov eax, esi
    call sub_1002471C
    add add esp, 4
    mov mov edi, dword ptr [edi + 28]
    test test edi, edi
    jne sub_100084CE
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    pop pop ecx
    ret ret
FUN_100083a0 ENDP
END
