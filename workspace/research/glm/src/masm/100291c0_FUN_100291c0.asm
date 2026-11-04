.686
.MODEL FLAT, C
EXTRN sub_10028D25:PROC
EXTRN sub_10060C7D:PROC
EXTRN sub_10061CAD:PROC
EXTRN fp_101D4AE4:DWORD
EXTRN fp_101D4AFC:DWORD
EXTRN fp_101D4B00:DWORD
.CODE
FUN_100291c0 PROC
    push ecx
    push esi
    push eax
    push 0101970CCh
    call sub_10060C7D
    lea ecx, [esp + 12]
    mov esi, eax
    push ecx
    push esi
    call dword ptr [fp_101D4AFC]
    add esp, 16
    test eax, eax
    push esi
    jge L0
    push 010197350h
    call sub_10061CAD
    add esp, 8
    pop esi
    pop ecx
    ret
L0:
    mov edx, dword ptr [esp + 8]
    push edx
    push 21
    push 0101A5A38h
    call dword ptr [fp_101D4AE4]
    add esp, 16
    test eax, eax
    je L1
    mov esi, dword ptr [esp + 12]
    call sub_10028D25
L1:
    mov eax, dword ptr [esp + 4]
    push eax
    call dword ptr [fp_101D4B00]
    add esp, 4
    pop esi
    pop ecx
    ret
FUN_100291c0 ENDP
END
