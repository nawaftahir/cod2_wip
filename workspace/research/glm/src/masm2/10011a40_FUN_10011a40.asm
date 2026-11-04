.686
.MODEL FLAT, C
EXTRN sub_10011AEB:PROC
EXTRN sub_10060CAE:PROC
EXTRN sub_100EFE6E:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
.CODE
FUN_10011a40 PROC
    push push esi
    mov mov esi, ecx
    push push 0
    mov mov dword ptr [eax], 0
    mov mov dword ptr [eax + 4], esi
    mov mov ecx, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [ecx]
    add add eax, 8
    push push eax
    push push 0
    push push 0
    push push 0208h
    push push esi
    push push ecx
    call call dword ptr [edx + 104]
    test test eax, eax
    jge sub_10011AEB
    push push eax
    call sub_100EFE6E
    push push eax
    push push esi
    push push 010193E18h
    call sub_10060CAE
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
    pop pop esi
    call dword ptr [fp_101D4A1C]
    pop pop esi
    ret ret
FUN_10011a40 ENDP
END
