.686
.MODEL FLAT, C
EXTRN sub_10029862:PROC
EXTRN sub_1002A6EA:PROC
EXTRN sub_1002A6F6:PROC
EXTRN sub_1002A6FA:PROC
EXTRN sub_1002A6FC:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_10696CD0:DWORD:DWORD
EXTRN EXTRN g_10696CD4:DWORD:DWORD
EXTRN EXTRN g_10696CD8:DWORD:DWORD
EXTRN EXTRN g_10696CDC:DWORD:DWORD
EXTRN EXTRN g_10696CE0:DWORD:DWORD
.CODE
FUN_1002a570 PROC
    mov mov ecx, dword ptr [g_101CE708]
    mov mov eax, dword ptr [edx + 0F4h]
    sub sub esp, 40
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [ecx + 8]
    dec dec eax
    cmp cmp esi, 2
    push push edi
    jne L0
    mov mov edi, dword ptr [edx + 012Ch]
    fld fld dword ptr [esp + 64]
    mov mov esi, dword ptr [esp + 68]
    lea lea ecx, [eax + eax*2]
    shl shl ecx, 5
    add add edi, ecx
    mov mov ecx, 24
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov edx, dword ptr [edx + 0130h]
    fstp fstp dword ptr [edx + eax*4]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 40
    ret ret
    cdq cdq
    idiv idiv dword ptr [g_10696CD0]
    lea lea ebx, [edx + edx]
    lea lea ecx, [eax + eax]
    xor xor edx, edx
    mov mov dword ptr [esp + 28], ebx
    mov mov dword ptr [esp + 32], ecx
    mov mov dword ptr [esp + 24], edx
    lea lea eax, [ecx + 2]
    jmp L1
    lea lea ebx, [ebx]
    cmp cmp ecx, eax
    mov mov dword ptr [esp + 20], ecx
    jge sub_1002A6F6
    lea lea ebp, [ebx + 2]
    nop nop
    cmp cmp ebx, ebp
    jge sub_1002A6EA
    mov mov eax, dword ptr [esp + 64]
    mov mov ecx, dword ptr [esp + 68]
    mov mov dword ptr [esp + 52], eax
    mov mov eax, ebp
    sub sub eax, ebx
    lea lea edi, [ecx + edx*4 + 64]
    add add edx, eax
    mov mov dword ptr [esp + 36], edx
    mov mov edi, edi
    mov mov ecx, dword ptr [edi - 64]
    mov mov edx, dword ptr [edi - 32]
    mov mov eax, dword ptr [edi]
    mov mov dword ptr [esp + 40], ecx
    mov mov ecx, dword ptr [g_10696CD4]
    imul imul ecx, dword ptr [esp + 24]
    mov mov dword ptr [esp + 44], edx
    mov mov edx, dword ptr [esp + 20]
    mov mov dword ptr [esp + 48], eax
    lea lea eax, [edx + ecx*2]
    imul imul eax, dword ptr [g_10696CD0]
    mov mov edx, dword ptr [g_10696CE0]
    lea lea ecx, [ebx + eax*2]
    lea lea esi, [edx + ecx*4]
    lea lea edx, [esp + 40]
    call sub_10029862
    add add edi, 4
    inc inc ebx
    cmp cmp ebx, ebp
    jl sub_1002A6FA
    mov mov ebx, dword ptr [esp + 28]
    mov mov edx, dword ptr [esp + 36]
    mov mov ecx, dword ptr [esp + 32]
    mov mov esi, dword ptr [esp + 20]
    inc inc esi
    lea lea eax, [ecx + 2]
    cmp cmp esi, eax
    mov mov dword ptr [esp + 20], esi
    jl sub_1002A6FA
    mov mov esi, dword ptr [esp + 24]
    inc inc esi
    cmp cmp esi, 2
    mov mov dword ptr [esp + 24], esi
    jl sub_1002A6FC
    fild fild dword ptr [esp + 28]
    mov mov eax, dword ptr [esp + 60]
    pop pop edi
    pop pop esi
    fadd fadd dword ptr [g_1019BC78]
    pop pop ebp
    pop pop ebx
    fmul fmul dword ptr [g_10696CD8]
    fstp fstp dword ptr [eax + 84]
    fild fild dword ptr [esp + 16]
    fadd fadd dword ptr [g_1019BC78]
    fmul fmul dword ptr [g_10696CDC]
    mov mov dword ptr [eax + 92], 03F000000h
FUN_1002a570 ENDP
END
