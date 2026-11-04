.686
.MODEL FLAT, C
EXTRN sub_10013FCA:PROC
EXTRN sub_10014121:PROC
EXTRN sub_10014136:PROC
EXTRN sub_1001414C:PROC
EXTRN sub_1001415C:PROC
EXTRN sub_10014173:PROC
.CODE
FUN_10013f30 PROC
    push push ecx
    push push esi
    push push edi
    mov mov edi, eax
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, eax
    sub sub ecx, edi
    sar sar ecx, 4
    cmp cmp ecx, 40
    jle sub_10013FCA
    lea lea eax, [ecx + 1]
    cdq cdq
    and and edx, 7
    add add eax, edx
    sar sar eax, 3
    push push ebx
    mov mov ebx, eax
    shl shl eax, 4
    push push ebp
    mov mov ebp, eax
    mov mov eax, dword ptr [esp + 32]
    shl shl ebx, 5
    lea lea esi, [edi + ebp]
    push push eax
    lea lea eax, [ebx + edi]
    mov mov dword ptr [esp + 20], esi
    call sub_10014121
    mov mov esi, dword ptr [esp + 28]
    mov mov ecx, dword ptr [esp + 36]
    mov mov edi, esi
    push push ecx
    lea lea eax, [esi + ebp]
    sub sub edi, ebp
    call sub_10014136
    mov mov eax, dword ptr [esp + 36]
    mov mov esi, eax
    sub sub esi, ebp
    mov mov ebp, dword ptr [esp + 40]
    mov mov edi, eax
    push push ebp
    sub sub edi, ebx
    call sub_1001414C
    mov mov edi, dword ptr [esp + 28]
    mov mov eax, esi
    mov mov esi, dword ptr [esp + 36]
    push push ebp
    call sub_1001415C
    add add esp, 16
    pop pop ebp
    pop pop ebx
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [esp + 24]
    mov mov esi, dword ptr [esp + 16]
    push push edx
    call sub_10014173
    add add esp, 4
    pop pop edi
    pop pop esi
    pop pop ecx
    ret ret
FUN_10013f30 ENDP
END
