.686
.MODEL FLAT, C
EXTRN sub_100050BC:PROC
EXTRN sub_100050D6:PROC
EXTRN sub_1002D26F:PROC
EXTRN sub_1002D2D2:PROC
EXTRN sub_1002DB5B:PROC
EXTRN sub_1002DB6A:PROC
EXTRN sub_1002DBB2:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_1002da90 PROC
    push push ecx
    mov mov eax, dword ptr [edi + 16]
    test test eax, eax
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    lea lea esi, [edi + 16]
    jne sub_1002DB5B
    mov mov eax, dword ptr [g_101CE708]
    mov mov edx, dword ptr [eax + 8]
    movsx movsx eax, word ptr [edi + 2]
    xor xor ecx, ecx
    cmp cmp edx, 2
    setne setne cl
    push push 0
    push push esi
    push push 0
    push push 0
    push push 8
    dec dec ecx
    and and ecx, -28
    add add ecx, 64
    imul imul eax, ecx
    mov mov ecx, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [ecx]
    push push eax
    push push ecx
    call call dword ptr [edx + 104]
    test test eax, eax
    jl L0
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [eax]
    push push 0
    lea lea edx, [esp + 12]
    push push edx
    push push 0
    push push 0
    push push eax
    call call dword ptr [ecx + 44]
    test test eax, eax
    jge sub_1002DB6A
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov dword ptr [esi], 0
    pop pop esi
    pop pop ebp
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [g_101CE708]
    cmp cmp dword ptr [edx + 8], 2
    jne sub_1002DBB2
    mov mov ecx, dword ptr [esp + 8]
    movsx movsx eax, word ptr [edi + 2]
    push push ecx
    mov mov ecx, ebp
    call sub_1002D2D2
    mov mov esi, dword ptr [esi]
    add add esp, 4
    call sub_100050BC
    pop pop esi
    pop pop ebp
    pop pop ecx
    ret ret
    movsx movsx edx, word ptr [edi + 2]
    mov mov eax, dword ptr [esp + 8]
    mov mov ecx, ebp
    call sub_1002D26F
    mov mov esi, dword ptr [esi]
    call sub_100050D6
    pop pop esi
    pop pop ebp
    pop pop ecx
L0:
    ret ret
FUN_1002da90 ENDP
END
