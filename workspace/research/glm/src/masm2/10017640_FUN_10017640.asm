.686
.MODEL FLAT, C
EXTRN sub_1000FADF:PROC
EXTRN sub_10013977:PROC
EXTRN sub_10017707:PROC
EXTRN sub_1001770C:PROC
EXTRN sub_1001770F:PROC
EXTRN sub_10017743:PROC
EXTRN sub_10017751:PROC
EXTRN EXTRN g_101D0A74:DWORD:DWORD
EXTRN EXTRN g_101D0A78:DWORD:DWORD
.CODE
FUN_10017640 PROC
    mov mov eax, dword ptr [esp + 4]
    push push ebx
    push push esi
    push push edi
    movzx movzx edi, word ptr [eax + 52]
    xor xor esi, esi
    lea lea ecx, [ecx]
    xor xor ebx, ebx
    test test edi, edi
    je L0
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [ecx + 60]
    add add eax, 8
    mov mov edx, edi
    cmp cmp byte ptr [eax - 3], 5
    je L1
    mov mov ecx, dword ptr [eax]
    cmp cmp ecx, ebx
    jbe L2
    test test esi, esi
    je L3
    cmp cmp ecx, esi
    jae L4
    mov mov ebx, ecx
    add add eax, 12
    dec dec edx
    jne L1
    test test ebx, ebx
    mov mov esi, ebx
    je sub_10017743
    movzx movzx eax, byte ptr [ebx + 12]
    test test eax, eax
    jl L5
    cmp cmp eax, 1
    jle sub_10017707
    cmp cmp eax, 4
L0:
    je sub_1001770C
    mov mov edx, dword ptr [ebx + 16]
    mov mov eax, dword ptr [g_101D0A74]
    mov mov ecx, dword ptr [g_101D0A78]
    sub sub eax, edx
L2:
    mov mov dword ptr [g_101D0A74], eax
    mov mov eax, dword ptr [ebx + 20]
L4:
    sub sub ecx, eax
    mov mov dword ptr [g_101D0A78], ecx
    mov mov eax, dword ptr [ebx + 4]
    test test eax, eax
    je sub_10017751
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    lea lea eax, [ebx + 16]
    mov mov dword ptr [ebx + 4], 0
    xor xor edx, edx
    mov mov dword ptr [eax], edx
    mov mov dword ptr [eax + 4], edx
    mov mov dword ptr [ebx], 0
    call sub_1000FADF
    test test al, al
    jne L6
    mov mov ecx, dword ptr [ebx + 32]
    push push ecx
    push push 010193544h
    push push 1
    call sub_10013977
L6:
    add add esp, 12
    jmp sub_1001770F
    pop pop edi
    pop pop esi
    pop pop ebx
    ret ret
FUN_10017640 ENDP
END
