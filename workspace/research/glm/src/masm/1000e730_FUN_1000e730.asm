.686
.MODEL FLAT, C
.CODE
FUN_1000e730 PROC
    push ebp
    mov ebp, dword ptr [esp + 12]
    push esi
    push edi
    mov edi, eax
    lea eax, [edi - 1]
    cdq
    sub eax, edx
    mov esi, eax
    mov eax, dword ptr [esp + 16]
    sar esi, 1
    cmp eax, edi
    jge L1
    jmp L0
    lea ecx, [ecx]
L0:
    mov eax, dword ptr [ebx + esi*4]
    push ebp
    push eax
    call dword ptr [esp + 0x20]
    add esp, 8
    test eax, eax
    je L1
    mov ecx, dword ptr [ebx + esi*4]
    lea eax, [esi - 1]
    cdq
    sub eax, edx
    sar eax, 1
    mov dword ptr [ebx + edi*4], ecx
    mov edi, esi
    mov esi, eax
    cmp dword ptr [esp + 16], edi
    jl L0
L1:
    mov dword ptr [ebx + edi*4], ebp
    pop edi
FUN_1000e730 ENDP
END
