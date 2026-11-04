.686
.MODEL FLAT, C
EXTRN sub_10060476:PROC
EXTRN sub_10060C73:PROC
EXTRN sub_100F5E36:PROC
.CODE
FUN_100603e0 PROC
    sub sub esp, 64
    push push edi
    mov mov edi, eax
    lea lea edx, [eax + 1]
    lea lea esp, [esp]
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne L0
    sub sub eax, edx
    mov mov cl, byte ptr [eax + edi - 1]
    cmp cmp cl, 47
    lea lea eax, [eax + edi - 1]
    je L1
    cmp cmp eax, edi
    je L2
    cmp cmp cl, 46
    je sub_10060476
    mov mov cl, byte ptr [eax - 1]
    dec dec eax
    cmp cmp cl, 47
    jne L1
    push push esi
    push push 63
    lea lea eax, [esp + 12]
    push push edi
    push push eax
    call sub_100F5E36
    mov mov ecx, dword ptr [esp + 92]
    mov mov esi, dword ptr [esp + 88]
    push push ecx
    lea lea edx, [esp + 24]
    push push edx
    push push 010194930h
    mov mov byte ptr [esp + 95], 0
L1:
    call sub_10060C73
    add add esp, 24
    pop pop esi
    pop pop edi
    add add esp, 64
    ret ret
FUN_100603e0 ENDP
END
