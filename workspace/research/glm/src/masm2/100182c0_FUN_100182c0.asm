.686
.MODEL FLAT, C
EXTRN sub_10018267:PROC
EXTRN sub_1001828C:PROC
EXTRN sub_10060CA3:PROC
.CODE
FUN_100182c0 PROC
    push push ebx
    mov mov ebx, dword ptr [esp + 16]
    push push esi
    mov mov esi, dword ptr [esp + 32]
    push push edi
    mov mov edi, dword ptr [esp + 32]
    push push esi
    push push edi
    push push ebx
    call sub_10018267
    add add esp, 12
    test test al, al
    je L0
    pop pop edi
    pop pop esi
    xor xor eax, eax
    pop pop ebx
    ret ret 24
    push push esi
    push push edi
    push push ebx
    push push 0101958D0h
    call sub_10060CA3
    add add esp, 8
    push push eax
    call sub_1001828C
    add add esp, 12
    neg neg al
    pop pop edi
    pop pop esi
    pop pop ebx
L0:
    sbb sbb eax, eax
    inc inc eax
    ret ret 24
FUN_100182c0 ENDP
END
