.686
.MODEL FLAT, C
EXTRN sub_10037D25:PROC
EXTRN sub_10037D34:PROC
EXTRN sub_10060CA8:PROC
EXTRN sub_10060D04:PROC
EXTRN sub_100F6CAB:PROC
EXTRN sub_100F6D08:PROC
EXTRN sub_100F6D68:PROC
EXTRN sub_100F6DC4:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10037c10 PROC
    mov mov ecx, dword ptr [esp + 8]
    and and ecx, eax
    and and edx, eax
    push push ebx
    mov mov ebx, dword ptr [esp + 8]
    xor xor eax, eax
    test test edi, edi
    jle L0
    cmp cmp dword ptr [esi + eax*8], ecx
    je L1
    inc inc eax
    cmp cmp eax, edi
    jl L0
    test test edx, edx
    sete sete al
    dec dec al
    push push ecx
    and and al, 10
    add add al, 32
    movsx movsx ecx, al
    push push ebx
    push push ecx
    push push 01019849Ch
    call sub_10060CA8
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [edx + 8]
    add add esp, 16
    test test ecx, ecx
    je L2
    mov mov edx, dword ptr [g_10764584]
    test test edx, edx
    setne setne cl
    test test cl, cl
    je L3
    push push eax
    push push 010193358h
    push push edx
    call sub_100F6D68
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CAB
    add add esp, 16
    pop pop ebx
    ret ret
    mov mov eax, dword ptr [esi + eax*8 + 4]
    test test edx, edx
    sete sete cl
    dec dec cl
    and and cl, 10
    push push eax
    add add cl, 32
    movsx movsx edx, cl
    push push ebx
    push push edx
    push push 0101984C4h
    call sub_10060D04
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 16
    test test edx, edx
    je sub_10037D25
    mov mov edx, dword ptr [g_10764584]
    test test edx, edx
    setne setne cl
    test test cl, cl
    je sub_10037D34
    push push eax
    push push 010193358h
L2:
    push push edx
    call sub_100F6DC4
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6D08
    add add esp, 16
    pop pop ebx
    ret ret
FUN_10037c10 ENDP
END
