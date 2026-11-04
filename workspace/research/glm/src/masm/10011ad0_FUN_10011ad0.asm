.686
.MODEL FLAT, C
EXTRN sub_10060CAE:PROC
EXTRN sub_100EFE6E:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_101D1BF8:DWORD
.CODE
FUN_10011ad0 PROC
    push esi
    mov esi, ecx
    push 0
    mov dword ptr [eax], 0
    mov dword ptr [eax + 4], esi
    mov ecx, dword ptr [g_101D1BF8]
    mov edx, dword ptr [ecx]
    add eax, 8
    push eax
    push 0
    push 101
    push 000000208h
    push esi
    push ecx
    call dword ptr [edx + 0x6c]
    test eax, eax
    jge L0
    push eax
    call sub_100EFE6E
    push eax
    push esi
    push 010193DE4h
    call sub_10060CAE
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
    pop esi
    call dword ptr [fp_101D4A1C]
L0:
    pop esi
    ret
FUN_10011ad0 ENDP
END
