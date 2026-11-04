.686
.MODEL FLAT, C
EXTRN sub_100F6D72:PROC
EXTRN sub_100F6E2E:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_100165c0 PROC
    sub esp, 000000810h
    mov eax, dword ptr [esp + 000000818h]
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 00000081Ch]
    xor ebx, ebx
    push esi
    push edi
    xor edi, edi
    cmp eax, ebx
    mov dword ptr [esp + 24], ebx
    mov word ptr [esp + 16], 0000000FFh
    mov word ptr [esp + 18], bx
    mov byte ptr [esp + 20], 17
    mov byte ptr [esp + 21], bl
    mov byte ptr [esp + 22], bl
    mov byte ptr [esp + 23], bl
    je L3
    lea edx, [esp + 32]
    sub edx, 8
    mov dword ptr [esp + 28], edx
L0:
    movzx eax, byte ptr [ebp]
    mov ecx, dword ptr [esp + 00000082Ch]
    lea ecx, [ecx + eax*2]
    add ecx, eax
    cmp byte ptr [ecx], 0000000FFh
    je L6
    cmp edi, ebx
    movzx esi, byte ptr [ebp + 1]
    lea esi, [esi*2 + 01018EB1Ch]
    mov eax, edi
    jle L2
    lea ebx, [ebx]
L1:
    movzx bx, byte ptr [ecx]
    cmp word ptr [edx], bx
    jbe L2
    mov ebx, dword ptr [edx]
    mov dword ptr [edx + 8], ebx
    mov ebx, dword ptr [edx + 4]
    mov dword ptr [edx + 12], ebx
    dec eax
    sub edx, 8
    test eax, eax
    jg L1
L2:
    movzx dx, byte ptr [ecx]
    mov word ptr [esp + eax*8 + 32], dx
    movzx dx, byte ptr [ecx + 1]
    mov word ptr [esp + eax*8 + 34], dx
    mov cl, byte ptr [ecx + 2]
    mov dl, byte ptr [esi]
    mov byte ptr [esp + eax*8 + 36], cl
    mov cl, byte ptr [esi + 1]
    xor ebx, ebx
    mov byte ptr [esp + eax*8 + 38], dl
    mov edx, dword ptr [esp + 28]
    mov byte ptr [esp + eax*8 + 37], bl
    mov byte ptr [esp + eax*8 + 39], cl
    mov eax, dword ptr [esp + 000000828h]
    add edx, 8
    inc edi
    add ebp, 2
    dec eax
    mov dword ptr [esp + 28], edx
    mov dword ptr [esp + 000000828h], eax
    jne L0
L3:
    mov edx, dword ptr [esp + 16]
    mov eax, dword ptr [esp + 20]
    mov dword ptr [esp + edi*8 + 32], edx
    mov dword ptr [esp + edi*8 + 36], eax
    lea ecx, [ecx]
L4:
    mov ecx, dword ptr [g_101CE7EC]
    cmp dword ptr [ecx + 8], ebx
    je L5
    mov eax, dword ptr [g_10764584]
    cmp eax, ebx
    setne cl
    cmp cl, bl
    je L5
    push 0101944D0h
    push 010193358h
    push eax
    call sub_100F6E2E
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6D72
    add esp, 16
L5:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    lea edx, [esp + 24]
    push edx
    lea edx, [esp + 36]
    push edx
    push eax
    call dword ptr [ecx + 0x158]
    cmp dword ptr [g_1076A830], ebx
    jne L4
    mov eax, dword ptr [esp + 24]
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 000000810h
    ret
L6:
    pop edi
    pop esi
    pop ebp
    xor eax, eax
    pop ebx
    add esp, 000000810h
    ret
FUN_100165c0 ENDP
END
