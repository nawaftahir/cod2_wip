.686
.MODEL FLAT, C
EXTRN sub_10005FD5:PROC
EXTRN sub_10007A5A:PROC
EXTRN sub_10007D75:PROC
EXTRN sub_1001391D:PROC
EXTRN sub_100139D1:PROC
EXTRN fp_101D49DC:DWORD
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5C0:DWORD
EXTRN g_101CE5C4:DWORD
EXTRN g_101CE5C8:DWORD
EXTRN g_101CE5CC:DWORD
EXTRN g_101CE5D0:DWORD
EXTRN g_101CE5D4:DWORD
EXTRN g_101CE5D8:DWORD
EXTRN g_101CE5DC:DWORD
EXTRN g_101CE6E0:DWORD
EXTRN g_101DA9C8:DWORD
.CODE
FUN_10007aa0 PROC
    sub esp, 16
    push ebp
    xor ebp, ebp
    push edi
    mov edi, dword ptr [esp + 28]
    mov dword ptr [g_101CE5C0], ebp
    mov dword ptr [g_101CE5C8], ebp
    cmp dword ptr [edi + 48], ebp
    mov dword ptr [esp + 20], ebp
    jle sub_10007D75
    push ebx
    push esi
L0:
    mov eax, dword ptr [edi + 52]
    mov esi, dword ptr [eax + ebp*4]
    mov eax, dword ptr [esp + 44]
    mov ecx, dword ptr [esp + 40]
    push esi
    call sub_10007A5A
    add esp, 4
    test al, al
    jne L11
    cmp dword ptr [g_101CE5C0], 000000400h
    jne L1
    push 010192608h
    push 1
    call sub_1001391D
    add esp, 8
L1:
    mov edx, dword ptr [g_101CE5C0]
    mov ecx, dword ptr [g_101CE5C4]
    mov dword ptr [ecx + edx*4], esi
    inc dword ptr [g_101CE5C0]
    mov dword ptr [esi + 24], 07FFFFFFFh
    mov eax, dword ptr [g_101CE5C8]
    mov dword ptr [esi + 28], eax
    mov eax, dword ptr [g_101CE5C8]
    mov edx, dword ptr [g_101CE5CC]
    lea ecx, [eax + eax*4]
    lea eax, [edx + ecx*4]
    mov dword ptr [esi + 32], eax
    mov eax, dword ptr [esi]
    xor ebx, ebx
    test eax, eax
    jle L5
    xor edi, edi
    jmp L2
    lea esp, [esp]
    nop
L2:
    mov ecx, dword ptr [esi + 4]
    mov byte ptr [edi + ecx + 19], 0
    fld dword ptr [g_101CE5D4]
    mov edx, dword ptr [esi + 4]
    fmul dword ptr [edi + edx + 4]
    lea ecx, [edi + edx]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [ecx + 8]
    faddp st(1)
    fld dword ptr [g_101CE5DC]
    fmul dword ptr [ecx + 12]
    faddp st(1)
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [ecx]
    faddp st(1)
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    jne L4
    mov byte ptr [ecx + 19], 1
    mov eax, dword ptr [g_101CE5C8]
    cmp eax, 000001800h
    jne L3
    push 0101925E8h
    push 1
    call sub_100139D1
    mov eax, dword ptr [g_101CE5C8]
    add esp, 8
L3:
    mov ecx, dword ptr [esi + 4]
    lea edx, [eax + eax*4]
    mov eax, dword ptr [g_101CE5CC]
    lea edx, [eax + edx*4]
    add ecx, edi
    mov eax, dword ptr [ecx]
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [ecx + 8]
    mov dword ptr [edx + 8], eax
    mov eax, dword ptr [ecx + 12]
    mov dword ptr [edx + 12], eax
    mov ecx, dword ptr [ecx + 16]
    mov dword ptr [edx + 16], ecx
    inc dword ptr [g_101CE5C8]
L4:
    mov eax, dword ptr [esi]
    inc ebx
    add edi, 20
    cmp ebx, eax
    jl L2
