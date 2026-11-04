.686
.MODEL FLAT, C
EXTRN sub_100087D5:PROC
EXTRN sub_10009214:PROC
EXTRN g_1067850C:DWORD
EXTRN g_10678510:DWORD
.CODE
FUN_10009250 PROC
    push ecx
    mov eax, dword ptr [g_1067850C]
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    xor esi, esi
    test eax, eax
    push edi
    mov dword ptr [esp + 12], eax
    jle L4
    xor edi, edi
    lea esp, [esp]
L0:
    mov eax, dword ptr [g_10678510]
    mov eax, dword ptr [edi + eax]
    cmp eax, 1
    jg L1
    push ebx
    push ebp
    push esi
    call sub_100087D5
    jmp L2
L1:
    cmp eax, 3
    jne L3
    push ebx
    push ebp
    push esi
    call sub_10009214
L2:
    add esp, 12
L3:
    mov eax, dword ptr [esp + 12]
    inc esi
    add edi, 116
    cmp esi, eax
    jl L0
L4:
    pop edi
    pop esi
    pop ebp
    pop ecx
    ret
FUN_10009250 ENDP
END
