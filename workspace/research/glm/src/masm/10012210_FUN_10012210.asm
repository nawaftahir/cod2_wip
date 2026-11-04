.686
.MODEL FLAT, C
EXTRN sub_10011EC4:PROC
EXTRN sub_1002359A:PROC
EXTRN sub_1002BB2F:PROC
EXTRN g_101D4938:DWORD
EXTRN g_101D494C:DWORD
EXTRN g_101D49A8:DWORD
EXTRN g_101D49AC:DWORD
EXTRN g_101D49B4:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10012210 PROC
    mov eax, dword ptr [g_101D4938]
    push ebx
    push ebp
    push esi
    push edi
    xor ebx, ebx
    xor edi, edi
    cmp eax, ebx
    jle L1
    mov esi, 0101D4940h
L0:
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    cmp dword ptr [g_1076A830], ebx
    mov dword ptr [esi], ebx
    jne L0
    mov eax, dword ptr [g_101D4938]
    inc edi
    add esi, 16
    cmp edi, eax
    jl L0
L1:
    call sub_1002359A
    call sub_1002BB2F
    mov eax, dword ptr [g_101D49B4]
    cmp eax, ebx
    je L3
L2:
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    cmp ecx, ebx
    mov dword ptr [g_101D49B4], eax
    jne L2
L3:
    call sub_10011EC4
    mov eax, dword ptr [g_101D49A8]
    cmp eax, ebx
    je L5
    lea ecx, [ecx]
L4:
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    cmp ecx, ebx
    jne L4
    mov dword ptr [g_101D49A8], ebx
L5:
    mov eax, dword ptr [g_101D49AC]
    cmp eax, ebx
    je L7
L6:
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    cmp ecx, ebx
    jne L6
    mov dword ptr [g_101D49AC], ebx
L7:
    mov eax, dword ptr [g_101D494C]
    cmp eax, ebx
    je L9
L8:
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [g_1076A830]
    xor eax, eax
    cmp ecx, ebx
    mov dword ptr [g_101D494C], eax
    jne L8
L9:
    mov ebx, 0107645B4h
    mov ebp, 4
L10:
    mov esi, ebx
    mov edi, 2
    lea ebx, [ebx]
L11:
    cmp dword ptr [esi], 0
    je L13
L12:
    mov eax, dword ptr [esi]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    mov dword ptr [esi], 0
    jne L12
L13:
    add esi, 4
    dec edi
    jne L11
    add ebx, 48
    dec ebp
    jne L10
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_10012210 ENDP
END