L5:
    mov ecx, dword ptr [esi + 8]
    xor eax, eax
    cmp ecx, eax
    mov dword ptr [esp + 16], eax
    jle L10
    mov dword ptr [esp + 20], eax
    mov edi, edi
L6:
    mov edx, dword ptr [esi + 12]
    mov ecx, dword ptr [eax + edx + 4]
    mov bl, byte ptr [ecx + 19]
    add eax, edx
    mov edx, dword ptr [eax]
    mov dl, byte ptr [edx + 19]
    cmp dl, bl
    je L9
    mov ecx, dword ptr [g_101CE6E0]
    mov edx, dword ptr [ecx + 8]
    test edx, edx
    je L8
    mov ecx, dword ptr [g_101DA9C8]
    mov edx, dword ptr [ecx + 000249D4Ch]
    mov ebp, dword ptr [eax + 12]
    mov ebx, dword ptr [eax + 8]
    mov eax, dword ptr [ecx + 000249D50h]
    lea edi, [ecx + 000249D4Ch]
    inc edx
    cmp edx, eax
    jg L8
    mov edx, dword ptr [ecx + 000249D48h]
    add ecx, 000249D48h
    test edx, edx
    mov dword ptr [esp + 24], ecx
    jne L7
    imul eax, eax, 44
    push eax
    call dword ptr [fp_101D49DC]
    mov ecx, dword ptr [esp + 28]
    add esp, 4
    mov dword ptr [ecx], eax
L7:
    mov eax, dword ptr [edi]
    mov edx, dword ptr [ecx]
    imul eax, eax, 44
    add eax, edx
    mov edx, dword ptr [ebx]
    mov dword ptr [eax], edx
    mov ecx, dword ptr [ebx + 4]
    mov dword ptr [eax + 4], ecx
    mov edx, dword ptr [ebx + 8]
    mov dword ptr [eax + 8], edx
    mov ecx, dword ptr [ebp]
    mov dword ptr [eax + 12], ecx
    mov edx, dword ptr [ebp + 4]
    mov dword ptr [eax + 16], edx
    mov ecx, dword ptr [ebp + 8]
    mov dword ptr [eax + 20], ecx
    mov ecx, 03F800000h
    xor edx, edx
    mov dword ptr [eax + 24], ecx
    mov dword ptr [eax + 28], edx
    mov dword ptr [eax + 32], ecx
    mov dword ptr [eax + 36], ecx
    mov dword ptr [eax + 40], edx
    inc dword ptr [edi]
L8:
    mov edi, dword ptr [esi + 12]
    mov edx, dword ptr [esp + 20]
    mov eax, dword ptr [edx + edi]
    movzx ecx, byte ptr [eax + 19]
    mov ebp, dword ptr [esp + 16]
    mov eax, dword ptr [g_101CE5C8]
    shl ebp, 2
    xor ebx, ebx
    test ecx, ecx
    sete bl
    lea edx, [eax + eax*4]
    mov eax, dword ptr [g_101CE5CC]
    lea eax, [eax + edx*4]
    lea edx, [ecx + ebp]
    mov ecx, dword ptr [edi + edx*4 + 8]
    add ebx, ebp
    mov edi, dword ptr [edi + ebx*4 + 8]
    call sub_10005FD5
    inc dword ptr [g_101CE5C8]
L9:
    mov ecx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 20]
    mov edx, dword ptr [esi + 8]
    inc ecx
    add eax, 16
    cmp ecx, edx
    mov dword ptr [esp + 16], ecx
    mov dword ptr [esp + 20], eax
    jl L6
    mov ebp, dword ptr [esp + 28]
L10:
    mov eax, dword ptr [g_101CE5C8]
    mov ecx, dword ptr [esi + 28]
    mov edi, dword ptr [esp + 36]
    sub eax, ecx
    mov dword ptr [esi + 28], eax
L11:
    mov eax, dword ptr [edi + 48]
    inc ebp
    cmp ebp, eax
    mov dword ptr [esp + 28], ebp
    jl L0
FUN_10007aa0 ENDP
END
