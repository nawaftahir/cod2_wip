.686
.MODEL FLAT, C
EXTRN sub_1000142B:PROC
EXTRN sub_1000195C:PROC
EXTRN sub_1000199B:PROC
EXTRN sub_10002935:PROC
EXTRN sub_10002DF8:PROC
EXTRN sub_10002F20:PROC
EXTRN sub_10002F22:PROC
EXTRN sub_10002FD9:PROC
EXTRN sub_10002FDD:PROC
EXTRN sub_10002FE0:PROC
EXTRN sub_10003074:PROC
EXTRN sub_100030DD:PROC
EXTRN sub_1000310B:PROC
EXTRN sub_1000310C:PROC
EXTRN sub_10013907:PROC
EXTRN sub_10013934:PROC
EXTRN sub_10013A05:PROC
EXTRN sub_10013A21:PROC
EXTRN sub_10013A4A:PROC
EXTRN sub_1001738D:PROC
EXTRN sub_1005ED46:PROC
EXTRN sub_10061FE6:PROC
EXTRN EXTRN fp_101D49D4:DWORD:DWORD
EXTRN EXTRN g_101AE288:DWORD:DWORD
EXTRN EXTRN g_101AE298:DWORD:DWORD
EXTRN EXTRN g_101AE29C:DWORD:DWORD
EXTRN EXTRN g_101AE2A0:DWORD:DWORD
EXTRN EXTRN g_101AE2A4:DWORD:DWORD
EXTRN EXTRN g_101AE2A8:DWORD:DWORD
EXTRN EXTRN g_101AE2B0:DWORD:DWORD
EXTRN EXTRN g_101AE2B4:DWORD:DWORD
EXTRN EXTRN g_101AE2B8:DWORD:DWORD
.CODE
FUN_100029c0 PROC
    sub sub esp, 40
    push push ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 56]
    push push edi
    mov mov ebx, 16
    mov mov edx, 7
    mov mov eax, esi
    call sub_1000195C
    mov mov ecx, dword ptr [esi + 4]
    mov mov ebp, eax
    mov mov eax, dword ptr [esi]
    mov mov eax, dword ptr [eax + 68]
    add add eax, ecx
    test test ebp, ebp
    mov mov dword ptr [esp + 40], ebp
    mov mov dword ptr [esp + 28], eax
    jne L0
    mov mov ecx, dword ptr [g_101AE288]
    push push ecx
    push push 0101919A8h
    push push 1
    call sub_10013907
    add add esp, 12
    mov mov ebx, 68
    mov mov edx, 8
    mov mov eax, esi
    call sub_1000199B
    mov mov edi, eax
    test test edi, edi
    jne L2
    mov mov edx, dword ptr [g_101AE288]
    push push edx
    push push 01019198Ch
    push push 1
    call sub_10013934
    add add esp, 12
    mov mov eax, dword ptr [esi]
    mov mov ebx, dword ptr [eax + 76]
    mov mov eax, dword ptr [esi + 4]
    mov mov ecx, edi
    imul imul ecx, ecx, 68
    add add ebx, eax
    push push ecx
    mov mov dword ptr [esp + 36], ebx
    mov mov dword ptr [g_101AE2B0], edi
    call dword ptr [fp_101D49D4]
    mov mov edx, eax
    add add esp, 4
    test test edi, edi
    mov mov dword ptr [esp + 48], edx
    mov mov dword ptr [g_101AE2B4], edx
    jle L3
    lea lea ecx, [edx + 64]
    lea lea eax, [ebx + 52]
