.686
.MODEL FLAT, C
EXTRN sub_10011EC4:PROC
EXTRN sub_10012344:PROC
EXTRN sub_1001234A:PROC
EXTRN sub_1001238B:PROC
EXTRN sub_100123EB:PROC
EXTRN sub_100123F1:PROC
EXTRN sub_100123F2:PROC
EXTRN sub_1002359A:PROC
EXTRN sub_1002BB2F:PROC
EXTRN EXTRN g_101D4938:DWORD:DWORD
EXTRN EXTRN g_101D494C:DWORD:DWORD
EXTRN EXTRN g_101D49A8:DWORD:DWORD
EXTRN EXTRN g_101D49AC:DWORD:DWORD
EXTRN EXTRN g_101D49B4:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10012210 PROC
    mov mov eax, dword ptr [g_101D4938]
    push push ebx
    push push ebp
    push push esi
    push push edi
    xor xor ebx, ebx
    xor xor edi, edi
    cmp cmp eax, ebx
    jle L1
    mov mov esi, 0101D4940h
    mov mov eax, dword ptr [esi]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    cmp cmp dword ptr [g_1076A830], ebx
    mov mov dword ptr [esi], ebx
    jne L0
    mov mov eax, dword ptr [g_101D4938]
    inc inc edi
    add add esi, 16
    cmp cmp edi, eax
    jl L2
    call sub_1002359A
    call sub_1002BB2F
    mov mov eax, dword ptr [g_101D49B4]
    cmp cmp eax, ebx
L1:
    je L3
    mov mov edx, dword ptr [eax]
    push push eax
L2:
    call call dword ptr [edx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    cmp cmp ecx, ebx
    mov mov dword ptr [g_101D49B4], eax
    jne L3
    call sub_10011EC4
    mov mov eax, dword ptr [g_101D49A8]
    cmp cmp eax, ebx
    je L5
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    cmp cmp ecx, ebx
    jne L4
    mov mov dword ptr [g_101D49A8], ebx
    mov mov eax, dword ptr [g_101D49AC]
    cmp cmp eax, ebx
    je sub_1001234A
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    cmp cmp ecx, ebx
    jne sub_10012344
    mov mov dword ptr [g_101D49AC], ebx
    mov mov eax, dword ptr [g_101D494C]
    cmp cmp eax, ebx
    je sub_1001238B
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [g_1076A830]
    xor xor eax, eax
    cmp cmp ecx, ebx
    mov mov dword ptr [g_101D494C], eax
    jne sub_1001238B
    mov mov ebx, 0107645B4h
    mov mov ebp, 4
    mov mov esi, ebx
    mov mov edi, 2
    lea lea ebx, [ebx]
    cmp cmp dword ptr [esi], 0
    je sub_100123F1
    mov mov eax, dword ptr [esi]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    mov mov eax, dword ptr [g_1076A830]
L4:
    test test eax, eax
    mov mov dword ptr [esi], 0
    jne sub_100123F1
    add add esi, 4
    dec dec edi
    jne sub_100123F2
    add add ebx, 48
    dec dec ebp
    jne sub_100123EB
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10012210 ENDP
END
