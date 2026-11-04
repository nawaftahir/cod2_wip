.686
.MODEL FLAT, C
EXTRN sub_100F7B8F:PROC
EXTRN sub_100F7BD3:PROC
EXTRN sub_100F855D:PROC
EXTRN sub_100FE8DF:PROC
EXTRN sub_101003EB:PROC
EXTRN g_101A47C4:DWORD
EXTRN g_101A47CC:DWORD
EXTRN g_101A47D0:DWORD
EXTRN g_101A47DC:DWORD
.CODE
FUN_100f7d16 PROC
    push ebx
    push esi
    push edi
    mov byte ptr [eax], 0
    push dword ptr [g_101A47D0]
    mov edi, 01019563Ch
    push edi
    push dword ptr [g_101A47CC]
    push 3
    push dword ptr [g_101A47C4]
    call sub_100F7B8F
    mov esi, 0101A47D0h
    add esp, 20
    mov ebx, esi
L0:
    push 010195820h
    push dword ptr [g_101A47C4]
    call sub_100FE8DF
    add esi, 12
    push dword ptr [esi]
    push dword ptr [ebx]
    call sub_101003EB
    add esp, 16
    test eax, eax
    je L1
    xor ebp, ebp
L1:
    push dword ptr [esi]
    mov ebx, esi
    push edi
    push dword ptr [esi - 4]
    push 3
    push dword ptr [g_101A47C4]
    call sub_100F7BD3
    add esp, 20
    cmp esi, 0101A4800h
    jl L0
    test ebp, ebp
    pop edi
    pop esi
    pop ebx
    jne L2
    mov eax, dword ptr [g_101A47C4]
    pop ebp
    ret
L2:
    push dword ptr [g_101A47C4]
    call sub_100F855D
    and dword ptr [g_101A47C4], 0
    mov eax, dword ptr [g_101A47DC]
    pop ecx
    pop ebp
    ret
FUN_100f7d16 ENDP
END
