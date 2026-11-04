.686
.MODEL FLAT, C
EXTRN sub_10016790:PROC
EXTRN sub_10016803:PROC
EXTRN sub_10016811:PROC
EXTRN sub_10016818:PROC
EXTRN sub_100F6D72:PROC
EXTRN sub_100F6E2E:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_100165c0 PROC
    sub sub esp, 0810h
    mov mov eax, dword ptr [esp + 0818h]
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 081Ch]
    xor xor ebx, ebx
    push push esi
    push push edi
    xor xor edi, edi
    cmp cmp eax, ebx
    mov mov dword ptr [esp + 24], ebx
    mov mov word ptr [esp + 16], 0FFh
    mov mov word ptr [esp + 18], bx
    mov mov byte ptr [esp + 20], 17
    mov mov byte ptr [esp + 21], bl
    mov mov byte ptr [esp + 22], bl
    mov mov byte ptr [esp + 23], bl
    je L3
    lea lea edx, [esp + 32]
    sub sub edx, 8
    mov mov dword ptr [esp + 28], edx
    movzx movzx eax, byte ptr [ebp]
    mov mov ecx, dword ptr [esp + 082Ch]
    lea lea ecx, [ecx + eax*2]
    add add ecx, eax
    cmp cmp byte ptr [ecx], 0FFh
    je sub_10016790
    cmp cmp edi, ebx
    movzx movzx esi, byte ptr [ebp + 1]
    lea lea esi, [esi*2 + 01018EB1Ch]
    mov mov eax, edi
    jle L0
    lea lea ebx, [ebx]
    movzx movzx bx, byte ptr [ecx]
    cmp cmp word ptr [edx], bx
    jbe L2
    mov mov ebx, dword ptr [edx]
    mov mov dword ptr [edx + 8], ebx
    mov mov ebx, dword ptr [edx + 4]
    mov mov dword ptr [edx + 12], ebx
    dec dec eax
    sub sub edx, 8
    test test eax, eax
    jg L1
    movzx movzx dx, byte ptr [ecx]
    mov mov word ptr [esp + eax*8 + 32], dx
    movzx movzx dx, byte ptr [ecx + 1]
    mov mov word ptr [esp + eax*8 + 34], dx
    mov mov cl, byte ptr [ecx + 2]
    mov mov dl, byte ptr [esi]
    mov mov byte ptr [esp + eax*8 + 36], cl
    mov mov cl, byte ptr [esi + 1]
    xor xor ebx, ebx
    mov mov byte ptr [esp + eax*8 + 38], dl
    mov mov edx, dword ptr [esp + 28]
    mov mov byte ptr [esp + eax*8 + 37], bl
    mov mov byte ptr [esp + eax*8 + 39], cl
    mov mov eax, dword ptr [esp + 0828h]
    add add edx, 8
    inc inc edi
    add add ebp, 2
    dec dec eax
    mov mov dword ptr [esp + 28], edx
    mov mov dword ptr [esp + 0828h], eax
    jne L4
    mov mov edx, dword ptr [esp + 16]
    mov mov eax, dword ptr [esp + 20]
    mov mov dword ptr [esp + edi*8 + 32], edx
    mov mov dword ptr [esp + edi*8 + 36], eax
    lea lea ecx, [ecx]
    mov mov ecx, dword ptr [g_101CE7EC]
    cmp cmp dword ptr [ecx + 8], ebx
    je sub_10016803
    mov mov eax, dword ptr [g_10764584]
    cmp cmp eax, ebx
    setne setne cl
    cmp cmp cl, bl
    je sub_10016811
    push push 0101944D0h
    push push 010193358h
    push push eax
    call sub_100F6E2E
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6D72
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
L4:
    mov mov ecx, dword ptr [eax]
    lea lea edx, [esp + 24]
    push push edx
    lea lea edx, [esp + 36]
    push push edx
    push push eax
    call call dword ptr [ecx + 0158h]
    cmp cmp dword ptr [g_1076A830], ebx
    jne sub_10016818
    mov mov eax, dword ptr [esp + 24]
    pop pop edi
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 0810h
    ret ret
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor eax, eax
    pop pop ebx
    add add esp, 0810h
    ret ret
FUN_100165c0 ENDP
END
