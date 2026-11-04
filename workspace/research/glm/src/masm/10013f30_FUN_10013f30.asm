.686
.MODEL FLAT, C
EXTRN sub_10014121:PROC
EXTRN sub_10014136:PROC
EXTRN sub_1001414C:PROC
EXTRN sub_1001415C:PROC
EXTRN sub_10014173:PROC
.CODE
FUN_10013f30 PROC
    push ecx
    push esi
    push edi
    mov edi, eax
    mov eax, dword ptr [esp + 20]
    mov ecx, eax
    sub ecx, edi
    sar ecx, 4
    cmp ecx, 40
    jle L0
    lea eax, [ecx + 1]
    cdq
    and edx, 7
    add eax, edx
    sar eax, 3
    push ebx
    mov ebx, eax
    shl eax, 4
    push ebp
    mov ebp, eax
    mov eax, dword ptr [esp + 32]
    shl ebx, 5
    lea esi, [edi + ebp]
    push eax
    lea eax, [ebx + edi]
    mov dword ptr [esp + 20], esi
    call sub_10014121
    mov esi, dword ptr [esp + 28]
    mov ecx, dword ptr [esp + 36]
    mov edi, esi
    push ecx
    lea eax, [esi + ebp]
    sub edi, ebp
    call sub_10014136
    mov eax, dword ptr [esp + 36]
    mov esi, eax
    sub esi, ebp
    mov ebp, dword ptr [esp + 40]
    mov edi, eax
    push ebp
    sub edi, ebx
    call sub_1001414C
    mov edi, dword ptr [esp + 28]
    mov eax, esi
    mov esi, dword ptr [esp + 36]
    push ebp
    call sub_1001415C
    add esp, 16
    pop ebp
    pop ebx
    pop edi
    pop esi
    pop ecx
    ret
L0:
    mov edx, dword ptr [esp + 24]
    mov esi, dword ptr [esp + 16]
    push edx
    call sub_10014173
    add esp, 4
    pop edi
    pop esi
    pop ecx
    ret
FUN_10013f30 ENDP
END