L1:
    sub sub edx, ebx
    mov mov ebx, dword ptr [eax - 52]
    mov mov dword ptr [ecx - 64], ebx
    mov mov ebx, dword ptr [eax - 48]
    mov mov dword ptr [ecx - 60], ebx
    mov mov ebx, dword ptr [eax - 44]
    mov mov dword ptr [ecx - 56], ebx
    mov mov ebx, dword ptr [eax - 28]
    mov mov dword ptr [ecx - 40], ebx
    mov mov ebx, dword ptr [eax - 24]
    mov mov dword ptr [ecx - 36], ebx
    mov mov ebx, dword ptr [eax - 20]
    mov mov dword ptr [ecx - 32], ebx
    mov mov ebx, dword ptr [eax - 16]
    mov mov dword ptr [ecx - 28], ebx
    mov mov ebx, dword ptr [eax - 12]
    mov mov dword ptr [ecx - 24], ebx
    mov mov ebx, dword ptr [eax - 8]
    mov mov dword ptr [ecx - 8], ebx
    mov mov ebx, dword ptr [eax - 4]
    mov mov dword ptr [ecx - 4], ebx
    mov mov ebx, dword ptr [eax]
    mov mov dword ptr [ecx], ebx
    mov mov ebx, dword ptr [eax + 4]
    mov mov dword ptr [ecx - 20], ebx
    mov mov ebx, dword ptr [eax + 8]
    mov mov dword ptr [ecx - 16], ebx
    mov mov ebx, dword ptr [eax + 12]
    mov mov dword ptr [edx + eax], ebx
    mov mov ebx, dword ptr [eax - 40]
    mov mov dword ptr [ecx - 52], ebx
    mov mov ebx, dword ptr [eax - 36]
    mov mov dword ptr [ecx - 48], ebx
    mov mov ebx, dword ptr [eax - 32]
    mov mov dword ptr [ecx - 44], ebx
    add add ecx, 68
    add add eax, 68
    dec dec edi
    jne L4
    mov mov edi, dword ptr [esi]
    mov mov edx, dword ptr [edi + 84]
    mov mov ecx, dword ptr [edi + 80]
    mov mov eax, dword ptr [esi + 8]
    add add edi, 80
    add add edx, ecx
    cmp cmp edx, eax
    jle L6
    mov mov eax, dword ptr [g_101AE288]
    push push eax
    push push 010191AC4h
    push push 1
    call sub_10013A05
    add add esp, 12
    cmp cmp dword ptr [edi + 4], 4
    jge L7
    mov mov ecx, dword ptr [g_101AE288]
    push push ecx
    push push 010191AA0h
    push push 1
    call sub_10013A21
    add add esp, 12
    mov mov edi, dword ptr [edi]
    test test edi, edi
    jl L8
    mov mov eax, edi
    cdq cdq
    sub sub eax, edx
    sar sar eax, 1
    shl shl eax, 1
    cmp cmp eax, edi
    je L10
    mov mov edx, dword ptr [g_101AE288]
    push push edx
    push push 010191A80h
    push push 1
    call sub_10013A4A
    add add esp, 12
    mov mov eax, dword ptr [esi]
    mov mov eax, dword ptr [eax + 84]
    add add eax, dword ptr [esi + 4]
    mov mov dword ptr [esp + 44], eax
    lea lea eax, [ebp + ebp*2]
    shl shl eax, 2
    push push eax
    mov mov dword ptr [g_101AE298], ebp
    call dword ptr [fp_101D49D4]
    mov mov dword ptr [g_101AE29C], eax
    add add esp, 4
    xor xor eax, eax
    test test ebp, ebp
    jle L11
    mov mov ecx, dword ptr [esp + 28]
    add add ecx, 10
    mov mov edx, ebp
    movsx movsx edi, word ptr [ecx]
    lea lea eax, [eax + edi*2 + 31]
    and and eax, -32
    add add ecx, 16
L4:
    dec dec edx
    jne L12
    push push eax
    call dword ptr [fp_101D49D4]
    lea lea ecx, [ebp + ebp*4]
    shl shl ecx, 3
    mov mov edi, eax
    push push ecx
    mov mov dword ptr [esp + 24], edi
    call dword ptr [fp_101D49D4]
    mov mov ebx, eax
    xor xor eax, eax
    add add esp, 8
    cmp cmp ebp, eax
    mov mov dword ptr [esp + 24], eax
    mov mov dword ptr [g_101AE2A0], eax
    mov mov dword ptr [esp + 20], eax
    jle sub_10002F20
    mov mov ebp, dword ptr [esp + 28]
    mov mov dword ptr [esp + 36], eax
    add add ebp, 8
    jmp sub_10002DF8
    mov mov esi, dword ptr [esp + 60]
    mov mov edi, dword ptr [esp + 16]
    mov mov edx, dword ptr [ebp - 4]
    mov mov dword ptr [ebx + 28], edx
    mov mov ax, word ptr [ebp]
    mov mov word ptr [ebx + 32], ax
    mov mov dword ptr [ebx], 6
    mov mov cx, word ptr [ebp + 2]
    movzx movzx edx, cx
    mov mov word ptr [ebx + 34], cx
    mov mov ecx, dword ptr [esp + 44]
    shl shl edx, 1
    mov mov dword ptr [ebx + 36], edi
    mov mov eax, dword ptr [ebp + 4]
