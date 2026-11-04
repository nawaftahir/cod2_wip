.686
.MODEL FLAT, C
EXTRN sub_10017D33:PROC
EXTRN sub_10017D3A:PROC
EXTRN sub_10017D3F:PROC
EXTRN sub_10017D47:PROC
EXTRN sub_10017D4C:PROC
EXTRN sub_10017D50:PROC
EXTRN sub_10017D51:PROC
EXTRN sub_10017D66:PROC
EXTRN sub_10017D81:PROC
EXTRN sub_10017D85:PROC
EXTRN sub_1001822E:PROC
.CODE
FUN_10017c90 PROC
    mov mov eax, dword ptr [esp + 8]
    push push edi
    mov mov edi, dword ptr [esp + 8]
    cmp cmp edi, eax
    je sub_10017D33
    push push esi
    lea lea esi, [edi + 4]
    cmp cmp esi, eax
    je sub_10017D3A
    push push ebx
    push push ebp
    lea lea ebp, [esi + 4]
    jmp L0
    mov mov edi, dword ptr [esp + 20]
    mov mov eax, dword ptr [edi]
    mov mov ecx, dword ptr [esi]
    mov mov ebx, dword ptr [esp + 28]
    push push eax
    push push ecx
    call call ebx
    add add esp, 8
    test test al, al
    je L1
    cmp cmp edi, esi
    je sub_10017D4C
    cmp cmp esi, ebp
    je sub_10017D50
    push push edi
    jmp sub_10017D47
    mov mov edx, dword ptr [ebp - 8]
    mov mov eax, dword ptr [esi]
    lea lea edi, [ebp - 8]
    push push edx
    push push eax
    call call ebx
    add add esp, 8
    test test al, al
    je sub_10017D66
    mov mov ecx, dword ptr [edi - 4]
    mov mov edx, dword ptr [esi]
    mov mov ebx, edi
    sub sub edi, 4
    push push ecx
    push push edx
    call call dword ptr [esp + 36]
    add add esp, 8
    test test al, al
    jne sub_10017D51
    cmp cmp ebx, esi
    je sub_10017D81
    cmp cmp esi, ebp
    je sub_10017D85
    push push ebx
    mov mov eax, esi
    mov mov ebx, ebp
L1:
    call sub_1001822E
    add add esp, 4
    mov mov eax, dword ptr [esp + 24]
    add add esi, 4
    add add ebp, 4
    cmp cmp esi, eax
    jne sub_10017D3F
    pop pop ebp
    pop pop ebx
    pop pop esi
    pop pop edi
    ret ret
FUN_10017c90 ENDP
END
