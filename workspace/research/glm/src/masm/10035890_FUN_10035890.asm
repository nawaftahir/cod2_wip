.686
.MODEL FLAT, C
EXTRN sub_1000D4A3:PROC
EXTRN sub_1002E8D8:PROC
EXTRN sub_1003A960:PROC
EXTRN sub_100F6349:PROC
EXTRN sub_100F883A:PROC
EXTRN g_101D1BA8:DWORD
EXTRN g_1073055C:DWORD
.CODE
FUN_10035890 PROC
    mov eax, 000002008h
    call sub_100F883A
    push ebx
    push esi
    push edi
    lea edi, [esp + 12]
    mov ebx, 01000C7E0h
    mov dword ptr [esp + 12], 0
    call sub_1000D4A3
    mov eax, dword ptr [esp + 12]
    push 010035850h
    push 4
    push eax
    lea ecx, [esp + 28]
    push ecx
    call sub_100F6349
    mov eax, dword ptr [esp + 28]
    xor ecx, ecx
    add esp, 16
    xor esi, esi
    cmp eax, ecx
    jle L2
    jmp L0
    lea ebx, [ebx]
L0:
    mov eax, dword ptr [esp + esi*4 + 16]
    cmp byte ptr [eax + 10], cl
    je L2
    cmp dword ptr [eax], 3
    jne L1
    push 03F800000h
    push 03F800000h
    push ecx
    push ecx
    push 041000000h
    push 041000000h
    push ecx
    mov dword ptr [g_1073055C], eax
    mov eax, dword ptr [g_101D1BA8]
    push ecx
    or ebx, 0FFFFFFFFh
    call sub_1002E8D8
    add esp, 32
    call sub_1003A960
    xor ecx, ecx
L1:
    mov eax, dword ptr [esp + 12]
    inc esi
    cmp esi, eax
    jl L0
L2:
    pop edi
    pop esi
    mov dword ptr [g_1073055C], ecx
    pop ebx
FUN_10035890 ENDP
END
