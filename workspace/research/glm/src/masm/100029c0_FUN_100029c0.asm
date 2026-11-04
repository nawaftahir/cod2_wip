.686
.MODEL FLAT, C
EXTRN sub_1000142B:PROC
EXTRN sub_1000195C:PROC
EXTRN sub_1000199B:PROC
EXTRN sub_10002935:PROC
EXTRN sub_10002A70:PROC
EXTRN sub_10002C0B:PROC
EXTRN sub_10002CAA:PROC
EXTRN sub_10013907:PROC
EXTRN sub_10013934:PROC
EXTRN sub_10013A05:PROC
EXTRN sub_10013A21:PROC
EXTRN sub_10013A4A:PROC
EXTRN sub_1001738D:PROC
EXTRN sub_1005ED46:PROC
EXTRN sub_10061FE6:PROC
EXTRN fp_101D49D4:DWORD
EXTRN g_101AE288:DWORD
EXTRN g_101AE298:DWORD
EXTRN g_101AE29C:DWORD
EXTRN g_101AE2A0:DWORD
EXTRN g_101AE2A4:DWORD
EXTRN g_101AE2A8:DWORD
EXTRN g_101AE2B0:DWORD
EXTRN g_101AE2B4:DWORD
EXTRN g_101AE2B8:DWORD
.CODE
FUN_100029c0 PROC
    sub esp, 40
    push ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 56]
    push edi
    mov ebx, 16
    mov edx, 7
    mov eax, esi
    call sub_1000195C
    mov ecx, dword ptr [esi + 4]
    mov ebp, eax
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax + 68]
    add eax, ecx
    test ebp, ebp
    mov dword ptr [esp + 40], ebp
    mov dword ptr [esp + 28], eax
    jne L0
    mov ecx, dword ptr [g_101AE288]
    push ecx
    push 0101919A8h
    push 1
    call sub_10013907
    add esp, 12
L0:
    mov ebx, 68
    mov edx, 8
    mov eax, esi
    call sub_1000199B
    mov edi, eax
    test edi, edi
    jne L1
    mov edx, dword ptr [g_101AE288]
    push edx
    push 01019198Ch
    push 1
    call sub_10013934
    add esp, 12
L1:
    mov eax, dword ptr [esi]
    mov ebx, dword ptr [eax + 76]
    mov eax, dword ptr [esi + 4]
    mov ecx, edi
    imul ecx, ecx, 68
    add ebx, eax
    push ecx
    mov dword ptr [esp + 36], ebx
    mov dword ptr [g_101AE2B0], edi
    call dword ptr [fp_101D49D4]
    mov edx, eax
    add esp, 4
    test edi, edi
    mov dword ptr [esp + 48], edx
    mov dword ptr [g_101AE2B4], edx
    jle L3
    lea ecx, [edx + 64]
    lea eax, [ebx + 52]
    sub edx, ebx
L2:
    mov ebx, dword ptr [eax - 52]
    mov dword ptr [ecx - 64], ebx
    mov ebx, dword ptr [eax - 48]
    mov dword ptr [ecx - 60], ebx
    mov ebx, dword ptr [eax - 44]
    mov dword ptr [ecx - 56], ebx
    mov ebx, dword ptr [eax - 28]
    mov dword ptr [ecx - 40], ebx
    mov ebx, dword ptr [eax - 24]
    mov dword ptr [ecx - 36], ebx
    mov ebx, dword ptr [eax - 20]
    mov dword ptr [ecx - 32], ebx
    mov ebx, dword ptr [eax - 16]
    mov dword ptr [ecx - 28], ebx
    mov ebx, dword ptr [eax - 12]
    mov dword ptr [ecx - 24], ebx
    mov ebx, dword ptr [eax - 8]
    mov dword ptr [ecx - 8], ebx
    mov ebx, dword ptr [eax - 4]
    mov dword ptr [ecx - 4], ebx
    mov ebx, dword ptr [eax]
    mov dword ptr [ecx], ebx
    mov ebx, dword ptr [eax + 4]
    mov dword ptr [ecx - 20], ebx
    mov ebx, dword ptr [eax + 8]
    mov dword ptr [ecx - 16], ebx
    mov ebx, dword ptr [eax + 12]
    mov dword ptr [edx + eax], ebx
    mov ebx, dword ptr [eax - 40]
    mov dword ptr [ecx - 52], ebx
    mov ebx, dword ptr [eax - 36]
    mov dword ptr [ecx - 48], ebx
    mov ebx, dword ptr [eax - 32]
    mov dword ptr [ecx - 44], ebx
    add ecx, 68
    add eax, 68
    dec edi
    jne L2
