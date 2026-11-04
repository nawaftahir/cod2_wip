.686
.MODEL FLAT, C
EXTRN sub_100F85FF:PROC
EXTRN sub_100FB61C:PROC
EXTRN sub_100FB791:PROC
EXTRN sub_100FC094:PROC
EXTRN sub_100FC4F6:PROC
EXTRN sub_10106F92:PROC
EXTRN sub_10107236:PROC
EXTRN sub_10107237:PROC
EXTRN sub_1010723E:PROC
EXTRN sub_10107245:PROC
EXTRN sub_10107255:PROC
EXTRN sub_10107269:PROC
EXTRN sub_10107273:PROC
EXTRN sub_1010729E:PROC
EXTRN sub_101072A8:PROC
EXTRN sub_101072E4:PROC
EXTRN sub_101072EC:PROC
EXTRN sub_101072F5:PROC
EXTRN sub_10107313:PROC
EXTRN EXTRN fp_1010C0C4:DWORD:DWORD
EXTRN EXTRN fp_1010C0C8:DWORD:DWORD
EXTRN EXTRN g_101AE1A8:DWORD:DWORD
EXTRN EXTRN g_101AE1D8:DWORD:DWORD
EXTRN EXTRN g_1076AA30:DWORD:DWORD
EXTRN EXTRN g_1076AA34:DWORD:DWORD
EXTRN EXTRN g_1076AA38:DWORD:DWORD
EXTRN EXTRN g_1076AB44:DWORD:DWORD
.CODE
__setmbcp PROC
    push push 20
    push push 0101821E0h
    call sub_100FB61C
    or or dword ptr [ebp - 32], -1
    push push 13
    call sub_100FC094
    pop pop ecx
    xor xor edi, edi
    mov mov dword ptr [ebp - 4], edi
    mov mov dword ptr [g_101AE1D8], edi
    mov mov eax, dword ptr [ebp + 8]
    cmp cmp eax, -2
    jne L0
    mov mov dword ptr [g_101AE1D8], 1
    call dword ptr [fp_1010C0C4]
    jmp L2
    cmp cmp eax, -3
    jne L1
    mov mov dword ptr [g_101AE1D8], 1
    call dword ptr [fp_1010C0C8]
    jmp L3
    cmp cmp eax, -4
    jne L4
    mov mov dword ptr [g_101AE1D8], 1
    mov mov eax, dword ptr [g_101AE1A8]
L0:
    mov mov dword ptr [ebp + 8], eax
    cmp cmp eax, dword ptr [g_1076AB44]
    je sub_10107237
    mov mov esi, dword ptr [g_1076AA34]
    mov mov dword ptr [ebp - 36], esi
    cmp cmp esi, edi
    je L5
    cmp cmp dword ptr [esi], edi
    je L6
    push push 0220h
    call sub_100FC4F6
    pop pop ecx
    mov mov esi, eax
    mov mov dword ptr [ebp - 36], esi
    cmp cmp esi, edi
    je sub_10107245
    push push dword ptr [ebp + 8]
    call sub_10106F92
    pop pop ecx
L2:
    mov mov dword ptr [ebp - 32], eax
    cmp cmp eax, edi
    jne sub_10107255
    mov mov dword ptr [esi], edi
    mov mov eax, dword ptr [g_1076AB44]
    mov mov dword ptr [esi + 4], eax
    mov mov eax, dword ptr [g_1076AA38]
    mov mov dword ptr [esi + 8], eax
    mov mov eax, dword ptr [g_1076AA30]
    mov mov dword ptr [esi + 12], eax
    xor xor eax, eax
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, 5
    jge sub_1010723E
    mov mov cx, word ptr [eax*2 + 01076AB50h]
    mov mov word ptr [esi + eax*2 + 16], cx
    inc inc eax
    jmp sub_10107236
    xor xor eax, eax
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, 0101h
    jge sub_10107273
    mov mov cl, byte ptr [eax + 01076AA40h]
    mov mov byte ptr [eax + esi + 28], cl
    inc inc eax
    jmp sub_10107269
    xor xor eax, eax
    mov mov dword ptr [ebp - 28], eax
    cmp cmp eax, 0100h
    jge sub_101072A8
    mov mov cl, byte ptr [eax + 01076AB60h]
    mov mov byte ptr [eax + esi + 011Dh], cl
    inc inc eax
    jmp sub_1010729E
    mov mov dword ptr [g_1076AA34], esi
    cmp cmp dword ptr [ebp - 32], -1
    jne sub_101072E4
    cmp cmp esi, dword ptr [g_1076AA34]
    je sub_101072EC
    push push esi
    call sub_100F85FF
    pop pop ecx
    jmp sub_101072F5
    mov mov dword ptr [ebp - 32], edi
    or or dword ptr [ebp - 4], -1
    call sub_10107313
    mov mov eax, dword ptr [ebp - 32]
    call sub_100FB791
    ret ret
__setmbcp ENDP
END
