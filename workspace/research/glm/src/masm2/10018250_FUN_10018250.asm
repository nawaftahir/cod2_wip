.686
.MODEL FLAT, C
EXTRN sub_100182BD:PROC
EXTRN sub_100182C5:PROC
EXTRN sub_100182C9:PROC
EXTRN sub_100F78FA:PROC
EXTRN EXTRN g_101DA964:DWORD:DWORD
EXTRN EXTRN g_101DA968:DWORD:DWORD
.CODE
FUN_10018250 PROC
    push push ebx
    push push ebp
    mov mov ebp, dword ptr [esp + 12]
    push push esi
    push push edi
    mov mov edi, dword ptr [g_101DA964]
    xor xor ebx, ebx
    dec dec edi
    js L0
    mov mov ecx, dword ptr [g_101DA968]
    lea lea esi, [edi + ebx]
    sar sar esi, 1
    lea lea eax, [esi + esi*2]
    mov mov edx, dword ptr [ecx + eax*4]
    push push edx
    push push ebp
    call sub_100F78FA
    add add esp, 8
    test test eax, eax
    je sub_100182C9
    jge sub_100182BD
    lea lea edi, [esi - 1]
    jmp sub_100182C5
    lea lea ebx, [esi + 1]
    cmp cmp ebx, edi
    jle L0
    pop pop edi
    pop pop esi
    pop pop ebp
    xor xor al, al
    pop pop ebx
    ret ret
    mov mov ecx, dword ptr [g_101DA968]
    lea lea eax, [esi + esi*2]
    mov mov edx, dword ptr [ecx + eax*4 + 8]
    lea lea eax, [ecx + eax*4]
    mov mov ecx, dword ptr [esp + 28]
    pop pop edi
    mov mov dword ptr [ecx], edx
    mov mov edx, dword ptr [eax + 4]
    mov mov eax, dword ptr [esp + 20]
    pop pop esi
    pop pop ebp
    mov mov dword ptr [eax], edx
    mov mov al, 1
    pop pop ebx
    ret ret
FUN_10018250 ENDP
END
