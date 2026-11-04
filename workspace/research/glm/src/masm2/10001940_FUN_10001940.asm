.686
.MODEL FLAT, C
EXTRN sub_100019ED:PROC
EXTRN sub_10001A0C:PROC
EXTRN sub_100138E7:PROC
EXTRN sub_10013902:PROC
EXTRN sub_1001392E:PROC
EXTRN EXTRN g_101AE288:DWORD:DWORD
.CODE
FUN_10001940 PROC
    mov mov ecx, dword ptr [eax]
    push push esi
    lea lea esi, [ecx + edx*8 + 8]
    mov mov ecx, dword ptr [esi]
    mov mov edx, dword ptr [eax + 8]
    push push edi
    add add ecx, dword ptr [esi + 4]
    cmp cmp ecx, edx
    jle L0
    mov mov edx, dword ptr [g_101AE288]
    push push edx
    push push 010191AC4h
    push push 1
    call sub_100138E7
    add add esp, 12
    cmp cmp dword ptr [esi + 4], 4
    jge L1
    mov mov eax, dword ptr [g_101AE288]
    push push eax
    push push 010191AA0h
    push push 1
    call sub_10013902
    add add esp, 12
    mov mov esi, dword ptr [esi]
    mov mov eax, esi
    cdq cdq
    idiv idiv ebx
    test test esi, esi
    mov mov edi, eax
    jl sub_100019ED
    mov mov ecx, edi
    imul imul ecx, ebx
    cmp cmp ecx, esi
    je sub_10001A0C
    mov mov edx, dword ptr [g_101AE288]
    push push edx
    push push 010191A80h
    push push 1
    call sub_1001392E
    add add esp, 12
    mov mov eax, edi
    pop pop edi
    pop pop esi
L1:
    ret ret
FUN_10001940 ENDP
END
