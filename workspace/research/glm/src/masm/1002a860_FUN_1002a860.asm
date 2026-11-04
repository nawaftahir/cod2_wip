.686
.MODEL FLAT, C
EXTRN sub_1000CC36:PROC
EXTRN sub_1000EAA0:PROC
EXTRN sub_1000EC6E:PROC
EXTRN sub_1000EE89:PROC
EXTRN g_1019BCB0:DWORD
EXTRN g_101CE708:DWORD
EXTRN g_10696CD0:DWORD
EXTRN g_10696CD4:DWORD
EXTRN g_10696CD8:DWORD
EXTRN g_10696CDC:DWORD
EXTRN g_10696CE0:DWORD
.CODE
FUN_1002a860 PROC
    mov eax, dword ptr [g_101CE708]
    cmp dword ptr [eax + 8], 2
    push ebp
    mov ebp, dword ptr [esp + 8]
    je L2
    push esi
    push edi
    push 4
    push 1
    push 2
    push 010197414h
    call sub_1000CC36
    mov esi, eax
    push 0
    mov dword ptr [ebp + 00000010Ch], esi
    mov ecx, dword ptr [g_10696CD4]
    mov eax, dword ptr [g_10696CD0]
    mov edi, dword ptr [g_10696CE0]
    push 11
    lea edx, [ecx + ecx]
    push 2
    lea ecx, [eax + eax]
    push edx
    push ecx
    mov eax, 21
    mov ecx, esi
    call sub_1000EE89
    mov eax, dword ptr [esi]
    add esp, 36
    cmp eax, 4
    jne L0
    push edi
    push 0
    push 21
    push esi
    call sub_1000EC6E
    add esp, 16
    jmp L1
L0:
    push ebx
    push edi
    push 21
    xor edi, edi
    xor ebx, ebx
    call sub_1000EAA0
    add esp, 8
    pop ebx
L1:
    fld dword ptr [g_10696CDC]
    xor edx, edx
    fmul dword ptr [g_1019BCB0]
    pop edi
    fld dword ptr [g_10696CD8]
    mov dword ptr [ebp + 000000118h], 03E800000h
    fmul dword ptr [g_1019BCB0]
    pop esi
    fstp dword ptr [ebp + 000000110h]
    fstp dword ptr [ebp + 000000114h]
    mov dword ptr [g_10696CD0], edx
    mov dword ptr [g_10696CD4], edx
    mov dword ptr [g_10696CD8], edx
    mov dword ptr [g_10696CDC], edx
    mov dword ptr [g_10696CE0], edx
L2:
    pop ebp
    ret
FUN_1002a860 ENDP
END
