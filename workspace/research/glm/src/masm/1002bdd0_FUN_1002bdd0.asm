.686
.MODEL FLAT, C
EXTRN sub_100F5C49:PROC
EXTRN fp_1010C07C:DWORD
EXTRN fp_1010C1C8:DWORD
EXTRN fp_1010C1D8:DWORD
.CODE
FUN_1002bdd0 PROC
    sub esp, 28
    push 0
    push 0101977CCh
    lea eax, [esp + 8]
    push eax
    push ecx
    call sub_100F5C49
    test eax, eax
    jge L0
    xor eax, eax
    add esp, 28
    ret
L0:
    push esi
    push 0
    push 0
    call dword ptr [fp_1010C07C]
    push eax
    push 0
    push 0
    push 1
    push 1
    push 0
    push 0
    push 0
    push 010197614h
    push 01019760Ch
    push 0
    call dword ptr [fp_1010C1D8]
    mov esi, eax
    test esi, esi
    mov eax, dword ptr [esp + 4]
    je L1
    mov ecx, dword ptr [eax]
    push 17
    push esi
    push eax
    call dword ptr [ecx + 0x50]
    test eax, eax
    jge L2
    push esi
    call dword ptr [fp_1010C1C8]
    mov eax, dword ptr [esp + 4]
L1:
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 8]
    xor eax, eax
    pop esi
    add esp, 28
    ret
L2:
    xor eax, eax
    push edi
    mov dword ptr [esp + 20], eax
    lea edx, [esp + 16]
    push edx
    mov dword ptr [esp + 28], eax
    mov dword ptr [esp + 32], eax
    lea edx, [esp + 16]
    push edx
    mov dword ptr [esp + 40], eax
    mov eax, dword ptr [esp + 16]
    lea edx, [esp + 28]
    push edx
    mov dword ptr [esp + 32], 000004000h
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x5c]
    push esi
    mov edi, eax
    call dword ptr [fp_1010C1C8]
    mov eax, dword ptr [esp + 8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [esp + 12]
    xor eax, eax
    test edi, edi
    setl al
    pop edi
    pop esi
    dec eax
    and eax, ecx
    add esp, 28
    ret
FUN_1002bdd0 ENDP
END
