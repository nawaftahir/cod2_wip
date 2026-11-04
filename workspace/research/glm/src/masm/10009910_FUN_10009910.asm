.686
.MODEL FLAT, C
EXTRN sub_100138F2:PROC
EXTRN sub_10013943:PROC
EXTRN sub_10057A9E:PROC
EXTRN sub_10057F7C:PROC
EXTRN g_101CE5E8:DWORD
.CODE
FUN_10009910 PROC
    sub esp, 000000200h
    push ebp
    mov ebp, dword ptr [esp + 000000208h]
    mov ecx, dword ptr [ebp + 40]
    test ecx, ecx
    push esi
    jne L1
    mov eax, dword ptr [g_101CE5E8]
    test eax, eax
    mov esi, eax
    jne L0
    push 000000100h
    push 010192570h
    push 1
    call sub_100138F2
    mov eax, dword ptr [g_101CE5E8]
    add esp, 12
L0:
    mov eax, dword ptr [eax]
    mov dword ptr [g_101CE5E8], eax
    mov dword ptr [ebp + 40], esi
    mov byte ptr [ebp + 37], 0
    jmp L3
L1:
    cmp byte ptr [ebp + 37], 64
    jne L3
    push ebx
    push edi
    lea edx, [esp + 16]
    push edx
    push 64
    call sub_10057A9E
    lea eax, [esp + 24]
    push eax
    push 62
    mov eax, ecx
    call sub_10057F7C
    mov ebx, eax
    add esp, 16
    cmp ebx, 64
    jne L2
    push eax
    push 010192538h
    push 1
    call sub_10013943
    add esp, 12
L2:
    mov edi, dword ptr [ebp + 40]
    movzx ecx, bl
    shl ecx, 3
    mov edx, ecx
    shr ecx, 2
    mov byte ptr [ebp + 37], bl
    lea esi, [esp + 16]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov ecx, edx
    and ecx, 3
    rep movsb byte ptr es:[edi], byte ptr [esi]
    pop edi
    pop ebx
L3:
    mov eax, dword ptr [esp + 000000210h]
    fld dword ptr [ebp + 52]
    fmul dword ptr [eax + 8]
    movzx ecx, byte ptr [ebp + 37]
    fld dword ptr [ebp + 48]
    mov edx, dword ptr [ebp + 40]
    fmul dword ptr [eax + 4]
    pop esi
    faddp st(1)
    fld dword ptr [ebp + 44]
    fmul dword ptr [eax]
    faddp st(1)
    fstp dword ptr [edx + ecx*8]
    mov ecx, dword ptr [ebp + 40]
    fld dword ptr [ebp + 64]
    fmul dword ptr [eax + 8]
    fld dword ptr [ebp + 60]
    fmul dword ptr [eax + 4]
    faddp st(1)
    fld dword ptr [ebp + 56]
    fmul dword ptr [eax]
    movzx eax, byte ptr [ebp + 37]
    faddp st(1)
    fstp dword ptr [ecx + eax*8 + 4]
    mov al, byte ptr [ebp + 37]
    inc al
    mov byte ptr [ebp + 37], al
    pop ebp
    add esp, 000000200h
    ret
FUN_10009910 ENDP
END
