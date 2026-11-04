.686
.MODEL FLAT, C
EXTRN sub_10005FD5:PROC
EXTRN sub_10007A5A:PROC
EXTRN sub_10007D75:PROC
EXTRN sub_10007D84:PROC
EXTRN sub_10007E55:PROC
EXTRN sub_10007E61:PROC
EXTRN sub_10007E84:PROC
EXTRN sub_10007E94:PROC
EXTRN sub_10007E98:PROC
EXTRN sub_10007E9A:PROC
EXTRN sub_1001391D:PROC
EXTRN sub_100139D1:PROC
EXTRN EXTRN fp_101D49DC:DWORD:DWORD
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5C0:DWORD:DWORD
EXTRN EXTRN g_101CE5C4:DWORD:DWORD
EXTRN EXTRN g_101CE5C8:DWORD:DWORD
EXTRN EXTRN g_101CE5CC:DWORD:DWORD
EXTRN EXTRN g_101CE5D0:DWORD:DWORD
EXTRN EXTRN g_101CE5D4:DWORD:DWORD
EXTRN EXTRN g_101CE5D8:DWORD:DWORD
EXTRN EXTRN g_101CE5DC:DWORD:DWORD
EXTRN EXTRN g_101CE6E0:DWORD:DWORD
EXTRN EXTRN g_101DA9C8:DWORD:DWORD
.CODE
FUN_10007aa0 PROC
    sub sub esp, 16
    push push ebp
    xor xor ebp, ebp
    push push edi
    mov mov edi, dword ptr [esp + 28]
    mov mov dword ptr [g_101CE5C0], ebp
    mov mov dword ptr [g_101CE5C8], ebp
    cmp cmp dword ptr [edi + 48], ebp
    mov mov dword ptr [esp + 20], ebp
    jle sub_10007D75
    push push ebx
    push push esi
    mov mov eax, dword ptr [edi + 52]
    mov mov esi, dword ptr [eax + ebp*4]
    mov mov eax, dword ptr [esp + 44]
    mov mov ecx, dword ptr [esp + 40]
    push push esi
    call sub_10007A5A
    add add esp, 4
    test test al, al
    jne sub_10007D84
    cmp cmp dword ptr [g_101CE5C0], 0400h
    jne L0
    push push 010192608h
    push push 1
    call sub_1001391D
    add add esp, 8
    mov mov edx, dword ptr [g_101CE5C0]
    mov mov ecx, dword ptr [g_101CE5C4]
    mov mov dword ptr [ecx + edx*4], esi
    inc inc dword ptr [g_101CE5C0]
    mov mov dword ptr [esi + 24], 07FFFFFFFh
    mov mov eax, dword ptr [g_101CE5C8]
    mov mov dword ptr [esi + 28], eax
    mov mov eax, dword ptr [g_101CE5C8]
    mov mov edx, dword ptr [g_101CE5CC]
    lea lea ecx, [eax + eax*4]
    lea lea eax, [edx + ecx*4]
    mov mov dword ptr [esi + 32], eax
    mov mov eax, dword ptr [esi]
    xor xor ebx, ebx
    test test eax, eax
    jle L2
    xor xor edi, edi
    jmp L1
    lea lea esp, [esp]
    nop nop
    mov mov ecx, dword ptr [esi + 4]
    mov mov byte ptr [edi + ecx + 19], 0
    fld fld dword ptr [g_101CE5D4]
    mov mov edx, dword ptr [esi + 4]
    fmul fmul dword ptr [edi + edx + 4]
    lea lea ecx, [edi + edx]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [ecx + 8]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5DC]
    fmul fmul dword ptr [ecx + 12]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [ecx]
    faddp faddp st(1)
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    jne L5
    mov mov byte ptr [ecx + 19], 1
    mov mov eax, dword ptr [g_101CE5C8]
    cmp cmp eax, 01800h
    jne L4
    push push 0101925E8h
    push push 1
    call sub_100139D1
    mov mov eax, dword ptr [g_101CE5C8]
    add add esp, 8
    mov mov ecx, dword ptr [esi + 4]
    lea lea edx, [eax + eax*4]
    mov mov eax, dword ptr [g_101CE5CC]
    lea lea edx, [eax + edx*4]
    add add ecx, edi
    mov mov eax, dword ptr [ecx]
    mov mov dword ptr [edx], eax
    mov mov eax, dword ptr [ecx + 4]
    mov mov dword ptr [edx + 4], eax
    mov mov eax, dword ptr [ecx + 8]
    mov mov dword ptr [edx + 8], eax
    mov mov eax, dword ptr [ecx + 12]
    mov mov dword ptr [edx + 12], eax
    mov mov ecx, dword ptr [ecx + 16]
    mov mov dword ptr [edx + 16], ecx
    inc inc dword ptr [g_101CE5C8]
    mov mov eax, dword ptr [esi]
    inc inc ebx
    add add edi, 20
    cmp cmp ebx, eax
    jl L3
    mov mov ecx, dword ptr [esi + 8]
    xor xor eax, eax
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 16], eax
    jle sub_10007E98
    mov mov dword ptr [esp + 20], eax
    mov mov edi, edi
    mov mov edx, dword ptr [esi + 12]
    mov mov ecx, dword ptr [eax + edx + 4]
    mov mov bl, byte ptr [ecx + 19]
    add add eax, edx
    mov mov edx, dword ptr [eax]
    mov mov dl, byte ptr [edx + 19]
    cmp cmp dl, bl
    je sub_10007E94
    mov mov ecx, dword ptr [g_101CE6E0]
    mov mov edx, dword ptr [ecx + 8]
    test test edx, edx
    je sub_10007E61
    mov mov ecx, dword ptr [g_101DA9C8]
    mov mov edx, dword ptr [ecx + 0249D4Ch]
    mov mov ebp, dword ptr [eax + 12]
    mov mov ebx, dword ptr [eax + 8]
    mov mov eax, dword ptr [ecx + 0249D50h]
    lea lea edi, [ecx + 0249D4Ch]
    inc inc edx
    cmp cmp edx, eax
    jg sub_10007E84
    mov mov edx, dword ptr [ecx + 0249D48h]
    add add ecx, 0249D48h
    test test edx, edx
    mov mov dword ptr [esp + 24], ecx
    jne sub_10007E55
    imul imul eax, eax, 44
    push push eax
    call dword ptr [fp_101D49DC]
    mov mov ecx, dword ptr [esp + 28]
    add add esp, 4
    mov mov dword ptr [ecx], eax
    mov mov eax, dword ptr [edi]
    mov mov edx, dword ptr [ecx]
    imul imul eax, eax, 44
    add add eax, edx
    mov mov edx, dword ptr [ebx]
    mov mov dword ptr [eax], edx
    mov mov ecx, dword ptr [ebx + 4]
    mov mov dword ptr [eax + 4], ecx
    mov mov edx, dword ptr [ebx + 8]
    mov mov dword ptr [eax + 8], edx
