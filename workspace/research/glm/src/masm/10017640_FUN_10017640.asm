.686
.MODEL FLAT, C
EXTRN sub_1000FADF:PROC
EXTRN sub_10013977:PROC
EXTRN g_101D0A74:DWORD
EXTRN g_101D0A78:DWORD
.CODE
FUN_10017640 PROC
    mov eax, dword ptr [esp + 4]
    push ebx
    push esi
    push edi
    movzx edi, word ptr [eax + 52]
    xor esi, esi
    lea ecx, [ecx]
L0:
    xor ebx, ebx
    test edi, edi
    je L4
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [ecx + 60]
    add eax, 8
    mov edx, edi
L1:
    cmp byte ptr [eax - 3], 5
    je L3
    mov ecx, dword ptr [eax]
    cmp ecx, ebx
    jbe L3
    test esi, esi
    je L2
    cmp ecx, esi
    jae L3
L2:
    mov ebx, ecx
L3:
    add eax, 12
    dec edx
    jne L1
L4:
    test ebx, ebx
    mov esi, ebx
    je L8
    movzx eax, byte ptr [ebx + 12]
    test eax, eax
    jl L5
    cmp eax, 1
    jle L6
    cmp eax, 4
    je L6
L5:
    mov edx, dword ptr [ebx + 16]
    mov eax, dword ptr [g_101D0A74]
    mov ecx, dword ptr [g_101D0A78]
    sub eax, edx
    mov dword ptr [g_101D0A74], eax
    mov eax, dword ptr [ebx + 20]
    sub ecx, eax
    mov dword ptr [g_101D0A78], ecx
L6:
    mov eax, dword ptr [ebx + 4]
    test eax, eax
    je L7
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    lea eax, [ebx + 16]
    mov dword ptr [ebx + 4], 0
    xor edx, edx
    mov dword ptr [eax], edx
    mov dword ptr [eax + 4], edx
L7:
    mov dword ptr [ebx], 0
    call sub_1000FADF
    test al, al
    jne L0
    mov ecx, dword ptr [ebx + 32]
    push ecx
    push 010193544h
    push 1
    call sub_10013977
    add esp, 12
    jmp L0
L8:
    pop edi
    pop esi
    pop ebx
    ret
FUN_10017640 ENDP
END
