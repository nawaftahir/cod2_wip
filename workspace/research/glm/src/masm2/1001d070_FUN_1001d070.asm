.686
.MODEL FLAT, C
EXTRN sub_1001D124:PROC
EXTRN sub_1001D27E:PROC
EXTRN sub_1001D293:PROC
EXTRN sub_1001D2A9:PROC
EXTRN sub_1001D2B9:PROC
EXTRN sub_1001D2D2:PROC
.CODE
FUN_1001d070 PROC
    push push ecx
    push push esi
    mov mov esi, dword ptr [esp + 16]
    push push edi
    mov mov edi, eax
    mov mov ecx, esi
    sub sub ecx, edi
    mov mov eax, 02AAAAAABh
    imul imul ecx
    sar sar edx, 1
    mov mov eax, edx
    shr shr eax, 31
    add add eax, edx
    cmp cmp eax, 40
    jle sub_1001D124
    inc inc eax
    cdq cdq
    and and edx, 7
    add add eax, edx
    sar sar eax, 3
    push push ebx
    lea lea ebx, [eax + eax*2]
    push push ebp
    lea lea ebp, [eax + eax*2]
    mov mov eax, dword ptr [esp + 32]
    shl shl ebx, 2
    shl shl ebp, 3
    lea lea esi, [ebx + edi]
    push push eax
    lea lea eax, [edi + ebp]
    mov mov dword ptr [esp + 20], esi
    call sub_1001D27E
    mov mov esi, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 36]
    mov mov edi, esi
    push push ecx
    lea lea eax, [ebx + esi]
    sub sub edi, ebx
    call sub_1001D293
    mov mov eax, dword ptr [esp + 36]
    mov mov esi, eax
    sub sub esi, ebx
    mov mov ebx, dword ptr [esp + 40]
    mov mov edi, eax
    push push ebx
    sub sub edi, ebp
    call sub_1001D2A9
    mov mov edi, dword ptr [esp + 28]
    mov mov eax, esi
    mov mov esi, dword ptr [esp + 36]
    push push ebx
    call sub_1001D2B9
    add add esp, 16
    pop pop ebp
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [esp + 24]
    mov mov eax, esi
    mov mov esi, dword ptr [esp + 16]
    push push edx
    call sub_1001D2D2
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
FUN_1001d070 ENDP
END
