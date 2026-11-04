.686
.MODEL FLAT, C
EXTRN sub_1001152B:PROC
EXTRN sub_100121F3:PROC
EXTRN sub_10012270:PROC
EXTRN sub_10060D17:PROC
EXTRN sub_100EFED7:PROC
EXTRN sub_100F61F3:PROC
EXTRN sub_100F6202:PROC
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4A1C:DWORD
EXTRN g_101CE6DC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D492C:DWORD
EXTRN g_101D493C:DWORD
EXTRN g_101D4944:DWORD
EXTRN g_101D4948:DWORD
EXTRN g_101D4C74:DWORD
EXTRN g_101D4C78:DWORD
.CODE
FUN_10013690 PROC
    sub esp, 92
    mov ecx, dword ptr [g_101D4944]
    mov eax, dword ptr [g_101D493C]
    mov edx, dword ptr [g_101D4948]
    mov dword ptr [esp + 20], ecx
    mov ecx, dword ptr [g_101D4C74]
    mov dword ptr [esp], eax
    xor eax, eax
    mov dword ptr [esp + 4], ecx
    cmp dword ptr [g_101D4C78], eax
    mov dword ptr [esp + 12], eax
    mov dword ptr [esp + 16], eax
    mov eax, dword ptr [g_101CE6DC]
    mov ecx, dword ptr [eax + 8]
    push ebx
    mov dword ptr [esp + 28], edx
    push esi
    setne dl
    lea ebx, [esp + 8]
    lea esi, [esp + 44]
    mov byte ptr [esp + 16], dl
    mov dword ptr [esp + 40], ecx
    call sub_1001152B
    call sub_10012270
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    mov ecx, esi
    push ecx
    push eax
    call dword ptr [edx + 0x40]
    push 000030000h
    push 000020000h
    mov esi, eax
    call sub_100F61F3
    push 00008001Fh
    push 00008001Fh
    call sub_100F6202
    add esp, 16
    test esi, esi
    jge L0
    push esi
    call sub_100EFED7
    push eax
    push esi
    push 010193A50h
    call sub_10060D17
    push 010194150h
    push 0
    mov esi, eax
    call dword ptr [fp_101D49C8]
    push 0101940F0h
    push 0
    call dword ptr [fp_101D49C8]
    push 010194090h
    push 0
    call dword ptr [fp_101D49C8]
    push esi
    push 010194088h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 48
    call dword ptr [fp_101D4A1C]
L0:
    mov byte ptr [g_101D492C], 0
    call sub_100121F3
    test al, al
    pop esi
    pop ebx
    jne L1
    push 010194150h
    push 0
    call dword ptr [fp_101D49C8]
    push 0101940F0h
    push 0
    call dword ptr [fp_101D49C8]
    push 010194090h
    push 0
    call dword ptr [fp_101D49C8]
    push 010193A18h
    push 010194088h
    push 0
    call dword ptr [fp_101D49C8]
    add esp, 36
    call dword ptr [fp_101D4A1C]
L1:
    add esp, 92
    ret
FUN_10013690 ENDP
END
