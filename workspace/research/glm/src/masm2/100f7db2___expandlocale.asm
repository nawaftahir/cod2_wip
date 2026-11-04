.686
.MODEL FLAT, C
EXTRN sub_100F5EFA:PROC
EXTRN sub_100F7C2F:PROC
EXTRN sub_100F7D4E:PROC
EXTRN sub_100F7F19:PROC
EXTRN sub_100F7F25:PROC
EXTRN sub_100F7F39:PROC
EXTRN sub_100F7F46:PROC
EXTRN sub_100F7F53:PROC
EXTRN sub_100F7F57:PROC
EXTRN sub_100F7F5E:PROC
EXTRN sub_100F7F93:PROC
EXTRN sub_100F7FA3:PROC
EXTRN sub_100F7FC8:PROC
EXTRN sub_100F7FEA:PROC
EXTRN sub_100F801A:PROC
EXTRN sub_100FA263:PROC
EXTRN sub_100FA2F1:PROC
EXTRN sub_100FCF12:PROC
EXTRN sub_100FCF2A:PROC
EXTRN sub_100FE9DB:PROC
EXTRN sub_1010041D:PROC
EXTRN sub_1010042E:PROC
EXTRN sub_10100C20:PROC
EXTRN sub_10100EA7:PROC
EXTRN EXTRN g_101A4732:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101ADD9C:DWORD:DWORD
EXTRN EXTRN g_101ADDA0:DWORD:DWORD
.CODE
__expandlocale PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 094h
    mov mov eax, dword ptr [g_101A50D0]
    push push esi
    mov mov esi, dword ptr [ebp + 8]
    xor xor edx, edx
    cmp cmp esi, edx
    mov mov dword ptr [ebp - 4], eax
    jne L0
    xor xor eax, eax
    jmp sub_100F7F25
    cmp cmp byte ptr [esi], 67
    jne L1
    cmp cmp byte ptr [esi + 1], 0
    jne L3
    mov mov eax, dword ptr [ebp + 12]
    mov mov ecx, dword ptr [ebp + 16]
    cmp cmp ecx, edx
    mov mov byte ptr [eax], 67
    mov mov byte ptr [eax + 1], 0
    je L2
    mov mov word ptr [ecx], dx
    mov mov word ptr [ecx + 2], dx
    mov mov word ptr [ecx + 4], dx
    mov mov ecx, dword ptr [ebp + 20]
    cmp cmp ecx, edx
    je sub_100F7F57
    mov mov dword ptr [ecx], edx
    jmp sub_100F7F5E
    push push ebx
    push push edi
    push push esi
    call sub_100FA263
    mov mov edi, 082h
    cmp cmp eax, edi
    pop pop ecx
    mov mov ebx, 0101A46B0h
    jae L4
    push push esi
    push push 0101A4738h
    call sub_1010041D
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je sub_100F7F46
L2:
    push push esi
L3:
    push push ebx
    call sub_1010042E
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je sub_100F7F53
    lea lea eax, [ebp - 094h]
    push push esi
    push push eax
    call sub_100F7C2F
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_100F7F19
    lea lea eax, [ebp - 094h]
    push push eax
    push push 0101ADD98h
    push push eax
    call sub_10100C20
    add add esp, 12
    test test eax, eax
    jne sub_100F7F39
    xor xor eax, eax
    jmp sub_100F7FC8
    movzx movzx eax, word ptr [g_101ADD9C]
    mov mov dword ptr [g_101ADDA0], eax
    lea lea eax, [ebp - 094h]
    push push eax
    push push 0101A4738h
    call sub_100F7D4E
    cmp cmp byte ptr [esi], 0
    pop pop ecx
    pop pop ecx
    je sub_100F7F93
    push push esi
    call sub_100FA2F1
    cmp cmp eax, edi
    pop pop ecx
    jb sub_100F7FA3
    mov mov esi, 01019166Eh
    push push edi
    push push esi
    push push ebx
    mov mov byte ptr [g_101A4732], 0
    call sub_100F5EFA
    add add esp, 12
    cmp cmp dword ptr [ebp + 16], 0
    je sub_100F7FEA
    push push 6
    push push 0101ADD98h
    push push dword ptr [ebp + 16]
    call sub_100FCF12
    add add esp, 12
    cmp cmp dword ptr [ebp + 20], 0
    je sub_100F801A
    push push 4
    push push 0101ADDA0h
    push push dword ptr [ebp + 20]
    call sub_100FCF2A
    add add esp, 12
    mov mov esi, 0101A4738h
    push push esi
    push push dword ptr [ebp + 12]
    call sub_100FE9DB
    pop pop ecx
    pop pop ecx
    mov mov eax, esi
    pop pop edi
    pop pop ebx
    mov mov ecx, dword ptr [ebp - 4]
    pop pop esi
    call sub_10100EA7
    leave leave
    ret ret
__expandlocale ENDP
END
