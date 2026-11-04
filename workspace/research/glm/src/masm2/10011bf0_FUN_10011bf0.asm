.686
.MODEL FLAT, C
EXTRN sub_10004FC2:PROC
EXTRN sub_10005238:PROC
EXTRN sub_100052ED:PROC
EXTRN sub_10011EC4:PROC
EXTRN sub_10011EC7:PROC
EXTRN sub_10011ED0:PROC
EXTRN sub_10011F17:PROC
EXTRN sub_10011F68:PROC
EXTRN sub_100F62A3:PROC
EXTRN sub_100F62CA:PROC
EXTRN sub_100F62F1:PROC
EXTRN EXTRN g_1019BC78:DWORD:DWORD
EXTRN EXTRN g_1019BDAC:DWORD:DWORD
EXTRN EXTRN g_1019BDC8:DWORD:DWORD
EXTRN EXTRN g_1019BE48:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D49A8:DWORD:DWORD
EXTRN EXTRN g_101D49AC:DWORD:DWORD
.CODE
FUN_10011bf0 PROC
    sub sub esp, 84
    push push ebx
    push push ebp
    mov mov eax, 1
    push push esi
    mov mov ecx, 2
    push push edi
    mov mov word ptr [esp + 46], ax
    mov mov word ptr [esp + 52], ax
    xor xor ebx, ebx
    mov mov eax, 014000h
    mov mov edi, 0101D49A8h
    mov mov dword ptr [esp + 68], 0
    mov mov dword ptr [esp + 72], 0
    mov mov dword ptr [esp + 76], 0
    mov mov dword ptr [esp + 80], 03F800000h
    mov mov dword ptr [esp + 84], 03F800000h
    mov mov dword ptr [esp + 88], 0
    mov mov dword ptr [esp + 92], 03F800000h
    mov mov dword ptr [esp + 96], 03F800000h
    mov mov word ptr [esp + 44], bx
    mov mov word ptr [esp + 48], cx
    mov mov word ptr [esp + 50], cx
    mov mov word ptr [esp + 54], 3
    call sub_10004FC2
    push push ebx
    push push 0101D49ACh
    push push ebx
    push push 101
    push push 8
    mov mov esi, eax
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 03000h
    push push eax
    call call dword ptr [ecx + 108]
    test test eax, eax
    jge L0
    xor xor edi, edi
    jmp L1
    mov mov eax, dword ptr [g_101D49AC]
    mov mov edx, dword ptr [eax]
    push push ebx
    lea lea ecx, [esp + 32]
    push push ecx
    push push ebx
    push push ebx
    push push eax
    call call dword ptr [edx + 44]
    test test eax, eax
    jge L2
    mov mov eax, dword ptr [g_101D49AC]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    xor xor edi, edi
    jmp L3
    mov mov edi, dword ptr [esp + 28]
    mov mov dword ptr [esp + 16], ebx
    fild fild dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 16]
    shl shl eax, 7
    mov mov dword ptr [esp + 20], 0
    fstp fstp dword ptr [esp + 36]
    mov mov dword ptr [esp + 24], eax
    fild fild dword ptr [esp + 20]
    xor xor ebp, ebp
    mov mov dword ptr [esp + 28], ebp
    fstp fstp dword ptr [esp + 40]
    mov mov edi, edi
    mov mov eax, dword ptr [esp + 24]
    lea lea ebx, [eax + ebp]
    call sub_100F62A3
    mov mov dword ptr [esp + 32], eax
    fild fild dword ptr [esp + 32]
    fmul fmul dword ptr [g_1019BE48]
    fadd fadd dword ptr [esp + 36]
    fmul fmul dword ptr [g_1019BDC8]
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 56]
    call sub_100F62CA
    mov mov dword ptr [esp + 32], eax
    fild fild dword ptr [esp + 32]
    fmul fmul dword ptr [g_1019BE48]
    fadd fadd dword ptr [esp + 40]
    fmul fmul dword ptr [g_1019BDC8]
    fsub fsub dword ptr [g_1019BC78]
    fstp fstp dword ptr [esp + 60]
    call sub_100F62F1
    mov mov dword ptr [esp + 32], eax
    fild fild dword ptr [esp + 32]
    xor xor eax, eax
    fmul fmul dword ptr [g_1019BE48]
    fiadd fiadd dword ptr [esp + 28]
    fmul fmul dword ptr [g_1019BDAC]
    fsub fsub dword ptr [g_1019BC78]
    lea lea ebx, [ebx]
    mov mov ecx, dword ptr [esp + 56]
    fst fst dword ptr [esi + 8]
    mov mov edx, dword ptr [esp + 60]
L2:
    mov mov dword ptr [esi], ecx
    mov mov ecx, dword ptr [esp + eax*8 + 68]
    mov mov dword ptr [esi + 4], edx
    mov mov edx, dword ptr [esp + eax*8 + 72]
    mov mov dword ptr [esi + 12], ecx
    mov mov dword ptr [esi + 16], edx
L3:
    add add esi, 20
    inc inc eax
    cmp cmp eax, 4
    jne sub_10011F17
    fstp fstp st(0)
    xor xor eax, eax
    lea lea ecx, [ebx*4]
    mov mov dx, word ptr [esp + eax*2 + 44]
    add add dx, cx
    mov mov word ptr [edi], dx
    add add edi, 2
    inc inc eax
    cmp cmp eax, 6
    jne sub_10011F68
    inc inc ebp
    cmp cmp ebp, 16
    mov mov dword ptr [esp + 28], ebp
    jne sub_10011EC4
    mov mov eax, dword ptr [esp + 20]
    mov mov edx, dword ptr [esp + 24]
    inc inc eax
    add add edx, ebp
    cmp cmp eax, 8
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 24], edx
    jne sub_10011ED0
    mov mov eax, dword ptr [esp + 16]
    inc inc eax
    cmp cmp eax, 8
    mov mov dword ptr [esp + 16], eax
    jne sub_10011EC7
    mov mov esi, dword ptr [g_101D49AC]
    call sub_100052ED
    mov mov esi, dword ptr [g_101D49A8]
    call sub_10005238
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 84
    ret ret
FUN_10011bf0 ENDP
END
