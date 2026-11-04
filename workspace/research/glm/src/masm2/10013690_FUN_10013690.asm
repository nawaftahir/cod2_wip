.686
.MODEL FLAT, C
EXTRN sub_1001152B:PROC
EXTRN sub_100121F3:PROC
EXTRN sub_10012270:PROC
EXTRN sub_1001380C:PROC
EXTRN sub_100138C4:PROC
EXTRN sub_10060D17:PROC
EXTRN sub_100EFED7:PROC
EXTRN sub_100F61F3:PROC
EXTRN sub_100F6202:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4A1C:DWORD:DWORD
EXTRN EXTRN g_101CE6DC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D492C:DWORD:DWORD
EXTRN EXTRN g_101D493C:DWORD:DWORD
EXTRN EXTRN g_101D4944:DWORD:DWORD
EXTRN EXTRN g_101D4948:DWORD:DWORD
EXTRN EXTRN g_101D4C74:DWORD:DWORD
EXTRN EXTRN g_101D4C78:DWORD:DWORD
.CODE
FUN_10013690 PROC
    sub sub esp, 92
    mov mov ecx, dword ptr [g_101D4944]
    mov mov eax, dword ptr [g_101D493C]
    mov mov edx, dword ptr [g_101D4948]
    mov mov dword ptr [esp + 20], ecx
    mov mov ecx, dword ptr [g_101D4C74]
    mov mov dword ptr [esp], eax
    xor xor eax, eax
    mov mov dword ptr [esp + 4], ecx
    cmp cmp dword ptr [g_101D4C78], eax
    mov mov dword ptr [esp + 12], eax
    mov mov dword ptr [esp + 16], eax
    mov mov eax, dword ptr [g_101CE6DC]
    mov mov ecx, dword ptr [eax + 8]
    push push ebx
    mov mov dword ptr [esp + 28], edx
    push push esi
    setne setne dl
    lea lea ebx, [esp + 8]
    lea lea esi, [esp + 44]
    mov mov byte ptr [esp + 16], dl
    mov mov dword ptr [esp + 40], ecx
    call sub_1001152B
    call sub_10012270
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    mov mov ecx, esi
    push push ecx
    push push eax
    call call dword ptr [edx + 64]
    push push 030000h
    push push 020000h
    mov mov esi, eax
    call sub_100F61F3
    push push 08001Fh
    push push 08001Fh
    call sub_100F6202
    add add esp, 16
    test test esi, esi
    jge sub_1001380C
    push push esi
    call sub_100EFED7
    push push eax
    push push esi
    push push 010193A50h
    call sub_10060D17
    push push 010194150h
    push push 0
    mov mov esi, eax
    call dword ptr [fp_101D49C8]
    push push 0101940F0h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010194090h
    push push 0
    call dword ptr [fp_101D49C8]
    push push esi
    push push 010194088h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 48
    call dword ptr [fp_101D4A1C]
    mov mov byte ptr [g_101D492C], 0
    call sub_100121F3
    test test al, al
    pop pop esi
    pop pop ebx
    jne sub_100138C4
    push push 010194150h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 0101940F0h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010194090h
    push push 0
    call dword ptr [fp_101D49C8]
    push push 010193A18h
    push push 010194088h
    push push 0
    call dword ptr [fp_101D49C8]
    add add esp, 36
    call dword ptr [fp_101D4A1C]
    add add esp, 92
    ret ret
FUN_10013690 ENDP
END
