.686
.MODEL FLAT, C
EXTRN sub_10060C29:PROC
EXTRN EXTRN fp_101D4B04:DWORD:DWORD
.CODE
FUN_10017940 PROC
    sub sub esp, 64
    push push esi
    push push edi
    push push eax
    push push 0101942C0h
    mov mov esi, 64
    lea lea edi, [esp + 16]
    call sub_10060C29
    mov mov ecx, dword ptr [esp + 84]
    push push 1
    push push ecx
    mov mov edx, edi
    push push edx
    call dword ptr [fp_101D4B04]
    add add esp, 20
    pop pop edi
    pop pop esi
    add add esp, 64
    ret ret
FUN_10017940 ENDP
END
