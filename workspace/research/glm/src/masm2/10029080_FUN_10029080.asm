.686
.MODEL FLAT, C
EXTRN sub_100290E7:PROC
EXTRN sub_10029106:PROC
EXTRN sub_10060CC1:PROC
EXTRN sub_100F883A:PROC
EXTRN EXTRN fp_101D4AE0:DWORD:DWORD
EXTRN EXTRN fp_101D4B14:DWORD:DWORD
.CODE
FUN_10029080 PROC
    mov mov eax, 02000h
    call sub_100F883A
    push push 02000h
    lea lea eax, [esp + 4]
    push push eax
    push push 21
    push push 0101A5A38h
    call dword ptr [fp_101D4AE0]
    add add esp, 16
    test test eax, eax
    je sub_10029106
    lea lea eax, [esp]
    lea lea edx, [eax + 1]
    mov mov edi, edi
    mov mov cl, byte ptr [eax]
    inc inc eax
    test test cl, cl
    jne sub_100290E7
    sub sub eax, edx
    mov mov edx, dword ptr [esp + 02004h]
    push push eax
    lea lea ecx, [esp + 4]
    push push ecx
    push push edx
    push push 0101970CCh
    call sub_10060CC1
    add add esp, 8
    push push eax
    call dword ptr [fp_101D4B14]
    add add esp, 12
    add add esp, 02000h
    ret ret
FUN_10029080 ENDP
END
