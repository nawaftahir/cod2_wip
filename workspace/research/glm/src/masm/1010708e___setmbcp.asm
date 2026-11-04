.686
.MODEL FLAT, C
EXTRN sub_100F85FF:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB791:PROC
EXTRN sub_100FC094:PROC
EXTRN sub_100FC4F6:PROC
EXTRN sub_10106F92:PROC
EXTRN sub_10107313:PROC
EXTRN fp_1010C0C4:DWORD
EXTRN fp_1010C0C8:DWORD
EXTRN g_101AE1A8:DWORD
EXTRN g_101AE1D8:DWORD
EXTRN g_1076AA30:DWORD
EXTRN g_1076AA34:DWORD
EXTRN g_1076AA38:DWORD
EXTRN g_1076AB44:DWORD
.CODE
__setmbcp PROC
    push 20
    push 0101821E0h
    call sub_100FB61C
    or dword ptr [ebp - 32], 0FFFFFFFFh
    push 13
    call sub_100FC094
    pop ecx
    xor edi, edi
    mov dword ptr [ebp - 4], edi
    mov dword ptr [g_101AE1D8], edi
    mov eax, dword ptr [ebp + 8]
    cmp eax, -2
    jne L0
    mov dword ptr [g_101AE1D8], 1
    call dword ptr [fp_1010C0C4]
    jmp L2
L0:
    cmp eax, -3
    jne L1
    mov dword ptr [g_101AE1D8], 1
    call dword ptr [fp_1010C0C8]
    jmp L2
L1:
    cmp eax, -4
    jne L2
    mov dword ptr [g_101AE1D8], 1
    mov eax, dword ptr [g_101AE1A8]
L2:
    mov dword ptr [ebp + 8], eax
    cmp eax, dword ptr [g_1076AB44]
    je L12
    mov esi, dword ptr [g_1076AA34]
    mov dword ptr [ebp - 36], esi
    cmp esi, edi
    je L3
    cmp dword ptr [esi], edi
    je L4
L3:
    push 000000220h
    call sub_100FC4F6
    pop ecx
    mov esi, eax
    mov dword ptr [ebp - 36], esi
L4:
    cmp esi, edi
    je L11
    push dword ptr [ebp + 8]
    call sub_10106F92
    pop ecx
    mov dword ptr [ebp - 32], eax
    cmp eax, edi
    jne L11
    mov dword ptr [esi], edi
    mov eax, dword ptr [g_1076AB44]
    mov dword ptr [esi + 4], eax
    mov eax, dword ptr [g_1076AA38]
    mov dword ptr [esi + 8], eax
    mov eax, dword ptr [g_1076AA30]
    mov dword ptr [esi + 12], eax
    xor eax, eax
L5:
    mov dword ptr [ebp - 28], eax
    cmp eax, 5
    jge L6
    mov cx, word ptr [eax*2 + 01076AB50h]
    mov word ptr [esi + eax*2 + 16], cx
    inc eax
    jmp L5
L6:
    xor eax, eax
L7:
    mov dword ptr [ebp - 28], eax
    cmp eax, 000000101h
    jge L8
    mov cl, byte ptr [eax + 01076AA40h]
    mov byte ptr [eax + esi + 28], cl
    inc eax
    jmp L7
L8:
    xor eax, eax
L9:
    mov dword ptr [ebp - 28], eax
    cmp eax, 000000100h
    jge L10
    mov cl, byte ptr [eax + 01076AB60h]
    mov byte ptr [eax + esi + 00000011Dh], cl
    inc eax
    jmp L9
L10:
    mov dword ptr [g_1076AA34], esi
L11:
    cmp dword ptr [ebp - 32], -1
    jne L13
    cmp esi, dword ptr [g_1076AA34]
    je L13
    push esi
    call sub_100F85FF
    pop ecx
    jmp L13
L12:
    mov dword ptr [ebp - 32], edi
L13:
    or dword ptr [ebp - 4], 0FFFFFFFFh
    call sub_10107313
    mov eax, dword ptr [ebp - 32]
    call sub_100FB791
    ret
__setmbcp ENDP
END
