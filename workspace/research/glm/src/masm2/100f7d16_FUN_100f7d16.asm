.686
.MODEL FLAT, C
EXTRN sub_100F7B8F:PROC
EXTRN sub_100F7BD3:PROC
EXTRN sub_100F7DB9:PROC
EXTRN sub_100F7DBC:PROC
EXTRN sub_100F7E13:PROC
EXTRN sub_100F855D:PROC
EXTRN sub_100FE8DF:PROC
EXTRN sub_101003EB:PROC
EXTRN EXTRN g_101A47C4:DWORD:DWORD
EXTRN EXTRN g_101A47CC:DWORD:DWORD
EXTRN EXTRN g_101A47D0:DWORD:DWORD
EXTRN EXTRN g_101A47DC:DWORD:DWORD
.CODE
FUN_100f7d16 PROC
    push push ebx
    push push esi
    push push edi
    mov mov byte ptr [eax], 0
    push push dword ptr [g_101A47D0]
    mov mov edi, 01019563Ch
    push push edi
    push push dword ptr [g_101A47CC]
    push push 3
    push push dword ptr [g_101A47C4]
    call sub_100F7B8F
    mov mov esi, 0101A47D0h
    add add esp, 20
    mov mov ebx, esi
    push push 010195820h
    push push dword ptr [g_101A47C4]
    call sub_100FE8DF
    add add esi, 12
    push push dword ptr [esi]
    push push dword ptr [ebx]
    call sub_101003EB
    add add esp, 16
    test test eax, eax
    je sub_100F7DBC
    xor xor ebp, ebp
    push push dword ptr [esi]
    mov mov ebx, esi
    push push edi
    push push dword ptr [esi - 4]
    push push 3
    push push dword ptr [g_101A47C4]
    call sub_100F7BD3
    add add esp, 20
    cmp cmp esi, 0101A4800h
    jl sub_100F7DB9
    test test ebp, ebp
    pop pop edi
    pop pop esi
    pop pop ebx
    jne sub_100F7E13
    mov mov eax, dword ptr [g_101A47C4]
    pop pop ebp
    ret ret
    push push dword ptr [g_101A47C4]
    call sub_100F855D
    and and dword ptr [g_101A47C4], 0
    mov mov eax, dword ptr [g_101A47DC]
    pop pop ecx
    pop pop ebp
    ret ret
FUN_100f7d16 ENDP
END
