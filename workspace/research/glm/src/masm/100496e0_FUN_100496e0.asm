.686
.MODEL FLAT, C
EXTRN sub_10046E50:PROC
EXTRN sub_1004721A:PROC
.CODE
FUN_100496e0 PROC
    sub esp, 12
    push ebp
    mov ebp, dword ptr [esp + 24]
    cmp dword ptr [ebp + 20], 100
    push edi
    je L0
    mov eax, dword ptr [ebp]
    mov dword ptr [eax + 20], 20
    mov ecx, dword ptr [ebp]
    mov edx, dword ptr [ebp + 20]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [ebp]
    push ebp
    call dword ptr [eax]
    add esp, 4
L0:
    mov edi, dword ptr [esp + 24]
    mov ecx, dword ptr [edi + 36]
    mov dword ptr [ebp + 36], ecx
    mov edx, dword ptr [edi + 40]
    mov dword ptr [ebp + 40], edx
    mov eax, dword ptr [edi + 44]
    mov dword ptr [ebp + 44], eax
    mov ecx, dword ptr [edi + 48]
    push ebx
    push esi
    mov eax, ebp
    mov dword ptr [ebp + 48], ecx
    call sub_10046E50
    mov eax, dword ptr [edi + 48]
    mov ecx, ebp
    call sub_1004721A
    mov edx, dword ptr [edi + 0000000C8h]
    mov dword ptr [ebp + 64], edx
    mov al, byte ptr [edi + 000000112h]
    lea esi, [edi + 000000098h]
    mov byte ptr [ebp + 0000000BBh], al
    mov dword ptr [esp + 36], esi
    lea ebx, [ebp + 80]
    mov dword ptr [esp + 16], 4
L1:
    cmp dword ptr [esi], 0
    je L3
    cmp dword ptr [ebx], 0
    jne L2
    mov ecx, dword ptr [ebp + 4]
    push 000000082h
    push 0
    push ebp
    call dword ptr [ecx]
    mov byte ptr [eax + 000000080h], 0
    add esp, 12
    mov dword ptr [ebx], eax
L2:
    mov esi, dword ptr [esi]
    mov edi, dword ptr [ebx]
    mov ecx, 32
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov edx, dword ptr [ebx]
    mov edi, dword ptr [esp + 32]
    mov esi, dword ptr [esp + 36]
    mov byte ptr [edx + 000000080h], 0
L3:
    mov eax, dword ptr [esp + 16]
    add esi, 4
    add ebx, 4
    dec eax
    mov dword ptr [esp + 36], esi
    mov dword ptr [esp + 16], eax
    jne L1
    mov eax, dword ptr [edi + 44]
    cmp eax, 1
    mov dword ptr [ebp + 68], eax
    jl L4
    cmp eax, 10
    jle L5
L4:
    mov eax, dword ptr [ebp]
    mov dword ptr [eax + 20], 26
    mov ecx, dword ptr [ebp]
    mov edx, dword ptr [ebp + 68]
    mov dword ptr [ecx + 24], edx
    mov eax, dword ptr [ebp]
    mov dword ptr [eax + 28], 10
    mov ecx, dword ptr [ebp]
    push ebp
    call dword ptr [ecx]
    add esp, 4
L5:
    mov eax, dword ptr [ebp + 68]
    test eax, eax
    mov ebx, dword ptr [edi + 0000000CCh]
    mov edx, dword ptr [ebp + 76]
    mov dword ptr [esp + 16], 0
    mov dword ptr [esp + 20], ebx
    mov dword ptr [esp + 32], edx
    jle L12
L6:
    mov eax, dword ptr [ebx]
    mov dword ptr [edx], eax
    mov ecx, dword ptr [ebx + 8]
    mov dword ptr [edx + 8], ecx
    mov eax, dword ptr [ebx + 12]
    mov dword ptr [edx + 12], eax
    mov esi, dword ptr [ebx + 16]
    test esi, esi
    mov dword ptr [edx + 16], esi
    jl L7
    cmp esi, 4
    jge L7
    mov eax, dword ptr [edi + esi*4 + 000000098h]
    test eax, eax
    jne L8
L7:
    mov ecx, dword ptr [ebp]
    mov dword ptr [ecx + 20], 52
    mov edx, dword ptr [ebp]
    mov dword ptr [edx + 24], esi
    mov eax, dword ptr [ebp]
    push ebp
    call dword ptr [eax]
    mov edx, dword ptr [esp + 36]
    add esp, 4
L8:
    mov ecx, dword ptr [ebx + 76]
    test ecx, ecx
    mov eax, dword ptr [edi + esi*4 + 000000098h]
    je L11
    sub ecx, eax
    mov ebx, eax
    mov dword ptr [esp + 24], ecx
    mov dword ptr [esp + 36], 64
L9:
    mov dx, word ptr [ecx + ebx]
    cmp dx, word ptr [ebx]
    je L10
    mov eax, dword ptr [ebp]
    mov dword ptr [eax + 20], 44
    mov ecx, dword ptr [ebp]
    mov dword ptr [ecx + 24], esi
    mov edx, dword ptr [ebp]
    push ebp
    call dword ptr [edx]
    mov ecx, dword ptr [esp + 28]
    add esp, 4
L10:
    mov eax, dword ptr [esp + 36]
    add ebx, 2
    dec eax
    mov dword ptr [esp + 36], eax
    jne L9
    mov ebx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 32]
L11:
    mov eax, dword ptr [esp + 16]
    mov ecx, dword ptr [ebp + 68]
    inc eax
    add ebx, 84
    add edx, 84
    cmp eax, ecx
    mov dword ptr [esp + 16], eax
    mov dword ptr [esp + 20], ebx
    mov dword ptr [esp + 32], edx
    jl L6
L12:
    mov al, byte ptr [edi + 000000108h]
    test al, al
    pop esi
    pop ebx
    je L14
    cmp byte ptr [edi + 000000109h], 1
    jne L13
    mov byte ptr [ebp + 0000000CDh], 1
    mov al, byte ptr [edi + 00000010Ah]
    mov byte ptr [ebp + 0000000CEh], al
L13:
    mov cl, byte ptr [edi + 00000010Bh]
    mov byte ptr [ebp + 0000000CFh], cl
    mov dx, word ptr [edi + 00000010Ch]
    mov word ptr [ebp + 0000000D0h], dx
    mov ax, word ptr [edi + 00000010Eh]
    mov word ptr [ebp + 0000000D2h], ax
L14:
    pop edi
    pop ebp
    add esp, 12
    ret
FUN_100496e0 ENDP
END
