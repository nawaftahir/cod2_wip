.686
.MODEL FLAT, C
EXTRN sub_100F5C49:PROC
.CODE
FUN_1002bd20 PROC
    sub sub esp, 28
    push push 0
    push push 0101977CCh
    lea lea eax, [esp + 8]
    push push eax
    push push ecx
    call sub_100F5C49
    test test eax, eax
    jge L0
    xor xor eax, eax
    add add esp, 28
    ret ret
    mov mov eax, dword ptr [esp]
    xor xor edx, edx
    mov mov dword ptr [esp + 12], edx
    mov mov dword ptr [esp + 16], edx
    mov mov dword ptr [esp + 20], edx
    mov mov dword ptr [esp + 24], edx
    push push esi
    lea lea edx, [esp + 12]
    push push edx
    lea lea edx, [esp + 12]
    push push edx
    lea lea edx, [esp + 24]
    push push edx
    mov mov dword ptr [esp + 28], 04000h
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 92]
    mov mov esi, eax
    mov mov eax, dword ptr [esp + 4]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [esp + 8]
    xor xor eax, eax
    test test esi, esi
    setl setl al
    pop pop esi
    dec dec eax
    and and eax, ecx
    add add esp, 28
    ret ret
FUN_1002bd20 ENDP
END
