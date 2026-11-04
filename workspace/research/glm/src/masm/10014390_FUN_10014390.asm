.686
.MODEL FLAT, C
.CODE
FUN_10014390 PROC
    push ebx
    mov ebx, eax
    lea eax, [ebx - 1]
    cdq
    push ebp
    mov ebp, dword ptr [esp + 12]
    sub eax, edx
    push edi
    mov edi, eax
    mov eax, dword ptr [esp + 20]
    sar edi, 1
    cmp eax, ebx
    jge L2
    push esi
    lea esp, [esp]
L0:
    mov eax, edi
    shl eax, 4
    lea ecx, [esp + 28]
    lea esi, [eax + ebp]
    push ecx
    push esi
    call dword ptr [esp + 0x34]
    add esp, 8
    test al, al
    je L1
    mov edx, dword ptr [esi]
    shl ebx, 4
    add ebx, ebp
    mov dword ptr [ebx], edx
    mov eax, dword ptr [esi + 4]
    mov dword ptr [ebx + 4], eax
    mov ecx, dword ptr [esi + 8]
    mov dword ptr [ebx + 8], ecx
    mov edx, dword ptr [esi + 12]
    lea eax, [edi - 1]
    mov dword ptr [ebx + 12], edx
    cdq
    sub eax, edx
    sar eax, 1
    mov ebx, edi
    mov edi, eax
    cmp dword ptr [esp + 24], ebx
    jl L0
L1:
    pop esi
L2:
    mov eax, dword ptr [esp + 24]
    mov ecx, dword ptr [esp + 28]
    mov edx, dword ptr [esp + 32]
    shl ebx, 4
    add ebx, ebp
    mov dword ptr [ebx], eax
    mov eax, dword ptr [esp + 36]
    mov dword ptr [ebx + 4], ecx
    pop edi
    mov dword ptr [ebx + 8], edx
    pop ebp
    mov dword ptr [ebx + 12], eax
    pop ebx
    ret
FUN_10014390 ENDP
END
