.686
.MODEL FLAT, C
EXTRN sub_10054D8F:PROC
EXTRN sub_10054F11:PROC
EXTRN sub_10055026:PROC
EXTRN sub_1005504E:PROC
EXTRN sub_10055050:PROC
EXTRN sub_10055072:PROC
EXTRN sub_1005507A:PROC
.CODE
FUN_10054f50 PROC
    push push ebx
    mov mov ebx, dword ptr [esp + 16]
    xor xor edx, edx
    mov mov eax, 03B9AC9F0h
    div div ebx
    push push ebp
    push push esi
    mov mov esi, dword ptr [esp + 16]
    mov mov ebp, dword ptr [esi + 4]
    push push edi
    mov mov edi, eax
    test test edi, edi
    jg L0
    mov mov eax, dword ptr [esi]
    mov mov dword ptr [eax + 20], 70
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx]
    add add esp, 4
    mov mov eax, dword ptr [esp + 32]
    cmp cmp edi, eax
    jl L1
    mov mov edi, eax
    lea lea edx, [eax*4]
    mov mov eax, dword ptr [esp + 24]
    push push edx
    push push eax
    push push esi
    mov mov dword ptr [ebp + 80], edi
    call sub_10054D8F
    mov mov ebp, eax
    mov mov eax, dword ptr [esp + 44]
    add add esp, 12
    xor xor esi, esi
    test test eax, eax
    jbe sub_1005504E
    mov mov edi, edi
    mov mov eax, dword ptr [esp + 32]
    sub sub eax, esi
    cmp cmp edi, eax
    jb sub_10055026
    mov mov edi, eax
    mov mov edx, dword ptr [esp + 24]
L1:
    mov mov eax, dword ptr [esp + 20]
    mov mov ecx, edi
    imul imul ecx, ebx
    push push ecx
    push push edx
    push push eax
    call sub_10054F11
    add add esp, 12
    test test edi, edi
    jbe sub_10055072
    mov mov ecx, edi
    lea lea ebx, [ebx]
    mov mov dword ptr [ebp + esi*4], eax
    inc inc esi
    add add eax, ebx
    dec dec ecx
    jne sub_1005507A
    cmp cmp esi, dword ptr [esp + 32]
    jb sub_10055050
    pop pop edi
    pop pop esi
    mov mov eax, ebp
    pop pop ebp
    pop pop ebx
    ret ret
FUN_10054f50 ENDP
END
