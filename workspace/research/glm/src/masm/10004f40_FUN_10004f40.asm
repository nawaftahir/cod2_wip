.686
.MODEL FLAT, C
EXTRN sub_10060C9F:PROC
EXTRN sub_10060D07:PROC
EXTRN sub_100EFE5F:PROC
EXTRN sub_100EFEC8:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_101D1BF8:DWORD
.CODE
FUN_10004f40 PROC
    push ecx
    push esi
    push 0
    push edi
    push 0
    push 0
    mov esi, eax
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 8
    push esi
    push eax
    call dword ptr [ecx + 0x68]
    test eax, eax
    jge L0
    push eax
    call sub_100EFE5F
    push eax
    push esi
    push 010191B40h
    call sub_10060C9F
    push 010194150h
    push 0
    mov esi, eax
    call dword ptr [fp_101D49C8]
    push 0101940F0h
    push 0
    call dword ptr [fp_101D49C8]
    push 010194090h
    push 0
    call dword ptr [fp_101D49C8]
    push esi
    push 010194088h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 48
    call dword ptr [fp_101D4A1C]
L0:
    mov eax, dword ptr [edi]
    mov edx, dword ptr [eax]
    push 0
    lea ecx, [esp + 8]
    push ecx
    push 0
    push 0
    push eax
    call dword ptr [edx + 0x2c]
    test eax, eax
    jge L1
    push eax
    call sub_100EFEC8
    push eax
    push 010191B14h
    call sub_10060D07
    push 010194150h
    push 0
    mov esi, eax
    call dword ptr [fp_101D49C8]
    push 0101940F0h
    push 0
    call dword ptr [fp_101D49C8]
    push 010194090h
    push 0
    call dword ptr [fp_101D49C8]
    push esi
    push 010194088h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 44
    call dword ptr [fp_101D4A1C]
L1:
    mov eax, dword ptr [esp + 4]
    pop esi
    pop ecx
    ret
FUN_10004f40 ENDP
END
