.686
.MODEL FLAT, C
EXTRN sub_10028D25:PROC
EXTRN sub_10029261:PROC
EXTRN sub_10060C7D:PROC
EXTRN sub_10061CAD:PROC
EXTRN EXTRN fp_101D4AE4:DWORD:DWORD
EXTRN EXTRN fp_101D4AFC:DWORD:DWORD
EXTRN EXTRN fp_101D4B00:DWORD:DWORD
.CODE
FUN_100291c0 PROC
    push push ecx
    push push esi
    push push eax
    push push 0101970CCh
    call sub_10060C7D
    lea lea ecx, [esp + 12]
    mov mov esi, eax
    push push ecx
    push push esi
    call dword ptr [fp_101D4AFC]
    add add esp, 16
    test test eax, eax
    push push esi
    jge L0
    push push 010197350h
    call sub_10061CAD
    add add esp, 8
    pop pop esi
    pop pop ecx
    ret ret
    mov mov edx, dword ptr [esp + 8]
    push push edx
    push push 21
    push push 0101A5A38h
    call dword ptr [fp_101D4AE4]
    add add esp, 16
    test test eax, eax
    je sub_10029261
    mov mov esi, dword ptr [esp + 12]
    call sub_10028D25
    mov mov eax, dword ptr [esp + 4]
    push push eax
    call dword ptr [fp_101D4B00]
    add add esp, 4
    pop pop esi
    pop pop ecx
    ret ret
FUN_100291c0 ENDP
END
