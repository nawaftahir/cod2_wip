.686
.MODEL FLAT, C
EXTRN sub_10004FC2:PROC
EXTRN sub_10005238:PROC
EXTRN sub_100052ED:PROC
EXTRN sub_100F62A3:PROC
EXTRN sub_100F62CA:PROC
EXTRN sub_100F62F1:PROC
EXTRN g_1019BC78:DWORD
EXTRN g_1019BDAC:DWORD
EXTRN g_1019BDC8:DWORD
EXTRN g_1019BE48:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D49A8:DWORD
EXTRN g_101D49AC:DWORD
.CODE
FUN_10011bf0 PROC
    sub esp, 84
    push ebx
    push ebp
    mov eax, 1
    push esi
    mov ecx, 2
    push edi
    mov word ptr [esp + 46], ax
    mov word ptr [esp + 52], ax
    xor ebx, ebx
    mov eax, 000014000h
    mov edi, 0101D49A8h
    mov dword ptr [esp + 68], 0
    mov dword ptr [esp + 72], 0
    mov dword ptr [esp + 76], 0
    mov dword ptr [esp + 80], 03F800000h
    mov dword ptr [esp + 84], 03F800000h
    mov dword ptr [esp + 88], 0
    mov dword ptr [esp + 92], 03F800000h
    mov dword ptr [esp + 96], 03F800000h
    mov word ptr [esp + 44], bx
    mov word ptr [esp + 48], cx
    mov word ptr [esp + 50], cx
    mov word ptr [esp + 54], 3
    call sub_10004FC2
    push ebx
    push 0101D49ACh
    push ebx
    push 101
    push 8
    mov esi, eax
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 000003000h
    push eax
    call dword ptr [ecx + 0x6c]
    test eax, eax
    jge L0
    xor edi, edi
    jmp L2
L0:
    mov eax, dword ptr [g_101D49AC]
    mov edx, dword ptr [eax]
    push ebx
    lea ecx, [esp + 32]
    push ecx
    push ebx
    push ebx
    push eax
    call dword ptr [edx + 0x2c]
    test eax, eax
    jge L1
    mov eax, dword ptr [g_101D49AC]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    xor edi, edi
    jmp L2
L1:
    mov edi, dword ptr [esp + 28]
L2:
    mov dword ptr [esp + 16], ebx
L3:
    fild dword ptr [esp + 16]
    mov eax, dword ptr [esp + 16]
    shl eax, 7
    mov dword ptr [esp + 20], 0
    fstp dword ptr [esp + 36]
    mov dword ptr [esp + 24], eax
L4:
    fild dword ptr [esp + 20]
    xor ebp, ebp
    mov dword ptr [esp + 28], ebp
    fstp dword ptr [esp + 40]
    mov edi, edi
L5:
    mov eax, dword ptr [esp + 24]
    lea ebx, [eax + ebp]
    call sub_100F62A3
    mov dword ptr [esp + 32], eax
    fild dword ptr [esp + 32]
    fmul dword ptr [g_1019BE48]
    fadd dword ptr [esp + 36]
    fmul dword ptr [g_1019BDC8]
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 56]
    call sub_100F62CA
    mov dword ptr [esp + 32], eax
    fild dword ptr [esp + 32]
    fmul dword ptr [g_1019BE48]
    fadd dword ptr [esp + 40]
    fmul dword ptr [g_1019BDC8]
    fsub dword ptr [g_1019BC78]
    fstp dword ptr [esp + 60]
    call sub_100F62F1
    mov dword ptr [esp + 32], eax
    fild dword ptr [esp + 32]
    xor eax, eax
    fmul dword ptr [g_1019BE48]
    fiadd dword ptr [esp + 28]
    fmul dword ptr [g_1019BDAC]
    fsub dword ptr [g_1019BC78]
    lea ebx, [ebx]
L6:
    mov ecx, dword ptr [esp + 56]
    fst dword ptr [esi + 8]
    mov edx, dword ptr [esp + 60]
    mov dword ptr [esi], ecx
    mov ecx, dword ptr [esp + eax*8 + 68]
    mov dword ptr [esi + 4], edx
    mov edx, dword ptr [esp + eax*8 + 72]
    mov dword ptr [esi + 12], ecx
    mov dword ptr [esi + 16], edx
    add esi, 20
    inc eax
    cmp eax, 4
    jne L6
    fstp st(0)
    xor eax, eax
    lea ecx, [ebx*4]
L7:
    mov dx, word ptr [esp + eax*2 + 44]
    add dx, cx
    mov word ptr [edi], dx
    add edi, 2
    inc eax
    cmp eax, 6
    jne L7
    inc ebp
    cmp ebp, 16
    mov dword ptr [esp + 28], ebp
    jne L5
    mov eax, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 24]
    inc eax
    add edx, ebp
    cmp eax, 8
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 24], edx
    jne L4
    mov eax, dword ptr [esp + 16]
    inc eax
    cmp eax, 8
    mov dword ptr [esp + 16], eax
    jne L3
    mov esi, dword ptr [g_101D49AC]
    call sub_100052ED
    mov esi, dword ptr [g_101D49A8]
    call sub_10005238
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 84
    ret
FUN_10011bf0 ENDP
END
