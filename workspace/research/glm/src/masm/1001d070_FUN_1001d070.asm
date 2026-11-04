.686
.MODEL FLAT, C
EXTRN sub_1001D27E:PROC
EXTRN sub_1001D293:PROC
EXTRN sub_1001D2A9:PROC
EXTRN sub_1001D2B9:PROC
EXTRN sub_1001D2D2:PROC
.CODE
FUN_1001d070 PROC
    push ecx
    push esi
    mov esi, dword ptr [esp + 16]
    push edi
    mov edi, eax
    mov ecx, esi
    sub ecx, edi
    mov eax, 02AAAAAABh
    imul ecx
    sar edx, 1
    mov eax, edx
    shr eax, 31
    add eax, edx
    cmp eax, 40
    jle L0
    inc eax
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    push ebx
    lea ebx, [eax + eax*2]
    push ebp
    lea ebp, [eax + eax*2]
    mov eax, dword ptr [esp + 32]
    shl ebx, 2
    shl ebp, 3
    lea esi, [ebx + edi]
    push eax
    lea eax, [edi + ebp]
    mov dword ptr [esp + 20], esi
    call sub_1001D27E
    mov esi, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 36]
    mov edi, esi
    push ecx
    lea eax, [ebx + esi]
    sub edi, ebx
    call sub_1001D293
    mov eax, dword ptr [esp + 36]
    mov esi, eax
    sub esi, ebx
    mov ebx, dword ptr [esp + 40]
    mov edi, eax
    push ebx
    sub edi, ebp
    call sub_1001D2A9
    mov edi, dword ptr [esp + 28]
    mov eax, esi
    mov esi, dword ptr [esp + 36]
    push ebx
    call sub_1001D2B9
    add esp, 16
    pop ebp
    pop ebx
    pop edi
    pop esi
    pop ecx
    ret
L0:
    mov edx, dword ptr [esp + 24]
    mov eax, esi
    mov esi, dword ptr [esp + 16]
    push edx
    call sub_1001D2D2
    add esp, 4
    pop edi
    pop esi
    pop ecx
    ret
FUN_1001d070 ENDP
END
