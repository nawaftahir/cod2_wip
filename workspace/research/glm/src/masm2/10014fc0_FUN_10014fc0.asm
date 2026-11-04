.686
.MODEL FLAT, C
EXTRN sub_10014E2A:PROC
EXTRN sub_10014F83:PROC
EXTRN sub_100150D4:PROC
EXTRN sub_100150E4:PROC
EXTRN sub_1001511A:PROC
EXTRN EXTRN g_101CE6FC:DWORD:DWORD
EXTRN EXTRN g_10678514:DWORD:DWORD
EXTRN EXTRN g_10678AB8:DWORD:DWORD
.CODE
FUN_10014fc0 PROC
    mov mov ecx, dword ptr [g_10678514]
    sub sub esp, 080h
    push push ebx
    push push ebp
    push push esi
    mov mov esi, eax
    xor xor ebx, ebx
    xor xor eax, eax
    test test ecx, ecx
    push push edi
    jle L0
    mov mov edx, 010678518h
    nop nop
    cmp cmp byte ptr [eax + 010678A98h], 0
    jne L2
    mov mov dword ptr [esp + ebx*4 + 16], edx
    inc inc ebx
    inc inc eax
    add add edx, 44
    cmp cmp eax, ecx
    jl L1
    mov mov eax, dword ptr [g_101CE6FC]
    mov mov eax, dword ptr [eax + 8]
    cmp cmp eax, esi
    jge L3
    mov mov esi, eax
    cmp cmp ebx, esi
    jle L4
    push push esi
    push push ebx
    lea lea eax, [esp + 24]
    call sub_10014F83
    add add esp, 8
L1:
    mov mov ebx, esi
    xor xor ebp, ebp
    xor xor edi, edi
    test test ebx, ebx
    jle sub_100150D4
    mov mov esi, dword ptr [esp + 09Ch]
    add add esi, 4
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [esp + edi*4 + 16]
    mov mov dword ptr [esi - 4], eax
    mov mov ecx, dword ptr [g_10678AB8]
    mov mov dword ptr [esi], ecx
    mov mov edx, dword ptr [eax + 16]
    mov mov ecx, dword ptr [esp + 094h]
    add add eax, 4
    push push edx
    push push eax
    mov mov eax, dword ptr [esp + 0A0h]
    call sub_10014E2A
    mov mov eax, dword ptr [g_10678AB8]
    mov mov ecx, dword ptr [esi]
    add add esp, 8
    sub sub eax, ecx
    mov mov dword ptr [esi + 4], eax
    je sub_1001511A
    inc inc ebp
    add add esi, 12
    inc inc edi
    cmp cmp edi, ebx
    jl sub_100150E4
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    add add esp, 080h
    ret ret
FUN_10014fc0 ENDP
END
