.686
.MODEL FLAT, C
EXTRN sub_1000509D:PROC
EXTRN sub_10060C9F:PROC
EXTRN sub_10060D07:PROC
EXTRN sub_100EFE5F:PROC
EXTRN sub_100EFEC8:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_10004f40 PROC
    push push ecx
    push push esi
    push push 0
    push push edi
    push push 0
    push push 0
    mov mov esi, eax
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 8
    push push esi
    push push eax
    call call dword ptr [ecx + 104]
    test test eax, eax
    jge L0
    push push eax
    call sub_100EFE5F
    push push eax
    push push esi
    push push 010191B40h
    call sub_10060C9F
    push push 010194150h
    push push 0
    mov mov esi, eax
    call dword ptr [fp_101D49C8]
    push push 0101940F0h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010194090h
    push push 0
    call dword ptr [fp_101D49C8]
    push push esi
    push push 010194088h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 48
    call dword ptr [fp_101D4A1C]
    mov mov eax, dword ptr [edi]
    mov mov edx, dword ptr [eax]
    push push 0
    lea lea ecx, [esp + 8]
    push push ecx
    push push 0
    push push 0
    push push eax
    call call dword ptr [edx + 44]
    test test eax, eax
    jge sub_1000509D
    push push eax
    call sub_100EFEC8
L0:
    push push eax
    push push 010191B14h
    call sub_10060D07
    push push 010194150h
    push push 0
    mov mov esi, eax
    call dword ptr [fp_101D49C8]
    push push 0101940F0h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010194090h
    push push 0
    call dword ptr [fp_101D49C8]
    push push esi
    push push 010194088h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 44
    call dword ptr [fp_101D4A1C]
    mov mov eax, dword ptr [esp + 4]
    pop pop esi
    pop pop ecx
    ret ret
FUN_10004f40 ENDP
END
