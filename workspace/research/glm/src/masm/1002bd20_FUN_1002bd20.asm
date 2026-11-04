.686
.MODEL FLAT, C
EXTRN sub_100F5C49:PROC
.CODE
FUN_1002bd20 PROC
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
    mov eax, dword ptr [esp]
    xor edx, edx
    mov dword ptr [esp + 12], edx
    mov dword ptr [esp + 16], edx
    mov dword ptr [esp + 20], edx
    mov dword ptr [esp + 24], edx
    push esi
    lea edx, [esp + 12]
    push edx
    lea edx, [esp + 12]
    push edx
    lea edx, [esp + 24]
    push edx
    mov dword ptr [esp + 28], 000004000h
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x5c]
    mov esi, eax
    mov eax, dword ptr [esp + 4]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 8]
    mov ecx, dword ptr [esp + 8]
    xor eax, eax
    test esi, esi
    setl al
    pop esi
    dec eax
    and eax, ecx
    add esp, 28
    ret
FUN_1002bd20 ENDP
END
