.686
.MODEL FLAT, C
EXTRN sub_10006C0A:PROC
EXTRN sub_100276F7:PROC
EXTRN sub_10027700:PROC
EXTRN sub_1002770F:PROC
EXTRN sub_10027720:PROC
EXTRN sub_1002774D:PROC
EXTRN sub_10027753:PROC
EXTRN sub_10027767:PROC
EXTRN sub_1002777C:PROC
EXTRN sub_10027793:PROC
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
EXTRN EXTRN g_10678510:DWORD:DWORD
EXTRN EXTRN g_10678AB8:DWORD:DWORD
EXTRN EXTRN g_10678ABC:DWORD:DWORD
.CODE
FUN_10027590 PROC
    sub sub esp, 104
    mov mov eax, dword ptr [g_10678AB8]
    mov mov dword ptr [ebx + 8], eax
    mov mov eax, dword ptr [ebx + 100]
    mov mov ecx, dword ptr [g_10678AB8]
    push push 5
    push push 0101904A8h
    add add eax, 72
    lea lea edx, [esp + 12]
    mov mov dword ptr [ebx + 4], ecx
    call sub_10006C0A
    mov mov ecx, dword ptr [esp + 116]
    xor xor eax, eax
    add add esp, 8
    test test ecx, ecx
    mov mov dword ptr [esp], eax
    je sub_10027700
    push push ebp
    mov mov ebp, dword ptr [g_10678ABC]
    push push esi
    push push edi
    jmp L1
    lea lea esp, [esp]
    mov mov ecx, dword ptr [ebp + eax*8]
    lea lea edi, [ebp + eax*8]
    mov mov edx, ecx
    and and edx, 080000000h
    mov mov eax, ecx
    je L2
    shr shr eax, 19
    jmp L3
    shr shr eax, 4
    and and eax, 0FFFh
    cmp cmp eax, 0800h
    jl L4
    mov mov eax, 07FEh
    test test edx, edx
    je L5
    shr shr ecx, 9
    jmp L6
    shr shr ecx, 21
    and and ecx, 03FFh
    mov mov ecx, dword ptr [ecx*4 + 0101D0B08h]
    mov mov edx, dword ptr [ecx + 56]
L1:
    mov mov ecx, dword ptr [edx + 084h]
    test test ecx, ecx
    je sub_1002774D
    cmp cmp eax, dword ptr [esp + 124]
    je sub_10027753
    mov mov ecx, dword ptr [edi + 4]
    cmp cmp dword ptr [ecx], 6
    jne sub_100276F7
    lea lea eax, [ecx + 4]
    jmp sub_10027720
    cmp cmp eax, 07FEh
    jge sub_10027767
    mov mov edx, dword ptr [g_10678510]
    mov mov ecx, eax
    imul imul ecx, ecx, 116
    test test dword ptr [ecx + edx + 4], 0100h
    je sub_1002777C
    imul imul eax, eax, 52
L3:
    add add eax, 010678AD8h
    mov mov esi, eax
    lea lea ecx, [esp + 16]
    call L0
    test test al, al
    jne sub_10027793
    mov mov ecx, dword ptr [edi]
    mov mov eax, dword ptr [ebx + 8]
    mov mov dword ptr [ebp + eax*8], ecx
    mov mov edx, dword ptr [edi + 4]
L4:
    mov mov ecx, dword ptr [g_10678ABC]
    mov mov dword ptr [ecx + eax*8 + 4], edx
    mov mov esi, dword ptr [ebx + 8]
    mov mov eax, dword ptr [g_101DA9C8]
L5:
    inc inc esi
    mov mov dword ptr [ebx + 8], esi
    inc inc dword ptr [g_10678AB8]
    inc inc dword ptr [eax + 4]
    mov mov ebp, dword ptr [g_10678ABC]
    mov mov eax, dword ptr [esp + 12]
    mov mov ecx, dword ptr [esp + 120]
    inc inc eax
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 12], eax
    jne sub_1002770F
FUN_10027590 ENDP
END
