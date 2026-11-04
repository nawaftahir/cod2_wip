.686
.MODEL FLAT, C
EXTRN sub_100FD213:PROC
EXTRN sub_100FD23B:PROC
EXTRN sub_10100EBE:PROC
EXTRN sub_10100ED7:PROC
EXTRN sub_10106F11:PROC
EXTRN sub_10106F25:PROC
EXTRN sub_10106F34:PROC
EXTRN sub_10106F41:PROC
EXTRN sub_10106F43:PROC
EXTRN sub_10106F94:PROC
EXTRN sub_10106F99:PROC
EXTRN sub_10106FB1:PROC
EXTRN sub_10106FB3:PROC
EXTRN sub_10106FBD:PROC
EXTRN sub_10106FCA:PROC
EXTRN sub_10106FCC:PROC
EXTRN sub_10106FCF:PROC
EXTRN EXTRN fp_1010C188:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_1076AA30:DWORD:DWORD
EXTRN EXTRN g_1076AB44:DWORD:DWORD
.CODE
setSBUpLow PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 0518h
    mov mov eax, dword ptr [g_101A50D0]
    mov mov dword ptr [ebp - 4], eax
    push push esi
    lea lea eax, [ebp - 24]
    push push eax
    push push dword ptr [g_1076AB44]
    call dword ptr [fp_1010C188]
    cmp cmp eax, 1
    mov mov esi, 0100h
    jne L4
    xor xor eax, eax
    mov mov byte ptr [ebp + eax - 0118h], al
    inc inc eax
    cmp cmp eax, esi
    jb L0
    mov mov al, byte ptr [ebp - 18]
    test test al, al
    mov mov byte ptr [ebp - 0118h], 32
    je L1
    push push ebx
    lea lea edx, [ebp - 17]
    push push edi
    movzx movzx ecx, byte ptr [edx]
    movzx movzx eax, al
    cmp cmp eax, ecx
    ja L3
    sub sub ecx, eax
    inc inc ecx
    mov mov ebx, ecx
    shr shr ecx, 2
    lea lea edi, [ebp + eax - 0118h]
    mov mov eax, 020202020h
    rep stosd rep stosd dword ptr es:[edi], eax
    mov mov ecx, ebx
    and and ecx, 3
    rep stosb rep stosb byte ptr es:[edi], al
    inc inc edx
    mov mov al, byte ptr [edx]
    inc inc edx
    test test al, al
    jne L2
    pop pop edi
    pop pop ebx
    push push 0
    push push dword ptr [g_1076AA30]
    lea lea eax, [ebp - 0518h]
    push push dword ptr [g_1076AB44]
    push push eax
    push push esi
    lea lea eax, [ebp - 0118h]
    push push eax
    push push 1
    call sub_10100EBE
    push push 0
    push push dword ptr [g_1076AB44]
    lea lea eax, [ebp - 0218h]
    push push esi
    push push eax
    push push esi
    lea lea eax, [ebp - 0118h]
    push push eax
    push push esi
    push push dword ptr [g_1076AA30]
    call sub_100FD213
    push push 0
    push push dword ptr [g_1076AB44]
    lea lea eax, [ebp - 0318h]
    push push esi
    push push eax
    push push esi
    lea lea eax, [ebp - 0118h]
    push push eax
    push push 0200h
    push push dword ptr [g_1076AA30]
    call sub_100FD23B
    add add esp, 92
    xor xor eax, eax
    mov mov cx, word ptr [ebp + eax*2 - 0518h]
    test test cl, 1
    je sub_10106F11
    or or byte ptr [eax + 01076AA41h], 16
    mov mov cl, byte ptr [ebp + eax - 0218h]
    mov mov byte ptr [eax + 01076AB60h], cl
    jmp sub_10106F43
    test test cl, 2
    je sub_10106F41
    or or byte ptr [eax + 01076AA41h], 32
    mov mov cl, byte ptr [ebp + eax - 0318h]
    jmp sub_10106F34
    mov mov byte ptr [eax + 01076AB60h], 0
    inc inc eax
    cmp cmp eax, esi
    jb sub_10106F25
    jmp sub_10106FB1
    xor xor eax, eax
    cmp cmp eax, 65
    jb sub_10106F94
    cmp cmp eax, 90
    ja sub_10106F99
    or or byte ptr [eax + 01076AA41h], 16
    mov mov cl, al
    add add cl, 32
    mov mov byte ptr [eax + 01076AB60h], cl
    jmp sub_10106FCC
    cmp cmp eax, 97
    jb sub_10106FCA
    cmp cmp eax, 122
    ja sub_10106FCF
    or or byte ptr [eax + 01076AA41h], 32
    mov mov cl, al
    sub sub cl, 32
    jmp sub_10106FBD
    mov mov byte ptr [eax + 01076AB60h], 0
    inc inc eax
    cmp cmp eax, esi
    jb sub_10106FB3
    mov mov ecx, dword ptr [ebp - 4]
    pop pop esi
    call sub_10100ED7
    leave leave
    ret ret
setSBUpLow ENDP
END
