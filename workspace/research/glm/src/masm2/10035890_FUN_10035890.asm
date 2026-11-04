.686
.MODEL FLAT, C
EXTRN sub_1000D4A3:PROC
EXTRN sub_1002E8D8:PROC
EXTRN sub_10035973:PROC
EXTRN sub_1003597B:PROC
EXTRN sub_10035980:PROC
EXTRN sub_10035984:PROC
EXTRN sub_1003A960:PROC
EXTRN sub_100F6349:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN g_101D1BA8:DWORD:DWORD
EXTRN EXTRN g_1073055C:DWORD:DWORD
.CODE
FUN_10035890 PROC
    mov mov eax, 02008h
    call sub_100F883A
    push push ebx
    push push esi
    push push edi
    lea lea edi, [esp + 12]
    mov mov ebx, 01000C7E0h
    mov mov dword ptr [esp + 12], 0
    call sub_1000D4A3
    mov mov eax, dword ptr [esp + 12]
    push push 010035850h
    push push 4
    push push eax
    lea lea ecx, [esp + 28]
    push push ecx
    call sub_100F6349
    mov mov eax, dword ptr [esp + 28]
    xor xor ecx, ecx
    add add esp, 16
    xor xor esi, esi
    cmp cmp eax, ecx
    jle sub_10035973
    jmp L0
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [esp + esi*4 + 16]
    cmp cmp byte ptr [eax + 10], cl
    je sub_10035984
    cmp cmp dword ptr [eax], 3
    jne sub_10035980
    push push 03F800000h
    push push 03F800000h
    push push ecx
    push push ecx
    push push 041000000h
    push push 041000000h
    push push ecx
    mov mov dword ptr [g_1073055C], eax
    mov mov eax, dword ptr [g_101D1BA8]
    push push ecx
    or or ebx, -1
    call sub_1002E8D8
    add add esp, 32
    call sub_1003A960
    xor xor ecx, ecx
    mov mov eax, dword ptr [esp + 12]
    inc inc esi
    cmp cmp esi, eax
    jl sub_1003597B
    pop pop edi
    pop pop esi
    mov mov dword ptr [g_1073055C], ecx
    pop pop ebx
FUN_10035890 ENDP
END
