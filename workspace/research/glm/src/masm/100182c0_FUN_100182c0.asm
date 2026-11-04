.686
.MODEL FLAT, C
EXTRN sub_10018267:PROC
EXTRN sub_1001828C:PROC
EXTRN sub_10060CA3:PROC
.CODE
FUN_100182c0 PROC
    push ebx
    mov ebx, dword ptr [esp + 16]
    push esi
    mov esi, dword ptr [esp + 32]
    push edi
    mov edi, dword ptr [esp + 32]
    push esi
    push edi
    push ebx
    call sub_10018267
    add esp, 12
    test al, al
    je L0
    pop edi
    pop esi
    xor eax, eax
    pop ebx
    ret 24
L0:
    push esi
    push edi
    push ebx
    push 0101958D0h
    call sub_10060CA3
    add esp, 8
    push eax
    call sub_1001828C
    add esp, 12
    neg al
    pop edi
    pop esi
    pop ebx
    sbb eax, eax
    inc eax
    ret 24
FUN_100182c0 ENDP
END
