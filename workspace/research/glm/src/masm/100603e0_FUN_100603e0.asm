.686
.MODEL FLAT, C
EXTRN sub_10060C73:PROC
EXTRN sub_100F5E36:PROC
.CODE
FUN_100603e0 PROC
    sub esp, 64
    push edi
    mov edi, eax
    lea edx, [eax + 1]
    lea esp, [esp]
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    mov cl, byte ptr [eax + edi - 1]
    cmp cl, 47
    lea eax, [eax + edi - 1]
    je L2
L1:
    cmp eax, edi
    je L2
    cmp cl, 46
    je L3
    mov cl, byte ptr [eax - 1]
    dec eax
    cmp cl, 47
    jne L1
L2:
    push esi
    push 63
    lea eax, [esp + 12]
    push edi
    push eax
    call sub_100F5E36
    mov ecx, dword ptr [esp + 92]
    mov esi, dword ptr [esp + 88]
    push ecx
    lea edx, [esp + 24]
    push edx
    push 010194930h
    mov byte ptr [esp + 95], 0
    call sub_10060C73
    add esp, 24
    pop esi
L3:
    pop edi
    add esp, 64
    ret
FUN_100603e0 ENDP
END
