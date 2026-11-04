.686
.MODEL FLAT, C
EXTRN sub_100115EB:PROC
EXTRN sub_1001163A:PROC
EXTRN sub_1001164E:PROC
EXTRN EXTRN fp_1010C1D4:DWORD:DWORD
EXTRN EXTRN g_1010C1E8:DWORD:DWORD
EXTRN EXTRN g_101D1BF4:DWORD:DWORD
EXTRN EXTRN g_101D1BFC:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_101D4C78:DWORD:DWORD
.CODE
FUN_10011560 PROC
    mov mov eax, dword ptr [g_101D4C78]
    sub sub esp, 40
    test test eax, eax
    push push edi
    je L0
    mov mov edx, dword ptr [g_101D1BFC]
    mov mov eax, dword ptr [g_101D1BF4]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push eax
    call call dword ptr [ecx + 60]
    lea lea ecx, [esp + 4]
    push push ecx
    push push eax
    mov mov dword ptr [esp + 12], 40
    call dword ptr [fp_1010C1D4]
    test test eax, eax
    je sub_100115EB
    mov mov edi, dword ptr [esp + 8]
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 12]
    sub sub edx, edi
    sub sub eax, ecx
    mov mov dword ptr [esi], edx
    mov mov dword ptr [ebx], eax
    pop pop edi
    add add esp, 40
    ret ret
    mov mov edi, dword ptr [g_1010C1E8]
    push push 0
    call call edi
    push push 1
    mov mov dword ptr [esi], eax
    call call edi
    mov mov dword ptr [ebx], eax
    cmp cmp dword ptr [esi], 0
    jle sub_1001163A
    test test eax, eax
    jg sub_1001164E
    mov mov ecx, dword ptr [g_101D4C6C]
    mov mov edx, dword ptr [g_101D4C70]
    mov mov dword ptr [esi], ecx
    mov mov dword ptr [ebx], edx
    pop pop edi
    add add esp, 40
    ret ret
FUN_10011560 ENDP
END
