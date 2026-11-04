.686
.MODEL FLAT, C
EXTRN sub_10006C0A:PROC
EXTRN sub_10027625:PROC
EXTRN sub_10027700:PROC
EXTRN g_101DA9C8:DWORD
EXTRN g_10678510:DWORD
EXTRN g_10678AB8:DWORD
EXTRN g_10678ABC:DWORD
.CODE
FUN_10027590 PROC
    sub esp, 104
    mov eax, dword ptr [g_10678AB8]
    mov dword ptr [ebx + 8], eax
    mov eax, dword ptr [ebx + 100]
    mov ecx, dword ptr [g_10678AB8]
    push 5
    push 0101904A8h
    add eax, 72
    lea edx, [esp + 12]
    mov dword ptr [ebx + 4], ecx
    call sub_10006C0A
    mov ecx, dword ptr [esp + 116]
    xor eax, eax
    add esp, 8
    test ecx, ecx
    mov dword ptr [esp], eax
    je sub_10027700
    push ebp
    mov ebp, dword ptr [g_10678ABC]
    push esi
    push edi
    jmp L0
    lea esp, [esp]
L0:
    mov ecx, dword ptr [ebp + eax*8]
    lea edi, [ebp + eax*8]
    mov edx, ecx
    and edx, 080000000h
    mov eax, ecx
    je L1
    shr eax, 19
    jmp L2
L1:
    shr eax, 4
L2:
    and eax, 000000FFFh
    cmp eax, 000000800h
    jl L3
    mov eax, 0000007FEh
L3:
    test edx, edx
    je L4
    shr ecx, 9
    jmp L5
L4:
    shr ecx, 21
L5:
    and ecx, 0000003FFh
    mov ecx, dword ptr [ecx*4 + 0101D0B08h]
    mov edx, dword ptr [ecx + 56]
    mov ecx, dword ptr [edx + 000000084h]
    test ecx, ecx
    je L8
    cmp eax, dword ptr [esp + 124]
    je L8
    mov ecx, dword ptr [edi + 4]
    cmp dword ptr [ecx], 6
    jne L6
    lea eax, [ecx + 4]
    jmp L7
L6:
    cmp eax, 0000007FEh
    jge L8
    mov edx, dword ptr [g_10678510]
    mov ecx, eax
    imul ecx, ecx, 116
    test dword ptr [ecx + edx + 4], 000000100h
    je L8
    imul eax, eax, 52
    add eax, 010678AD8h
L7:
    mov esi, eax
    lea ecx, [esp + 16]
    call sub_10027625
    test al, al
    jne L8
    mov ecx, dword ptr [edi]
    mov eax, dword ptr [ebx + 8]
    mov dword ptr [ebp + eax*8], ecx
    mov edx, dword ptr [edi + 4]
    mov ecx, dword ptr [g_10678ABC]
    mov dword ptr [ecx + eax*8 + 4], edx
    mov esi, dword ptr [ebx + 8]
    mov eax, dword ptr [g_101DA9C8]
    inc esi
    mov dword ptr [ebx + 8], esi
    inc dword ptr [g_10678AB8]
    inc dword ptr [eax + 4]
    mov ebp, dword ptr [g_10678ABC]
L8:
    mov eax, dword ptr [esp + 12]
    mov ecx, dword ptr [esp + 120]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 12], eax
    jne L0
FUN_10027590 ENDP
END
