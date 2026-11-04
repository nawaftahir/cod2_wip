.686
.MODEL FLAT, C
EXTRN sub_100FD213:PROC
EXTRN sub_100FD23B:PROC
EXTRN sub_10100EBE:PROC
EXTRN sub_10100ED7:PROC
EXTRN fp_1010C188:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_1076AA30:DWORD
EXTRN g_1076AB44:DWORD
.CODE
setSBUpLow PROC
    push ebp
    mov ebp, esp
    sub esp, 000000518h
    mov eax, dword ptr [g_101A50D0]
    mov dword ptr [ebp - 4], eax
    push esi
    lea eax, [ebp - 24]
    push eax
    push dword ptr [g_1076AB44]
    call dword ptr [fp_1010C188]
    cmp eax, 1
    mov esi, 000000100h
    jne L9
    xor eax, eax
L0:
    mov byte ptr [ebp + eax - 000000118h], al
    inc eax
    cmp eax, esi
    jb L0
    mov al, byte ptr [ebp - 18]
    test al, al
    mov byte ptr [ebp - 000000118h], 32
    je L3
    push ebx
    lea edx, [ebp - 17]
    push edi
L1:
    movzx ecx, byte ptr [edx]
    movzx eax, al
    cmp eax, ecx
    ja L2
    sub ecx, eax
    inc ecx
    mov ebx, ecx
    shr ecx, 2
    lea edi, [ebp + eax - 000000118h]
    mov eax, 020202020h
    rep stosd dword ptr es:[edi], eax
    mov ecx, ebx
    and ecx, 3
    rep stosb byte ptr es:[edi], al
L2:
    inc edx
    mov al, byte ptr [edx]
    inc edx
    test al, al
    jne L1
    pop edi
    pop ebx
L3:
    push 0
    push dword ptr [g_1076AA30]
    lea eax, [ebp - 000000518h]
    push dword ptr [g_1076AB44]
    push eax
    push esi
    lea eax, [ebp - 000000118h]
    push eax
    push 1
    call sub_10100EBE
    push 0
    push dword ptr [g_1076AB44]
    lea eax, [ebp - 000000218h]
    push esi
    push eax
    push esi
    lea eax, [ebp - 000000118h]
    push eax
    push esi
    push dword ptr [g_1076AA30]
    call sub_100FD213
    push 0
    push dword ptr [g_1076AB44]
    lea eax, [ebp - 000000318h]
    push esi
    push eax
    push esi
    lea eax, [ebp - 000000118h]
    push eax
    push 000000200h
    push dword ptr [g_1076AA30]
    call sub_100FD23B
    add esp, 92
    xor eax, eax
L4:
    mov cx, word ptr [ebp + eax*2 - 000000518h]
    test cl, 1
    je L6
    or byte ptr [eax + 01076AA41h], 16
    mov cl, byte ptr [ebp + eax - 000000218h]
L5:
    mov byte ptr [eax + 01076AB60h], cl
    jmp L8
L6:
    test cl, 2
    je L7
    or byte ptr [eax + 01076AA41h], 32
    mov cl, byte ptr [ebp + eax - 000000318h]
    jmp L5
L7:
    mov byte ptr [eax + 01076AB60h], 0
L8:
    inc eax
    cmp eax, esi
    jb L4
    jmp L15
L9:
    xor eax, eax
L10:
    cmp eax, 65
    jb L12
    cmp eax, 90
    ja L12
    or byte ptr [eax + 01076AA41h], 16
    mov cl, al
    add cl, 32
L11:
    mov byte ptr [eax + 01076AB60h], cl
    jmp L14
L12:
    cmp eax, 97
    jb L13
    cmp eax, 122
    ja L13
    or byte ptr [eax + 01076AA41h], 32
    mov cl, al
    sub cl, 32
    jmp L11
L13:
    mov byte ptr [eax + 01076AB60h], 0
L14:
    inc eax
    cmp eax, esi
    jb L10
L15:
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100ED7
    leave
    ret
setSBUpLow ENDP
END
