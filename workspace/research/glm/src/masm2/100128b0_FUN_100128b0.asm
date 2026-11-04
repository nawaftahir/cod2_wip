.686
.MODEL FLAT, C
EXTRN sub_100114E3:PROC
EXTRN sub_10011683:PROC
EXTRN sub_10012107:PROC
EXTRN sub_100121AE:PROC
EXTRN sub_100126ED:PROC
EXTRN sub_100EFE88:PROC
EXTRN sub_100F61A2:PROC
EXTRN sub_100F61B1:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A60:DWORD:DWORD
EXTRN EXTRN g_101CE62C:DWORD:DWORD
EXTRN EXTRN g_101CE6B0:DWORD:DWORD
EXTRN EXTRN g_101CE6C8:DWORD:DWORD
EXTRN EXTRN g_101D4810:DWORD:DWORD
EXTRN EXTRN g_101D492C:DWORD:DWORD
EXTRN EXTRN g_101D4938:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_1072DDE8:DWORD:DWORD
EXTRN EXTRN g_1072DDEC:DWORD:DWORD
.CODE
FUN_100128b0 PROC
    sub sub esp, 64
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [edi]
    push push esi
    mov mov ebx, edi
    lea lea esi, [esp + 16]
    call sub_100114E3
    push push 64
    push push ebp
    mov mov ebx, esi
    call sub_100126ED
    push push 030000h
    push push 020000h
    mov mov esi, eax
    call sub_100F61A2
    push push 08001Fh
    push push 08001Fh
    call sub_100F61B1
    xor xor ebx, ebx
    add add esp, 24
    cmp cmp esi, ebx
    jge L0
    push push esi
    call sub_100EFE88
    push push eax
    push push 010193BD0h
    push push ebx
    call dword ptr [fp_101D49C8]
    add add esp, 12
    xor xor al, al
    pop pop esi
    pop pop ebp
    pop pop ebx
    add add esp, 64
    ret ret
    mov mov eax, dword ptr [g_101CE6B0]
    mov mov byte ptr [g_101D492C], bl
    cmp cmp byte ptr [eax + 8], bl
    je L1
    mov mov dword ptr [g_101D4810], ebx
    jmp L2
    mov mov ecx, dword ptr [g_101CE6C8]
    mov mov edx, dword ptr [ecx + 8]
    mov mov dword ptr [g_101D4810], edx
    mov mov eax, edi
    call sub_10011683
    mov mov eax, dword ptr [g_101D4C6C]
    mov mov ecx, dword ptr [g_101D4C70]
    mov mov dword ptr [g_1072DDE8], eax
    mov mov dword ptr [g_1072DDEC], ecx
    call sub_100121AE
    test test al, al
    je L3
    mov mov edx, dword ptr [g_101CE62C]
    push push edx
    call dword ptr [fp_101D4A60]
    add add esp, 4
    call sub_10012107
    mov mov eax, dword ptr [g_101D4938]
    mov mov ecx, dword ptr [edi]
    shl shl eax, 4
    mov mov dword ptr [eax + 0101D493Ch], ecx
    mov mov edx, dword ptr [g_101D4938]
    mov mov eax, dword ptr [edi + 20]
    shl shl edx, 4
    mov mov dword ptr [edx + 0101D4944h], eax
    mov mov ecx, dword ptr [g_101D4938]
    mov mov edx, dword ptr [edi + 24]
L1:
    shl shl ecx, 4
    mov mov dword ptr [ecx + 0101D4948h], edx
    mov mov eax, dword ptr [g_101D4938]
    pop pop esi
    inc inc eax
    pop pop ebp
    mov mov dword ptr [g_101D4938], eax
    mov mov al, 1
    pop pop ebx
    add add esp, 64
L3:
    ret ret
FUN_100128b0 ENDP
END
