.686
.MODEL FLAT, C
.CODE
FUN_1001d460 PROC
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
    lea eax, [esi + esi*2]
    lea ecx, [esp + 28]
    lea ebx, [ebp + eax*4]
    push ecx
    push ebx
    call dword ptr [esp + 0x30]
    add esp, 8
    test al, al
    je L1
    mov ecx, dword ptr [ebx]
    lea edx, [edi + edi*2]
    lea eax, [ebp + edx*4]
    mov dword ptr [eax], ecx
    mov edx, dword ptr [ebx + 4]
    mov dword ptr [eax + 4], edx
    mov ecx, dword ptr [ebx + 8]
    mov dword ptr [eax + 8], ecx
    lea eax, [esi - 1]
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
    mov ecx, dword ptr [esp + 24]
    lea edx, [edi + edi*2]
    lea eax, [ebp + edx*4]
    mov edx, dword ptr [esp + 28]
    mov dword ptr [eax], ecx
    mov ecx, dword ptr [esp + 32]
    pop edi
    mov dword ptr [eax + 4], edx
    pop esi
    mov dword ptr [eax + 8], ecx
    pop ebp
    ret
FUN_1001d460 ENDP
END
