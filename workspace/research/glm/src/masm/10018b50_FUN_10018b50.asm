.686
.MODEL FLAT, C
EXTRN g_101D496C:DWORD
EXTRN g_101D496D:DWORD
.CODE
FUN_10018b50 PROC
    mov al, byte ptr [g_101D496D]
    push ebx
    xor ebx, ebx
    cmp al, bl
    push esi
    jne L0
    mov esi, dword ptr [edi + 28]
    mov eax, dword ptr [edi + 20]
    or esi, 007FF0000h
    and eax, 0F812FFFFh
    mov dword ptr [edi + 28], esi
    or eax, 000120000h
    pop esi
    mov dword ptr [edi + 4], ebx
    mov dword ptr [edi + 8], ebx
    mov dword ptr [edi + 12], ebx
    mov dword ptr [edi + 16], ebx
    mov dword ptr [edi], 1
    mov dword ptr [edi + 20], eax
    pop ebx
    ret
L0:
    cmp byte ptr [g_101D496C], bl
    jne L4
    mov eax, dword ptr [edi]
    push ebp
    xor ebp, ebp
    cmp eax, ebx
    jle L3
    lea edx, [edi + 20]
L1:
    mov esi, dword ptr [edx + 8]
    test esi, 007000000h
    je L2
    mov eax, dword ptr [edx]
    mov ecx, eax
    sar ecx, 24
    and ecx, 7
    cmp ecx, 1
    je L2
    cmp ecx, ebx
    je L2
    or esi, 007FF0000h
    and eax, 0F911FFFFh
    or eax, 001110000h
    mov dword ptr [edx + 8], esi
    mov dword ptr [edx], eax
L2:
    mov eax, dword ptr [edi]
    inc ebp
    add edx, 32
    cmp ebp, eax
    jl L1
L3:
    pop ebp
L4:
    pop esi
    pop ebx
    ret
FUN_10018b50 ENDP
END
