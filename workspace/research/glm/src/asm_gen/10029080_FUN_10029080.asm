; FUN_10029080 @ 0x10029080 — auto-synthesized
    EXTRN fp_101d4ae0:DWORD
    EXTRN fp_101d4b14:DWORD
    sub_10060cc1 PROTO C
    sub_100f883a PROTO C
.CODE
FUN_10029080 PROC
    mov eax, 0x2000
    call sub_100f883a
    push 0x2000
    lea eax, [esp + 4]
    push eax
    push 0x15
    push 0x101a5a38
    call dword ptr [fp_101d4ae0]
    add esp, 0x10
    test eax, eax
    je L0
    lea eax, [esp]
    lea edx, [eax + 1]
    mov edi, edi
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L1
    sub eax, edx
    mov edx, dword ptr [esp + 0x2004]
    push eax
    lea ecx, [esp + 4]
    push ecx
    push edx
    push 0x101970cc
    call sub_10060cc1
    add esp, 8
    push eax
    call dword ptr [fp_101d4b14]
    add esp, 0xc
    add esp, 0x2000
    ret
FUN_10029080 ENDP
END