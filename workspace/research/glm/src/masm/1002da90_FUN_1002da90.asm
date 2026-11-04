.686
.MODEL FLAT, C
EXTRN sub_100050BC:PROC
EXTRN sub_100050D6:PROC
EXTRN sub_1002D26F:PROC
EXTRN sub_1002D2D2:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101D1BF8:DWORD
.CODE
FUN_1002da90 PROC
    push ecx
    mov eax, dword ptr [edi + 16]
    test eax, eax
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    lea esi, [edi + 16]
    jne L3
    mov eax, dword ptr [g_101CE708]
    mov edx, dword ptr [eax + 8]
    movsx eax, word ptr [edi + 2]
    xor ecx, ecx
    cmp edx, 2
    setne cl
    push 0
    push esi
    push 0
    push 0
    push 8
    dec ecx
    and ecx, 0FFFFFFE4h
    add ecx, 64
    imul eax, ecx
    mov ecx, dword ptr [g_101D1BF8]
    mov edx, dword ptr [ecx]
    push eax
    push ecx
    call dword ptr [edx + 0x68]
    test eax, eax
    jl L0
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push 0
    lea edx, [esp + 12]
    push edx
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x2c]
    test eax, eax
    jge L1
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
L0:
    mov dword ptr [esi], 0
    pop esi
    pop ebp
    pop ecx
    ret
L1:
    mov edx, dword ptr [g_101CE708]
    cmp dword ptr [edx + 8], 2
    jne L2
    mov ecx, dword ptr [esp + 8]
    movsx eax, word ptr [edi + 2]
    push ecx
    mov ecx, ebp
    call sub_1002D2D2
    mov esi, dword ptr [esi]
    add esp, 4
    call sub_100050BC
    pop esi
    pop ebp
    pop ecx
    ret
L2:
    movsx edx, word ptr [edi + 2]
    mov eax, dword ptr [esp + 8]
    mov ecx, ebp
    call sub_1002D26F
    mov esi, dword ptr [esi]
    call sub_100050D6
L3:
    pop esi
    pop ebp
    pop ecx
    ret
FUN_1002da90 ENDP
END
