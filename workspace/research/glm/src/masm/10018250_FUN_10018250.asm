.686
.MODEL FLAT, C
EXTRN sub_100F78FA:PROC
EXTRN g_101DA964:DWORD
EXTRN g_101DA968:DWORD
.CODE
FUN_10018250 PROC
    push ebx
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov edi, dword ptr [g_101DA964]
    xor ebx, ebx
    dec edi
    js L3
L0:
    mov ecx, dword ptr [g_101DA968]
    lea esi, [edi + ebx]
    sar esi, 1
    lea eax, [esi + esi*2]
    mov edx, dword ptr [ecx + eax*4]
    push edx
    push ebp
    call sub_100F78FA
    add esp, 8
    test eax, eax
    je L4
    jge L1
    lea edi, [esi - 1]
    jmp L2
L1:
    lea ebx, [esi + 1]
L2:
    cmp ebx, edi
    jle L0
L3:
    pop edi
    pop esi
    pop ebp
    xor al, al
    pop ebx
    ret
L4:
    mov ecx, dword ptr [g_101DA968]
    lea eax, [esi + esi*2]
    mov edx, dword ptr [ecx + eax*4 + 8]
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [esp + 28]
    pop edi
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 4]
    mov eax, dword ptr [esp + 20]
    pop esi
    pop ebp
    mov dword ptr [eax], edx
    mov al, 1
    pop ebx
    ret
FUN_10018250 ENDP
END