L3:
    mov edi, dword ptr [esi]
    mov edx, dword ptr [edi + 84]
    mov ecx, dword ptr [edi + 80]
    mov eax, dword ptr [esi + 8]
    add edi, 80
    add edx, ecx
    cmp edx, eax
    jle L4
    mov eax, dword ptr [g_101AE288]
    push eax
    push 010191AC4h
    push 1
    call sub_10013A05
    add esp, 12
L4:
    cmp dword ptr [edi + 4], 4
    jge L5
    mov ecx, dword ptr [g_101AE288]
    push ecx
    push 010191AA0h
    push 1
    call sub_10013A21
    add esp, 12
L5:
    mov edi, dword ptr [edi]
    test edi, edi
    jl L6
    mov eax, edi
    cdq
    sub eax, edx
    sar eax, 1
    shl eax, 1
    cmp eax, edi
    je L7
L6:
    mov edx, dword ptr [g_101AE288]
    push edx
    push 010191A80h
    push 1
    call sub_10013A4A
    add esp, 12
L7:
    mov eax, dword ptr [esi]
    mov eax, dword ptr [eax + 84]
    add eax, dword ptr [esi + 4]
    mov dword ptr [esp + 44], eax
    lea eax, [ebp + ebp*2]
    shl eax, 2
    push eax
    mov dword ptr [g_101AE298], ebp
    call dword ptr [fp_101D49D4]
    mov dword ptr [g_101AE29C], eax
    add esp, 4
    xor eax, eax
    test ebp, ebp
    jle L9
    mov ecx, dword ptr [esp + 28]
    add ecx, 10
    mov edx, ebp
L8:
    movsx edi, word ptr [ecx]
    lea eax, [eax + edi*2 + 31]
    and eax, 0FFFFFFE0h
    add ecx, 16
    dec edx
    jne L8
L9:
    push eax
    call dword ptr [fp_101D49D4]
    lea ecx, [ebp + ebp*4]
    shl ecx, 3
    mov edi, eax
    push ecx
    mov dword ptr [esp + 24], edi
    call dword ptr [fp_101D49D4]
    mov ebx, eax
    xor eax, eax
    add esp, 8
    cmp ebp, eax
    mov dword ptr [esp + 24], eax
    mov dword ptr [g_101AE2A0], eax
    mov dword ptr [esp + 20], eax
    jle L14
    mov ebp, dword ptr [esp + 28]
    mov dword ptr [esp + 36], eax
    add ebp, 8
    jmp L11
L10:
    mov esi, dword ptr [esp + 60]
    mov edi, dword ptr [esp + 16]
