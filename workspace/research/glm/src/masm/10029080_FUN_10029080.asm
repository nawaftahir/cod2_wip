.686
.MODEL FLAT, C
EXTRN sub_10060CC1:PROC
EXTRN sub_100F883A:PROC
EXTRN fp_101D4AE0:DWORD
EXTRN fp_101D4B14:DWORD
.CODE
FUN_10029080 PROC
    mov eax, 000002000h
    call sub_100F883A
    push 000002000h
    lea eax, [esp + 4]
    push eax
    push 21
    push 0101A5A38h
    call dword ptr [fp_101D4AE0]
    add esp, 16
    test eax, eax
    je L1
    lea eax, [esp]
    lea edx, [eax + 1]
    mov edi, edi
L0:
    mov cl, byte ptr [eax]
    inc eax
    test cl, cl
    jne L0
    sub eax, edx
    mov edx, dword ptr [esp + 000002004h]
    push eax
    lea ecx, [esp + 4]
    push ecx
    push edx
    push 0101970CCh
    call sub_10060CC1
    add esp, 8
    push eax
    call dword ptr [fp_101D4B14]
    add esp, 12
L1:
    add esp, 000002000h
    ret
FUN_10029080 ENDP
END
