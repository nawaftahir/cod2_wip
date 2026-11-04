.686
.MODEL FLAT, C
EXTRN sub_1000CC36:PROC
EXTRN sub_1000EAA0:PROC
EXTRN sub_1000EC6E:PROC
EXTRN sub_1000EE89:PROC
EXTRN sub_1002A936:PROC
EXTRN sub_1002A948:PROC
EXTRN sub_1002A957:PROC
EXTRN EXTRN g_1019BCB0:DWORD:DWORD
EXTRN EXTRN g_101CE708:DWORD:DWORD
EXTRN EXTRN g_10696CD0:DWORD:DWORD
EXTRN EXTRN g_10696CD4:DWORD:DWORD
EXTRN EXTRN g_10696CD8:DWORD:DWORD
EXTRN EXTRN g_10696CDC:DWORD:DWORD
EXTRN EXTRN g_10696CE0:DWORD:DWORD
.CODE
FUN_1002a860 PROC
    mov mov eax, dword ptr [g_101CE708]
    cmp cmp dword ptr [eax + 8], 2
    push push ebp
    mov mov ebp, dword ptr [esp + 8]
    je sub_1002A948
    push push esi
    push push edi
    push push 4
    push push 1
    push push 2
    push push 010197414h
    call sub_1000CC36
    mov mov esi, eax
    push push 0
    mov mov dword ptr [ebp + 010Ch], esi
    mov mov ecx, dword ptr [g_10696CD4]
    mov mov eax, dword ptr [g_10696CD0]
    mov mov edi, dword ptr [g_10696CE0]
    push push 11
    lea lea edx, [ecx + ecx]
    push push 2
    lea lea ecx, [eax + eax]
    push push edx
    push push ecx
    mov mov eax, 21
    mov mov ecx, esi
    call sub_1000EE89
    mov mov eax, dword ptr [esi]
    add add esp, 36
    cmp cmp eax, 4
    jne sub_1002A936
    push push edi
    push push 0
    push push 21
    push push esi
    call sub_1000EC6E
    add add esp, 16
    jmp sub_1002A957
    push push ebx
    push push edi
    push push 21
    xor xor edi, edi
    xor xor ebx, ebx
    call sub_1000EAA0
    add add esp, 8
    pop pop ebx
    fld fld dword ptr [g_10696CDC]
    xor xor edx, edx
    fmul fmul dword ptr [g_1019BCB0]
    pop pop edi
    fld fld dword ptr [g_10696CD8]
    mov mov dword ptr [ebp + 0118h], 03E800000h
    fmul fmul dword ptr [g_1019BCB0]
    pop pop esi
    fstp fstp dword ptr [ebp + 0110h]
    fstp fstp dword ptr [ebp + 0114h]
    mov mov dword ptr [g_10696CD0], edx
    mov mov dword ptr [g_10696CD4], edx
    mov mov dword ptr [g_10696CD8], edx
    mov mov dword ptr [g_10696CDC], edx
    mov mov dword ptr [g_10696CE0], edx
    pop pop ebp
    ret ret
FUN_1002a860 ENDP
END
