.686
.MODEL FLAT, C
EXTRN sub_10060CA8:PROC
EXTRN sub_10060D04:PROC
EXTRN sub_100F6CAB:PROC
EXTRN sub_100F6D08:PROC
EXTRN sub_100F6D68:PROC
EXTRN sub_100F6DC4:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10037c10 PROC
    mov ecx, dword ptr [esp + 8]
    and ecx, eax
    and edx, eax
    push ebx
    mov ebx, dword ptr [esp + 8]
    xor eax, eax
    test edi, edi
    jle L1
L0:
    cmp dword ptr [esi + eax*8], ecx
    je L3
    inc eax
    cmp eax, edi
    jl L0
L1:
    test edx, edx
    sete al
    dec al
    push ecx
    and al, 10
    add al, 32
    movsx ecx, al
    push ebx
    push ecx
    push 01019849Ch
    call sub_10060CA8
    mov edx, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [edx + 8]
    add esp, 16
    test ecx, ecx
    je L2
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne cl
    test cl, cl
    je L2
    push eax
    push 010193358h
    push edx
    call sub_100F6D68
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CAB
    add esp, 16
L2:
    pop ebx
    ret
L3:
    mov eax, dword ptr [esi + eax*8 + 4]
    test edx, edx
    sete cl
    dec cl
    and cl, 10
    push eax
    add cl, 32
    movsx edx, cl
    push ebx
    push edx
    push 0101984C4h
    call sub_10060D04
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 16
    test edx, edx
    je L2
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne cl
    test cl, cl
    je L2
    push eax
    push 010193358h
    push edx
    call sub_100F6DC4
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6D08
    add esp, 16
    pop ebx
    ret
FUN_10037c10 ENDP
END
