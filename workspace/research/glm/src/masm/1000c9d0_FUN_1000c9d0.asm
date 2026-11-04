.686
.MODEL FLAT, C
EXTRN sub_1000F08A:PROC
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
.CODE
FUN_1000c9d0 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov ebx, eax
    xor esi, esi
    lea esp, [esp]
L0:
    mov eax, esi
    dec eax
    mov eax, dword ptr [g_101D4C6C]
    jne L1
    mov eax, 000000280h
L1:
    mov edx, dword ptr [g_101D4C70]
    mov ecx, esi
    dec ecx
    jne L2
    mov edx, 0000001E0h
L2:
    mov ecx, dword ptr [esp + 24]
    sar eax, cl
    mov edi, 1
    sub edi, eax
    mov edi, 1
    jns L3
    mov edi, eax
L3:
    sar edx, cl
    mov ecx, 1
    mov eax, edx
    sub ecx, eax
    js L4
    mov eax, 1
L4:
    movzx edx, di
    push edx
    movzx eax, ax
    push 3
    mov edx, 1
    call sub_1000F08A
    add dword ptr [ebp + esi*4 + 16], eax
    movzx ecx, byte ptr [ebp + 12]
    add esp, 8
    test ecx, ecx
    jl L5
    cmp ecx, 1
    jle L6
    cmp ecx, 4
    je L6
L5:
    add dword ptr [esi*4 + 0101D0A74h], eax
L6:
    inc esi
    cmp esi, 2
    jl L0
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
FUN_1000c9d0 ENDP
END
