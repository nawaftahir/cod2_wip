.686
.MODEL FLAT, C
EXTRN sub_10014E2A:PROC
EXTRN sub_10014F83:PROC
EXTRN g_101CE6FC:DWORD
EXTRN g_10678514:DWORD
EXTRN g_10678AB8:DWORD
.CODE
FUN_10014fc0 PROC
    mov ecx, dword ptr [g_10678514]
    sub esp, 000000080h
    push ebx
    push ebp
    push esi
    mov esi, eax
    xor ebx, ebx
    xor eax, eax
    test ecx, ecx
    push edi
    jle L2
    mov edx, 010678518h
    nop
L0:
    cmp byte ptr [eax + 010678A98h], 0
    jne L1
    mov dword ptr [esp + ebx*4 + 16], edx
    inc ebx
L1:
    inc eax
    add edx, 44
    cmp eax, ecx
    jl L0
L2:
    mov eax, dword ptr [g_101CE6FC]
    mov eax, dword ptr [eax + 8]
    cmp eax, esi
    jge L3
    mov esi, eax
L3:
    cmp ebx, esi
    jle L4
    push esi
    push ebx
    lea eax, [esp + 24]
    call sub_10014F83
    add esp, 8
    mov ebx, esi
L4:
    xor ebp, ebp
    xor edi, edi
    test ebx, ebx
    jle L7
    mov esi, dword ptr [esp + 00000009Ch]
    add esi, 4
    lea ebx, [ebx]
L5:
    mov eax, dword ptr [esp + edi*4 + 16]
    mov dword ptr [esi - 4], eax
    mov ecx, dword ptr [g_10678AB8]
    mov dword ptr [esi], ecx
    mov edx, dword ptr [eax + 16]
    mov ecx, dword ptr [esp + 000000094h]
    add eax, 4
    push edx
    push eax
    mov eax, dword ptr [esp + 0000000A0h]
    call sub_10014E2A
    mov eax, dword ptr [g_10678AB8]
    mov ecx, dword ptr [esi]
    add esp, 8
    sub eax, ecx
    mov dword ptr [esi + 4], eax
    je L6
    inc ebp
    add esi, 12
L6:
    inc edi
    cmp edi, ebx
    jl L5
L7:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    add esp, 000000080h
    ret
FUN_10014fc0 ENDP
END