L2:
    mov mov ecx, dword ptr [ebp]
    mov mov dword ptr [eax + 12], ecx
    mov mov edx, dword ptr [ebp + 4]
    mov mov dword ptr [eax + 16], edx
L3:
    mov mov ecx, dword ptr [ebp + 8]
    mov mov dword ptr [eax + 20], ecx
    mov mov ecx, 03F800000h
    xor xor edx, edx
    mov mov dword ptr [eax + 24], ecx
    mov mov dword ptr [eax + 28], edx
    mov mov dword ptr [eax + 32], ecx
    mov mov dword ptr [eax + 36], ecx
    mov mov dword ptr [eax + 40], edx
    inc inc dword ptr [edi]
    mov mov edi, dword ptr [esi + 12]
    mov mov edx, dword ptr [esp + 20]
    mov mov eax, dword ptr [edx + edi]
    movzx movzx ecx, byte ptr [eax + 19]
    mov mov ebp, dword ptr [esp + 16]
    mov mov eax, dword ptr [g_101CE5C8]
    shl shl ebp, 2
    xor xor ebx, ebx
    test test ecx, ecx
    sete sete bl
    lea lea edx, [eax + eax*4]
    mov mov eax, dword ptr [g_101CE5CC]
    lea lea eax, [eax + edx*4]
    lea lea edx, [ecx + ebp]
    mov mov ecx, dword ptr [edi + edx*4 + 8]
    add add ebx, ebp
    mov mov edi, dword ptr [edi + ebx*4 + 8]
    call sub_10005FD5
    inc inc dword ptr [g_101CE5C8]
    mov mov ecx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 20]
    mov mov edx, dword ptr [esi + 8]
    inc inc ecx
    add add eax, 16
    cmp cmp ecx, edx
    mov mov dword ptr [esp + 16], ecx
    mov mov dword ptr [esp + 20], eax
    jl sub_10007E9A
    mov mov ebp, dword ptr [esp + 28]
    mov mov eax, dword ptr [g_101CE5C8]
    mov mov ecx, dword ptr [esi + 28]
    mov mov edi, dword ptr [esp + 36]
    sub sub eax, ecx
    mov mov dword ptr [esi + 28], eax
    mov mov eax, dword ptr [edi + 48]
    inc inc ebp
    cmp cmp ebp, eax
    mov mov dword ptr [esp + 28], ebp
    jl sub_10007D75
FUN_10007aa0 ENDP
END
