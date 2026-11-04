.686
.MODEL FLAT, C
EXTRN sub_1002BEAC:PROC
EXTRN sub_100F5C49:PROC
EXTRN EXTRN fp_1010C07C:DWORD:DWORD
EXTRN EXTRN fp_1010C1C8:DWORD:DWORD
EXTRN EXTRN fp_1010C1D8:DWORD:DWORD
.CODE
FUN_1002bdd0 PROC
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
    push push esi
    push push 0
    push push 0
    call dword ptr [fp_1010C07C]
    push push eax
    push push 0
    push push 0
    push push 1
    push push 1
    push push 0
    push push 0
    push push 0
    push push 010197614h
    push push 01019760Ch
    push push 0
    call dword ptr [fp_1010C1D8]
    mov mov esi, eax
    test test esi, esi
    mov mov eax, dword ptr [esp + 4]
    je L1
    mov mov ecx, dword ptr [eax]
    push push 17
    push push esi
    push push eax
    call call dword ptr [ecx + 80]
    test test eax, eax
    jge sub_1002BEAC
    push push esi
    call dword ptr [fp_1010C1C8]
    mov mov eax, dword ptr [esp + 4]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 8]
    xor xor eax, eax
    pop pop esi
    add add esp, 28
    ret ret
    xor xor eax, eax
    push push edi
    mov mov dword ptr [esp + 20], eax
    lea lea edx, [esp + 16]
    push push edx
    mov mov dword ptr [esp + 28], eax
    mov mov dword ptr [esp + 32], eax
    lea lea edx, [esp + 16]
    push push edx
    mov mov dword ptr [esp + 40], eax
    mov mov eax, dword ptr [esp + 16]
    lea lea edx, [esp + 28]
    push push edx
    mov mov dword ptr [esp + 32], 04000h
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 92]
    push push esi
    mov mov edi, eax
    call dword ptr [fp_1010C1C8]
    mov mov eax, dword ptr [esp + 8]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 8]
    mov mov ecx, dword ptr [esp + 12]
    xor xor eax, eax
    test test edi, edi
    setl setl al
    pop pop edi
    pop pop esi
    dec dec eax
    and and eax, ecx
    add add esp, 28
    ret ret
FUN_1002bdd0 ENDP
END
