.686
.MODEL FLAT, C
EXTRN sub_10060C29:PROC
EXTRN fp_101D4B04:DWORD
.CODE
FUN_10017940 PROC
    sub esp, 64
    push esi
    push edi
    push eax
    push 0101942C0h
    mov esi, 64
    lea edi, [esp + 16]
    call sub_10060C29
    mov ecx, dword ptr [esp + 84]
    push 1
    push ecx
    mov edx, edi
    push edx
    call dword ptr [fp_101D4B04]
    add esp, 20
    pop edi
    pop esi
    add esp, 64
    ret
FUN_10017940 ENDP
END
