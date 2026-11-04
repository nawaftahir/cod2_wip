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
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A60:DWORD
EXTRN g_101CE62C:DWORD
EXTRN g_101CE6B0:DWORD
EXTRN g_101CE6C8:DWORD
EXTRN g_101D4810:DWORD
EXTRN g_101D492C:DWORD
EXTRN g_101D4938:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_1072DDE8:DWORD
EXTRN g_1072DDEC:DWORD
.CODE
FUN_100128b0 PROC
    sub esp, 64
    push ebx
    push ebp
    mov ebp, dword ptr [edi]
    push esi
    mov ebx, edi
    lea esi, [esp + 16]
    call sub_100114E3
    push 64
    push ebp
    mov ebx, esi
    call sub_100126ED
    push 000030000h
    push 000020000h
    mov esi, eax
    call sub_100F61A2
    push 00008001Fh
    push 00008001Fh
    call sub_100F61B1
    xor ebx, ebx
    add esp, 24
    cmp esi, ebx
    jge L1
    push esi
    call sub_100EFE88
    push eax
    push 010193BD0h
    push ebx
    call dword ptr [fp_101D49C8]
    add esp, 12
L0:
    xor al, al
    pop esi
    pop ebp
    pop ebx
    add esp, 64
    ret
L1:
    mov eax, dword ptr [g_101CE6B0]
    mov byte ptr [g_101D492C], bl
    cmp byte ptr [eax + 8], bl
    je L2
    mov dword ptr [g_101D4810], ebx
    jmp L3
L2:
    mov ecx, dword ptr [g_101CE6C8]
    mov edx, dword ptr [ecx + 8]
    mov dword ptr [g_101D4810], edx
L3:
    mov eax, edi
    call sub_10011683
    mov eax, dword ptr [g_101D4C6C]
    mov ecx, dword ptr [g_101D4C70]
    mov dword ptr [g_1072DDE8], eax
    mov dword ptr [g_1072DDEC], ecx
    call sub_100121AE
    test al, al
    je L0
    mov edx, dword ptr [g_101CE62C]
    push edx
    call dword ptr [fp_101D4A60]
    add esp, 4
    call sub_10012107
    mov eax, dword ptr [g_101D4938]
    mov ecx, dword ptr [edi]
    shl eax, 4
    mov dword ptr [eax + 0101D493Ch], ecx
    mov edx, dword ptr [g_101D4938]
    mov eax, dword ptr [edi + 20]
    shl edx, 4
    mov dword ptr [edx + 0101D4944h], eax
    mov ecx, dword ptr [g_101D4938]
    mov edx, dword ptr [edi + 24]
    shl ecx, 4
    mov dword ptr [ecx + 0101D4948h], edx
    mov eax, dword ptr [g_101D4938]
    pop esi
    inc eax
    pop ebp
    mov dword ptr [g_101D4938], eax
    mov al, 1
    pop ebx
    add esp, 64
    ret
FUN_100128b0 ENDP
END
