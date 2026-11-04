.686
.MODEL FLAT, C
EXTRN g_1019BD54:DWORD
.CODE
FUN_1000c0f0 PROC
    mov ecx, dword ptr [esp + 8]
    mov edx, dword ptr [ecx]
    sub esp, 12
    cmp edx, 0000003FFh
    jle L0
    mov dword ptr [ecx], 0000003FFh
L0:
    mov edx, dword ptr [esp + 24]
    push ebp
    push esi
    mov byte ptr [ebx], 0
    push edi
    xor edi, edi
    mov byte ptr [edx], 0
    mov edx, dword ptr [ecx]
    xor esi, esi
    or ebp, 0FFFFFFFFh
    cmp edx, edi
    mov dword ptr [esp + 16], 7
    mov dword ptr [esp + 12], edi
    jle L11
L1:
    mov ecx, dword ptr [esp + 28]
    mov dx, word ptr [ecx + edi*2]
    movzx ecx, dx
    shr ecx, 8
    cmp ecx, dword ptr [esp + 16]
    je L5
    cmp ecx, 13
    je L9
    cmp ecx, 16
    je L9
    cmp ecx, 17
    je L9
    cmp ecx, 18
    je L9
    cmp ecx, 10
    jne L2
    test eax, eax
    je L8
    and edx, 0000000FFh
    mov dword ptr [esp + 20], edx
    fild dword ptr [esp + 20]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [eax]
    jmp L8
L2:
    cmp ecx, 11
    jne L3
    test eax, eax
    je L8
    and edx, 0000000FFh
    mov dword ptr [esp + 20], edx
    fild dword ptr [esp + 20]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [eax + 4]
    jmp L8
L3:
    cmp ecx, 12
    jne L4
    test eax, eax
    je L8
    and edx, 0000000FFh
    mov dword ptr [esp + 20], edx
    fild dword ptr [esp + 20]
    fmul dword ptr [g_1019BD54]
    fstp dword ptr [eax + 8]
    jmp L8
L4:
    mov byte ptr [esi + ebx], 94
    mov dword ptr [esp + 16], ecx
    inc esi
    add cl, 48
    mov byte ptr [esi + ebx], cl
    inc esi
L5:
    mov edx, dword ptr [esp + 28]
    mov cl, byte ptr [edx + edi*2]
    cmp cl, 32
    mov byte ptr [esi + ebx], cl
    jne L6
    cmp ebp, -1
    jne L7
    mov ebp, esi
    jmp L7
L6:
    or ebp, 0FFFFFFFFh
L7:
    inc esi
L8:
    mov ecx, dword ptr [esp + 32]
    mov edx, dword ptr [ecx]
    inc edi
    cmp edi, edx
    jl L1
    jmp L10
L9:
    mov edx, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 36]
    lea eax, [edx + edi*2]
    mov dword ptr [esp + 12], eax
    or ebp, 0FFFFFFFFh
    mov byte ptr [ecx], 1
L10:
    mov ecx, dword ptr [esp + 32]
L11:
    test ebp, ebp
    mov byte ptr [esi + ebx], 0
    jl L12
    mov byte ptr [ebx + ebp], 0
L12:
    mov eax, dword ptr [ecx]
    sub eax, edi
    pop edi
    pop esi
    mov dword ptr [ecx], eax
    mov eax, dword ptr [esp + 4]
    pop ebp
    add esp, 12
    ret
FUN_1000c0f0 ENDP
END