L11:
    mov edx, dword ptr [ebp - 4]
    mov dword ptr [ebx + 28], edx
    mov ax, word ptr [ebp]
    mov word ptr [ebx + 32], ax
    mov dword ptr [ebx], 6
    mov cx, word ptr [ebp + 2]
    movzx edx, cx
    mov word ptr [ebx + 34], cx
    mov ecx, dword ptr [esp + 44]
    shl edx, 1
    mov dword ptr [ebx + 36], edi
    mov eax, dword ptr [ebp + 4]
    push edx
    lea edx, [ecx + eax*2]
    push edx
    push edi
    call sub_1005ED46
    movsx eax, word ptr [ebp - 6]
    mov ecx, dword ptr [esp + 44]
    lea eax, [eax + eax*4 + 5]
    lea edi, [esi + eax*4]
    mov esi, dword ptr [esp + 60]
    push ecx
    mov ecx, ebx
    mov dword ptr [esp + 44], edi
    call sub_10002935
    movsx eax, word ptr [ebp - 8]
    lea edx, [eax + eax*8]
    mov eax, dword ptr [esp + 76]
    mov ecx, dword ptr [eax + 12]
    lea eax, [ecx + edx*8]
    push 9
    call sub_1001738D
    mov edx, dword ptr [g_101AE29C]
    mov esi, dword ptr [esp + 56]
    mov edi, dword ptr [esp + 40]
    mov dword ptr [esi + edx], eax
    mov dword ptr [esp + 72], eax
    mov eax, dword ptr [g_101AE29C]
    mov ecx, dword ptr [esi + eax]
    push ecx
    call sub_10002A70
    mov edx, dword ptr [g_101AE29C]
    mov ecx, dword ptr [esp + 52]
    mov edi, dword ptr [esp + 76]
    mov word ptr [esi + edx + 6], ax
    mov eax, dword ptr [g_101AE29C]
    mov dword ptr [esi + eax + 8], ebx
    mov dx, word ptr [ecx]
    mov eax, dword ptr [g_101AE29C]
    mov word ptr [esi + eax + 4], dx
    movzx ecx, word ptr [ebx + 34]
    mov al, byte ptr [edi + 12]
    lea edx, [ecx + ecx + 31]
    mov ecx, dword ptr [esp + 40]
    and edx, 0FFFFFFE0h
    add ecx, edx
    add esp, 24
    test al, 8
    mov dword ptr [esp + 16], ecx
    je L13
    mov eax, dword ptr [esp + 24]
    test eax, eax
    je L12
    cmp eax, edi
    je L12
    mov eax, dword ptr [eax]
    mov ecx, dword ptr [edi]
    push eax
    push ecx
    push 010191938h
    push 1
    call sub_10061FE6
    add esp, 16
L12:
    mov eax, dword ptr [g_101AE2A0]
    inc eax
    mov dword ptr [esp + 24], edi
    mov dword ptr [g_101AE2A0], eax
L13:
    mov eax, dword ptr [esp + 20]
    mov ecx, dword ptr [esp + 40]
    inc eax
    add esi, 12
    add ebp, 16
    add ebx, 40
    cmp eax, ecx
    mov dword ptr [esp + 20], eax
    mov dword ptr [esp + 36], esi
    jl L10
    mov eax, dword ptr [g_101AE2A0]
    test eax, eax
    jne L15
    xor eax, eax
L14:
    mov dword ptr [g_101AE2A8], eax
    mov dword ptr [g_101AE2A4], eax
    jmp L18
L15:
    mov ebx, dword ptr [esp + 24]
    call sub_10002CAA
    mov eax, dword ptr [g_101AE2A0]
    shl eax, 2
    push eax
    call dword ptr [fp_101D49D4]
    xor ecx, ecx
    add esp, 4
    mov dword ptr [g_101AE2A4], eax
    mov dword ptr [g_101AE2A0], ecx
    xor eax, eax
    jmp L16
    lea ecx, [ecx]
L16:
    mov edx, dword ptr [g_101AE29C]
    cmp dword ptr [ecx + edx], ebx
    jne L17
    mov edx, dword ptr [g_101AE2A0]
    mov esi, dword ptr [g_101AE2A4]
    mov dword ptr [esi + edx*4], eax
    inc dword ptr [g_101AE2A0]
L17:
    mov edx, dword ptr [esp + 40]
    inc eax
    add ecx, 12
    cmp eax, edx
    jl L16
L18:
    mov edx, 0101AE3D0h
    mov esi, 0101AE3C4h
    call sub_10002C0B
    mov eax, dword ptr [g_101AE2B4]
    push eax
    mov eax, dword ptr [g_101AE2B0]
    call sub_1000142B
    add esp, 4
    pop edi
    pop esi
    pop ebp
    mov dword ptr [g_101AE2B8], eax
    pop ebx
FUN_100029c0 ENDP
END
