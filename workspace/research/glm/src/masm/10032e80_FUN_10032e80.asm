.686
.MODEL FLAT, C
EXTRN g_101D494C:DWORD
EXTRN g_101D4950:DWORD
EXTRN g_101D4958:DWORD
.CODE
FUN_10032e80 PROC
    mov al, byte ptr [g_101D4958]
    sub esp, 8
    test al, al
    je L5
    mov eax, dword ptr [g_101D494C]
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 088760868h
    je L0
    cmp eax, 1
    setne al
    test al, al
    je L1
L0:
    mov byte ptr [g_101D4958], 0
    add esp, 8
    ret
L1:
    push esi
    rdtsc
    mov dword ptr [esp + 8], edx
    mov esi, eax
L2:
    mov al, byte ptr [g_101D4958]
    test al, al
    je L4
    mov eax, dword ptr [g_101D494C]
    mov edx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [edx + 0x1c]
    cmp eax, 088760868h
    je L3
    cmp eax, 1
    setne al
    test al, al
    jne L3
    rdtsc
    mov ecx, dword ptr [g_101D4950]
    sub eax, esi
    cmp eax, ecx
    mov dword ptr [esp + 8], edx
    jle L2
L3:
    mov byte ptr [g_101D4958], 0
L4:
    rdtsc
    mov ecx, dword ptr [g_101D4950]
    sub eax, esi
    lea eax, [eax + eax*2]
    mov dword ptr [esp + 8], edx
    cdq
    and edx, 3
    add eax, edx
    sar eax, 2
    add ecx, eax
    mov dword ptr [g_101D4950], ecx
    pop esi
L5:
    add esp, 8
    ret
FUN_10032e80 ENDP
END
