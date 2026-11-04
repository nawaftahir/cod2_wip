.686
.MODEL FLAT, C
EXTRN sub_1000CEEE:PROC
EXTRN sub_1000EADD:PROC
EXTRN sub_1000ECA0:PROC
EXTRN sub_100293A3:PROC
EXTRN sub_1003DD97:PROC
EXTRN sub_100F883A:PROC
EXTRN g_101CE708:DWORD
EXTRN g_101D1B14:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1000d320 PROC
    mov eax, 000002004h
    call sub_100F883A
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    push ebx
    push esi
    push edi
    je L2
    mov esi, dword ptr [g_101D1B14]
    call sub_1003DD97
    xor edi, edi
    lea esp, [esp]
L0:
    mov ecx, dword ptr [g_101D1B14]
    mov eax, dword ptr [ecx + 4]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov eax, dword ptr [g_101D1B14]
    mov dword ptr [eax + 4], edi
    cmp dword ptr [g_1076A830], edi
    jne L0
    mov esi, dword ptr [g_101D1B14]
    push 1
    push edi
    push 1
    mov ebx, 50
    mov eax, 000000100h
    mov ecx, 32
    call sub_1000CEEE
    mov edx, dword ptr [esp + 000002020h]
    add esp, 12
    lea ecx, [esp + 16]
    push ecx
    push edx
    call sub_100293A3
    mov esi, dword ptr [g_101D1B14]
    mov eax, dword ptr [esi]
    add esp, 8
    cmp eax, 4
    jne L1
    lea eax, [esp + 16]
    push eax
    push edi
    push ebx
    push esi
    call sub_1000ECA0
    add esp, 16
    pop edi
    pop esi
    pop ebx
    add esp, 000002004h
    ret
L1:
    lea ecx, [esp + 16]
    push ecx
    push 50
    xor edi, edi
    xor ebx, ebx
    call sub_1000EADD
    add esp, 8
L2:
    pop edi
    pop esi
    pop ebx
    add esp, 000002004h
    ret
FUN_1000d320 ENDP
END
