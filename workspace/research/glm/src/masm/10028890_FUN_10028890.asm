.686
.MODEL FLAT, C
.CODE
FUN_10028890 PROC
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    push edi
    mov edi, eax
    lea eax, [edi - 1]
    cdq
    sub eax, edx
    mov esi, eax
    mov eax, dword ptr [esp + 20]
    sar esi, 1
    cmp eax, edi
    jge L2
    push ebx
    lea esp, [esp]
L0:
    lea eax, [esp + 28]
    push eax
    lea ebx, [ebp + esi*8]
    push ebx
    call dword ptr [esp + 0x2c]
    add esp, 8
    test al, al
    je L1
    mov ecx, dword ptr [ebx]
    mov dword ptr [ebp + edi*8], ecx
    mov edx, dword ptr [ebx + 4]
    lea eax, [esi - 1]
    mov dword ptr [ebp + edi*8 + 4], edx
    cdq
    sub eax, edx
    sar eax, 1
    mov edi, esi
    mov esi, eax
    cmp dword ptr [esp + 24], edi
    jl L0
L1:
    pop ebx
L2:
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 28]
    mov dword ptr [ebp + edi*8], eax
    mov dword ptr [ebp + edi*8 + 4], ecx
    pop edi
    pop esi
    pop ebp
    ret
FUN_10028890 ENDP
END
