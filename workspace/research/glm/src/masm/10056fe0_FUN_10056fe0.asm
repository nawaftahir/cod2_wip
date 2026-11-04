.686
.MODEL FLAT, C
.CODE
FUN_10056fe0 PROC
    sub esp, 00000021Ch
    push edi
    mov eax, 07FFFFFFFh
    mov ecx, 000000080h
    lea edi, [esp + 32]
    rep stosd dword ptr es:[edi], eax
    mov ecx, dword ptr [esp + 000000234h]
    xor eax, eax
    test ecx, ecx
    mov dword ptr [esp + 16], eax
    jle L8
    push ebx
    push ebp
    push esi
    nop
L0:
    mov ecx, dword ptr [esp + 000000244h]
    movzx ebx, byte ptr [eax + ecx]
    mov edx, dword ptr [esp + 000000230h]
    mov esi, dword ptr [edx + 124]
    mov eax, dword ptr [esi]
    movzx edx, byte ptr [ebx + eax]
    mov eax, dword ptr [esi + 4]
    mov ecx, dword ptr [esp + 000000234h]
    sub ecx, edx
    movzx edx, byte ptr [eax + ebx]
    mov eax, dword ptr [esp + 000000238h]
    sub eax, edx
    lea edx, [eax + eax*2]
    mov eax, dword ptr [esi + 8]
    movzx esi, byte ptr [eax + ebx]
    mov eax, dword ptr [esp + 00000023Ch]
    sub eax, esi
    shl eax, 1
    mov esi, edx
    imul esi, edx
    mov edi, eax
    imul edi, eax
    add edi, esi
    mov esi, ecx
    imul esi, ecx
    lea ebp, [edx + edx*2 + 18]
    lea edx, [eax + 8]
    add edi, esi
    mov esi, dword ptr [esp + 000000248h]
    shl ebp, 3
    add ecx, 4
    shl edx, 5
    shl ecx, 4
    mov dword ptr [esp + 40], ebp
    lea eax, [esp + 44]
    mov dword ptr [esp + 16], ecx
    mov dword ptr [esp + 20], 4
    jmp L2
L1:
    mov ebp, dword ptr [esp + 40]
L2:
    mov ecx, edi
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 24], ebp
    mov dword ptr [esp + 36], 8
L3:
    cmp ecx, dword ptr [eax]
    jge L4
    mov dword ptr [eax], ecx
    mov byte ptr [esi], bl
L4:
    mov ebp, dword ptr [eax + 4]
    add eax, 4
    add ecx, edx
    inc esi
    cmp ecx, ebp
    jge L5
    mov dword ptr [eax], ecx
    mov byte ptr [esi], bl
L5:
    lea ebp, [edx + 000000200h]
    add eax, 4
    add ecx, ebp
    mov ebp, dword ptr [eax]
    inc esi
    cmp ecx, ebp
    jge L6
    mov dword ptr [eax], ecx
    mov byte ptr [esi], bl
L6:
    lea ebp, [edx + 000000400h]
    add eax, 4
    add ecx, ebp
    mov ebp, dword ptr [eax]
    inc esi
    cmp ecx, ebp
    jge L7
    mov dword ptr [eax], ecx
    mov byte ptr [esi], bl
L7:
    mov ebp, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 32]
    add ecx, ebp
    add ebp, 000000120h
    mov dword ptr [esp + 24], ebp
    mov ebp, dword ptr [esp + 36]
    add eax, 4
    inc esi
    dec ebp
    mov dword ptr [esp + 32], ecx
    mov dword ptr [esp + 36], ebp
    jne L3
    mov ecx, dword ptr [esp + 16]
    add edi, ecx
    add ecx, 000000080h
    mov dword ptr [esp + 16], ecx
    dec dword ptr [esp + 20]
    jne L1
    mov eax, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 000000240h]
    inc eax
    cmp eax, ecx
    mov dword ptr [esp + 28], eax
    jl L0
    pop esi
    pop ebp
    pop ebx
L8:
    pop edi
    add esp, 00000021Ch
    ret
FUN_10056fe0 ENDP
END
