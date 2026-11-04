.686
.MODEL FLAT, C
EXTRN sub_10029862:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_10696CD0:DWORD
EXTRN g_10696CD4:DWORD
EXTRN g_10696CD8:DWORD
EXTRN g_10696CDC:DWORD
EXTRN g_10696CE0:DWORD
.CODE
FUN_1002a570 PROC
    mov ecx, dword ptr [g_101CE708]
    mov eax, dword ptr [edx + 0000000F4h]
    sub esp, 40
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [ecx + 8]
    dec eax
    cmp esi, 2
    push edi
    jne L0
    mov edi, dword ptr [edx + 00000012Ch]
    fld dword ptr [esp + 64]
    mov esi, dword ptr [esp + 68]
    lea ecx, [eax + eax*2]
    shl ecx, 5
    add edi, ecx
    mov ecx, 24
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edx, dword ptr [edx + 000000130h]
    fstp dword ptr [edx + eax*4]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 40
    ret
L0:
    cdq
    idiv dword ptr [g_10696CD0]
    lea ebx, [edx + edx]
    lea ecx, [eax + eax]
    xor edx, edx
    mov dword ptr [esp + 28], ebx
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 24], edx
    lea eax, [ecx + 2]
    jmp L1
    lea ebx, [ebx]
L1:
    cmp ecx, eax
    mov dword ptr [esp + 20], ecx
    jge L5
    lea ebp, [ebx + 2]
    nop
L2:
    cmp ebx, ebp
    jge L4
    mov eax, dword ptr [esp + 64]
    mov ecx, dword ptr [esp + 68]
    mov dword ptr [esp + 52], eax
    mov eax, ebp
    sub eax, ebx
    lea edi, [ecx + edx*4 + 64]
    add edx, eax
    mov dword ptr [esp + 36], edx
    mov edi, edi
L3:
    mov ecx, dword ptr [edi - 64]
    mov edx, dword ptr [edi - 32]
    mov eax, dword ptr [edi]
    mov dword ptr [esp + 40], ecx
    mov ecx, dword ptr [g_10696CD4]
    imul ecx, dword ptr [esp + 24]
    mov dword ptr [esp + 44], edx
    mov edx, dword ptr [esp + 20]
    mov dword ptr [esp + 48], eax
    lea eax, [edx + ecx*2]
    imul eax, dword ptr [g_10696CD0]
    mov edx, dword ptr [g_10696CE0]
    lea ecx, [ebx + eax*2]
    lea esi, [edx + ecx*4]
    lea edx, [esp + 40]
    call sub_10029862
    add edi, 4
    inc ebx
    cmp ebx, ebp
    jl L3
    mov ebx, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 36]
    mov ecx, dword ptr [esp + 32]
L4:
    mov esi, dword ptr [esp + 20]
    inc esi
    lea eax, [ecx + 2]
    cmp esi, eax
    mov dword ptr [esp + 20], esi
    jl L2
L5:
    mov esi, dword ptr [esp + 24]
    inc esi
    cmp esi, 2
    mov dword ptr [esp + 24], esi
    jl L1
    fild dword ptr [esp + 28]
    mov eax, dword ptr [esp + 60]
    pop edi
    pop esi
    fadd dword ptr [g_1019BC78]
    pop ebp
    pop ebx
    fmul dword ptr [g_10696CD8]
    fstp dword ptr [eax + 84]
    fild dword ptr [esp + 16]
    fadd dword ptr [g_1019BC78]
    fmul dword ptr [g_10696CDC]
    mov dword ptr [eax + 92], 03F000000h
FUN_1002a570 ENDP
END
