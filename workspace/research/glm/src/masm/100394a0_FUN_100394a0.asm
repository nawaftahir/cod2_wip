.686
.MODEL FLAT, C
EXTRN sub_10038AA7:PROC
EXTRN sub_10038D1E:PROC
EXTRN sub_10038D74:PROC
EXTRN sub_100392B4:PROC
EXTRN sub_10039313:PROC
EXTRN sub_10039362:PROC
EXTRN sub_1003DA80:PROC
EXTRN g_1072D9BC:DWORD
.CODE
FUN_100394a0 PROC
    sub esp, 24
    test eax, eax
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 36]
    push esi
    push edi
    jle L8
    mov dword ptr [esp + 36], eax
    jmp L0
    lea esp, [esp]
L0:
    movzx eax, word ptr [ebp]
    cmp eax, 4
    ja L7
    jmp dword ptr [eax*4 + 0x100395f0]
    mov eax, dword ptr [ebp + 4]
    movzx ecx, word ptr [ebp + 2]
    push 1
    push eax
    push ecx
    call sub_100392B4
    add esp, 12
    jmp L7
    mov ax, word ptr [ebp + 4]
    cmp ax, 0000000BBh
    movzx eax, ax
    jae L1
    movzx edx, byte ptr [ebp + 7]
    sub eax, 000000080h
    shl eax, 4
    add eax, 01072DA00h
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 20], edx
    jmp L2
L1:
    movzx ecx, byte ptr [ebp + 7]
    movzx edx, byte ptr [ebp + 6]
    push ecx
    push edx
    push eax
    call sub_10038D74
    movzx ecx, byte ptr [ebp + 7]
    add esp, 12
    mov dword ptr [esp + 24], eax
    mov dword ptr [esp + 20], ecx
L2:
    mov edx, dword ptr [esp + 20]
    push edx
    push eax
    movzx eax, word ptr [ebp + 2]
    push eax
    call sub_10039313
    add esp, 12
    jmp L7
    mov ecx, dword ptr [g_1072D9BC]
    movzx edx, word ptr [ecx + 54]
    mov esi, dword ptr [ebp + 4]
    xor eax, eax
    test edx, edx
    jle L5
    mov ecx, dword ptr [ecx + 64]
L3:
    cmp esi, dword ptr [ecx]
    je L4
    inc eax
    add ecx, 20
    cmp eax, edx
    jl L3
    jmp L5
L4:
    add ecx, 4
    mov dword ptr [esp + 24], ecx
    mov dword ptr [esp + 20], 1
L5:
    mov ecx, dword ptr [esp + 20]
    mov edx, dword ptr [esp + 24]
    movzx eax, word ptr [ebp + 2]
    push ecx
    push edx
    push eax
    call sub_10039362
    add esp, 12
    jmp L7
    mov ebx, dword ptr [ebp + 4]
    lea edi, [esp + 28]
    lea esi, [esp + 32]
    call sub_10038AA7
    mov ecx, dword ptr [esp + 28]
    push ecx
    jmp L6
    mov ebx, dword ptr [ebp + 4]
    lea eax, [esp + 28]
    lea edx, [esp + 32]
    call sub_10038D1E
    mov edx, dword ptr [esp + 28]
    push edx
L6:
    movzx edi, word ptr [ebp + 2]
    mov eax, dword ptr [esp + 36]
    call sub_1003DA80
    add esp, 4
L7:
    mov eax, dword ptr [esp + 36]
    add ebp, 8
    dec eax
    mov dword ptr [esp + 36], eax
    jne L0
L8:
    pop edi
FUN_100394a0 ENDP
END
