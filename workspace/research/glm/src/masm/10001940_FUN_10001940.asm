.686
.MODEL FLAT, C
EXTRN sub_100138E7:PROC
EXTRN sub_10013902:PROC
EXTRN sub_1001392E:PROC
EXTRN g_101AE288:DWORD
.CODE
FUN_10001940 PROC
    mov ecx, dword ptr [eax]
    push esi
    lea esi, [ecx + edx*8 + 8]
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [eax + 8]
    push edi
    add ecx, dword ptr [esi + 4]
    cmp ecx, edx
    jle L0
    mov edx, dword ptr [g_101AE288]
    push edx
    push 010191AC4h
    push 1
    call sub_100138E7
    add esp, 12
L0:
    cmp dword ptr [esi + 4], 4
    jge L1
    mov eax, dword ptr [g_101AE288]
    push eax
    push 010191AA0h
    push 1
    call sub_10013902
    add esp, 12
L1:
    mov esi, dword ptr [esi]
    mov eax, esi
    cdq
    idiv ebx
    test esi, esi
    mov edi, eax
    jl L2
    mov ecx, edi
    imul ecx, ebx
    cmp ecx, esi
    je L3
L2:
    mov edx, dword ptr [g_101AE288]
    push edx
    push 010191A80h
    push 1
    call sub_1001392E
    add esp, 12
L3:
    mov eax, edi
    pop edi
    pop esi
    ret
FUN_10001940 ENDP
END
