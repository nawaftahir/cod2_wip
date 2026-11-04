.686
.MODEL FLAT, C
EXTRN sub_1000CEEE:PROC
EXTRN sub_1000D3FC:PROC
EXTRN sub_1000D460:PROC
EXTRN sub_1000EADD:PROC
EXTRN sub_1000ECA0:PROC
EXTRN sub_100293A3:PROC
EXTRN sub_1003DD97:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_101D1B14:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1000d320 PROC
    mov mov eax, 02004h
    call sub_100F883A
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    push push ebx
    push push esi
    push push edi
    je sub_1000D3FC
    mov mov esi, dword ptr [g_101D1B14]
    call sub_1003DD97
    xor xor edi, edi
    lea lea esp, [esp]
    mov mov ecx, dword ptr [g_101D1B14]
    mov mov eax, dword ptr [ecx + 4]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov eax, dword ptr [g_101D1B14]
    mov mov dword ptr [eax + 4], edi
    cmp cmp dword ptr [g_1076A830], edi
    jne L0
    mov mov esi, dword ptr [g_101D1B14]
    push push 1
    push push edi
    push push 1
    mov mov ebx, 50
    mov mov eax, 0100h
    mov mov ecx, 32
    call sub_1000CEEE
    mov mov edx, dword ptr [esp + 02020h]
    add add esp, 12
    lea lea ecx, [esp + 16]
    push push ecx
    push push edx
    call sub_100293A3
    mov mov esi, dword ptr [g_101D1B14]
    mov mov eax, dword ptr [esi]
    add add esp, 8
    cmp cmp eax, 4
    jne sub_1000D460
    lea lea eax, [esp + 16]
    push push eax
    push push edi
    push push ebx
    push push esi
    call sub_1000ECA0
    add add esp, 16
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 02004h
    ret ret
    lea lea ecx, [esp + 16]
    push push ecx
    push push 50
    xor xor edi, edi
    xor xor ebx, ebx
    call sub_1000EADD
    add add esp, 8
    pop pop edi
    pop pop esi
    pop pop ebx
    add add esp, 02004h
    ret ret
FUN_1000d320 ENDP
END
