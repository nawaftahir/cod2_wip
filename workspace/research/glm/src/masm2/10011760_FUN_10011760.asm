.686
.MODEL FLAT, C
EXTRN sub_10005227:PROC
EXTRN sub_100118DD:PROC
EXTRN sub_100118FE:PROC
EXTRN sub_10011937:PROC
EXTRN sub_10011955:PROC
EXTRN sub_10011973:PROC
EXTRN sub_100119DD:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D49CC:DWORD:DWORD
EXTRN EXTRN fp_101D4A6C:DWORD:DWORD
EXTRN EXTRN fp_101D4AC4:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101CE7F8:DWORD:DWORD
.CODE
FUN_10011760 PROC
    push push ebx
    push push esi
    push push edi
    mov mov edi, eax
    movzx movzx eax, byte ptr [edi + 0CCh]
    movzx movzx ecx, byte ptr [edi + 0CDh]
    push push eax
    push push ecx
    push push 010193F8Ch
    push push 0
    call dword ptr [fp_101D49C8]
    movzx movzx edx, byte ptr [edi + 0C4h]
    movzx movzx eax, byte ptr [edi + 0C5h]
    push push edx
    push push eax
    push push 010193F6Ch
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 32
    call sub_10005227
    mov mov edi, eax
    xor xor ebx, ebx
    mov mov esi, 2
    mov mov edx, 1
    mov mov ecx, esi
    shl shl edx, cl
    test test edi, edx
    je L2
    cmp cmp esi, 1
    mov mov ebx, esi
    mov mov eax, 010193FB8h
    je L1
    mov mov eax, 010193FACh
    push push eax
    push push 010193F50h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 12
    dec dec esi
    jne L0
    test test ebx, ebx
    jne L3
    push push 010193F28h
    push push ebx
    call dword ptr [fp_101D49CC]
    add add esp, 8
    mov mov eax, dword ptr [g_101CE7F8]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_10011937
    mov mov edx, 1
    shl shl edx, cl
    test test edi, edx
    je sub_100118FE
    mov mov ebx, ecx
    cmp cmp ebx, 1
    mov mov esi, 010193FB8h
    je sub_100118DD
    mov mov esi, 010193FACh
    push push eax
    call dword ptr [fp_101D4AC4]
    push push eax
    push push esi
    push push 010193EE8h
    push push 0
    call dword ptr [fp_101D49C8]
L1:
    mov mov eax, dword ptr [g_101CE708]
L2:
    add add esp, 20
    push push ebx
    push push eax
    call dword ptr [fp_101D4A6C]
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    cmp cmp ecx, 1
    mov mov ecx, 010193FB8h
    je sub_10011955
    mov mov ecx, 010193FACh
    cmp cmp ebx, 1
    mov mov eax, 010193FB8h
    je sub_10011973
    mov mov eax, 010193FACh
    push push ecx
    push push eax
    push push 010193EA0h
    push push 0
    call dword ptr [fp_101D49C8]
L3:
    mov mov eax, dword ptr [g_101CE708]
    add add esp, 16
    push push ebx
    push push eax
    call dword ptr [fp_101D4A6C]
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
    cmp cmp ebx, 1
    mov mov eax, 010193FB8h
    je sub_100119DD
    mov mov eax, 010193FACh
    push push eax
    push push 010193E50h
    push push 0
    call dword ptr [fp_101D49C8]
    mov mov eax, dword ptr [g_101CE708]
    add add esp, 12
    push push ebx
    push push eax
    call dword ptr [fp_101D4A6C]
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10011760 ENDP
END
