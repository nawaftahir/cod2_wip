.686
.MODEL FLAT, C
EXTRN sub_10054D8F:PROC
EXTRN sub_10054F11:PROC
.CODE
FUN_10054f50 PROC
    push ebx
    mov ebx, dword ptr [esp + 16]
    xor edx, edx
    mov eax, 03B9AC9F0h
    div ebx
    push ebp
    push esi
    mov esi, dword ptr [esp + 16]
    mov ebp, dword ptr [esi + 4]
    push edi
    mov edi, eax
    test edi, edi
    jg L0
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 20], 70
    mov ecx, dword ptr [esi]
    push esi
    call dword ptr [ecx]
    add esp, 4
L0:
    mov eax, dword ptr [esp + 32]
    cmp edi, eax
    jl L1
    mov edi, eax
L1:
    lea edx, [eax*4]
    mov eax, dword ptr [esp + 24]
    push edx
    push eax
    push esi
    mov dword ptr [ebp + 80], edi
    call sub_10054D8F
    mov ebp, eax
    mov eax, dword ptr [esp + 44]
    add esp, 12
    xor esi, esi
    test eax, eax
    jbe L6
    mov edi, edi
L2:
    mov eax, dword ptr [esp + 32]
    sub eax, esi
    cmp edi, eax
    jb L3
    mov edi, eax
L3:
    mov edx, dword ptr [esp + 24]
    mov eax, dword ptr [esp + 20]
    mov ecx, edi
    imul ecx, ebx
    push ecx
    push edx
    push eax
    call sub_10054F11
    add esp, 12
    test edi, edi
    jbe L5
    mov ecx, edi
    lea ebx, [ebx]
L4:
    mov dword ptr [ebp + esi*4], eax
    inc esi
    add eax, ebx
    dec ecx
    jne L4
L5:
    cmp esi, dword ptr [esp + 32]
    jb L2
L6:
    pop edi
    pop esi
    mov eax, ebp
    pop ebp
    pop ebx
    ret
FUN_10054f50 ENDP
END
