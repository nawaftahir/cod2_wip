.686
.MODEL FLAT, C
EXTRN sub_100138F2:PROC
EXTRN sub_10013943:PROC
EXTRN sub_10057A9E:PROC
EXTRN sub_10057F7C:PROC
EXTRN EXTRN g_101CE5E8:DWORD:DWORD
.CODE
FUN_10009910 PROC
    sub sub esp, 0200h
    push push ebp
    mov mov ebp, dword ptr [esp + 0208h]
    mov mov ecx, dword ptr [ebp + 40]
    test test ecx, ecx
    push push esi
    jne L1
    mov mov eax, dword ptr [g_101CE5E8]
    test test eax, eax
    mov mov esi, eax
    jne L0
    push push 0100h
    push push 010192570h
    push push 1
    call sub_100138F2
    mov mov eax, dword ptr [g_101CE5E8]
    add add esp, 12
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [g_101CE5E8], eax
    mov mov dword ptr [ebp + 40], esi
    mov mov byte ptr [ebp + 37], 0
    jmp L2
    cmp cmp byte ptr [ebp + 37], 64
    jne L3
    push push ebx
    push push edi
    lea lea edx, [esp + 16]
    push push edx
    push push 64
    call sub_10057A9E
    lea lea eax, [esp + 24]
    push push eax
    push push 62
    mov mov eax, ecx
    call sub_10057F7C
    mov mov ebx, eax
    add add esp, 16
    cmp cmp ebx, 64
    jne L4
    push push eax
    push push 010192538h
    push push 1
    call sub_10013943
    add add esp, 12
    mov mov edi, dword ptr [ebp + 40]
    movzx movzx ecx, bl
    shl shl ecx, 3
    mov mov edx, ecx
    shr shr ecx, 2
    mov mov byte ptr [ebp + 37], bl
    lea lea esi, [esp + 16]
    rep movsd rep movsd dword ptr es:[edi], dword ptr [esi]
    mov mov ecx, edx
    and and ecx, 3
    rep movsb rep movsb byte ptr es:[edi], byte ptr [esi]
    pop pop edi
    pop pop ebx
    mov mov eax, dword ptr [esp + 0210h]
    fld fld dword ptr [ebp + 52]
    fmul fmul dword ptr [eax + 8]
    movzx movzx ecx, byte ptr [ebp + 37]
    fld fld dword ptr [ebp + 48]
    mov mov edx, dword ptr [ebp + 40]
    fmul fmul dword ptr [eax + 4]
    pop pop esi
    faddp faddp st(1)
    fld fld dword ptr [ebp + 44]
    fmul fmul dword ptr [eax]
    faddp faddp st(1)
    fstp fstp dword ptr [edx + ecx*8]
    mov mov ecx, dword ptr [ebp + 40]
    fld fld dword ptr [ebp + 64]
    fmul fmul dword ptr [eax + 8]
    fld fld dword ptr [ebp + 60]
    fmul fmul dword ptr [eax + 4]
    faddp faddp st(1)
    fld fld dword ptr [ebp + 56]
    fmul fmul dword ptr [eax]
    movzx movzx eax, byte ptr [ebp + 37]
    faddp faddp st(1)
    fstp fstp dword ptr [ecx + eax*8 + 4]
    mov mov al, byte ptr [ebp + 37]
L2:
    inc inc al
    mov mov byte ptr [ebp + 37], al
    pop pop ebp
L3:
    add add esp, 0200h
L4:
    ret ret
FUN_10009910 ENDP
END