L5:
    push push edx
    lea lea edx, [ecx + eax*2]
    push push edx
    push push edi
    call sub_1005ED46
    movsx movsx eax, word ptr [ebp - 6]
    mov mov ecx, dword ptr [esp + 44]
    lea lea eax, [eax + eax*4 + 5]
    lea lea edi, [esi + eax*4]
    mov mov esi, dword ptr [esp + 60]
    push push ecx
    mov mov ecx, ebx
    mov mov dword ptr [esp + 44], edi
    call sub_10002935
    movsx movsx eax, word ptr [ebp - 8]
    lea lea edx, [eax + eax*8]
    mov mov eax, dword ptr [esp + 76]
    mov mov ecx, dword ptr [eax + 12]
    lea lea eax, [ecx + edx*8]
    push push 9
    call sub_1001738D
    mov mov edx, dword ptr [g_101AE29C]
    mov mov esi, dword ptr [esp + 56]
    mov mov edi, dword ptr [esp + 40]
    mov mov dword ptr [esi + edx], eax
    mov mov dword ptr [esp + 72], eax
    mov mov eax, dword ptr [g_101AE29C]
    mov mov ecx, dword ptr [esi + eax]
    push push ecx
    call L1
    mov mov edx, dword ptr [g_101AE29C]
    mov mov ecx, dword ptr [esp + 52]
    mov mov edi, dword ptr [esp + 76]
    mov mov word ptr [esi + edx + 6], ax
    mov mov eax, dword ptr [g_101AE29C]
    mov mov dword ptr [esi + eax + 8], ebx
    mov mov dx, word ptr [ecx]
    mov mov eax, dword ptr [g_101AE29C]
    mov mov word ptr [esi + eax + 4], dx
    movzx movzx ecx, word ptr [ebx + 34]
    mov mov al, byte ptr [edi + 12]
    lea lea edx, [ecx + ecx + 31]
    mov mov ecx, dword ptr [esp + 40]
    and and edx, -32
    add add ecx, edx
    add add esp, 24
    test test al, 8
    mov mov dword ptr [esp + 16], ecx
    je sub_10002FE0
    mov mov eax, dword ptr [esp + 24]
    test test eax, eax
    je sub_10002FD9
    cmp cmp eax, edi
    je sub_10002FDD
L10:
    mov mov eax, dword ptr [eax]
    mov mov ecx, dword ptr [edi]
    push push eax
    push push ecx
    push push 010191938h
    push push 1
    call sub_10061FE6
    add add esp, 16
    mov mov eax, dword ptr [g_101AE2A0]
    inc inc eax
    mov mov dword ptr [esp + 24], edi
    mov mov dword ptr [g_101AE2A0], eax
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, dword ptr [esp + 40]
    inc inc eax
    add add esi, 12
    add add ebp, 16
    add add ebx, 40
    cmp cmp eax, ecx
    mov mov dword ptr [esp + 20], eax
    mov mov dword ptr [esp + 36], esi
    jl sub_10002F22
    mov mov eax, dword ptr [g_101AE2A0]
    test test eax, eax
    jne sub_10003074
    xor xor eax, eax
    mov mov dword ptr [g_101AE2A8], eax
    mov mov dword ptr [g_101AE2A4], eax
    jmp sub_100030DD
    mov mov ebx, dword ptr [esp + 24]
    call L9
    mov mov eax, dword ptr [g_101AE2A0]
    shl shl eax, 2
    push push eax
    call dword ptr [fp_101D49D4]
    xor xor ecx, ecx
    add add esp, 4
    mov mov dword ptr [g_101AE2A4], eax
    mov mov dword ptr [g_101AE2A0], ecx
    xor xor eax, eax
    jmp sub_100030DD
    lea lea ecx, [ecx]
    mov mov edx, dword ptr [g_101AE29C]
    cmp cmp dword ptr [ecx + edx], ebx
    jne sub_1000310B
    mov mov edx, dword ptr [g_101AE2A0]
    mov mov esi, dword ptr [g_101AE2A4]
    mov mov dword ptr [esi + edx*4], eax
    inc inc dword ptr [g_101AE2A0]
    mov mov edx, dword ptr [esp + 40]
    inc inc eax
    add add ecx, 12
    cmp cmp eax, edx
    jl sub_1000310C
    mov mov edx, 0101AE3D0h
    mov mov esi, 0101AE3C4h
    call L5
    mov mov eax, dword ptr [g_101AE2B4]
    push push eax
    mov mov eax, dword ptr [g_101AE2B0]
    call sub_1000142B
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ebp
    mov mov dword ptr [g_101AE2B8], eax
    pop pop ebx
FUN_100029c0 ENDP
END
