.686
.MODEL FLAT, C
EXTRN sub_10022873:PROC
EXTRN sub_10022B26:PROC
EXTRN sub_10061D11:PROC
EXTRN sub_10061DCC:PROC
EXTRN sub_100EFE70:PROC
EXTRN sub_100EFF29:PROC
EXTRN sub_100F6CC3:PROC
EXTRN sub_100F6D7F:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4814:DWORD:DWORD
EXTRN EXTRN g_101D4818:DWORD:DWORD
EXTRN EXTRN g_101D4C6C:DWORD:DWORD
EXTRN EXTRN g_101D4C70:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10022940 PROC
    mov mov ecx, dword ptr [g_101D4C70]
    sub sub esp, 8
    push push esi
    mov mov esi, eax
    mov mov eax, dword ptr [g_101D4C6C]
    push push edi
    push push 0101D4940h
    mov mov dword ptr [esi + 12], eax
    mov mov dword ptr [esi + 16], ecx
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 0
    push push eax
    call call dword ptr [edx + 56]
    test test eax, eax
    jge L0
    push push eax
    call sub_100EFE70
    push push eax
    push push 010196B38h
    push push 0
    call sub_10061D11
    add add esp, 12
    lea lea edi, [esi + 4]
    jmp L1
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L2
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L3
    push push 010196AE0h
    push push 010193358h
    push push eax
    call sub_100F6D7F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CC3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push edi
    push push 0
    push push 0
    push push 0
    push push eax
    call call dword ptr [edx + 72]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L4
    lea lea eax, [esp + 8]
    push push eax
    lea lea ecx, [esp + 16]
    push push ecx
    call sub_10022873
    mov mov ecx, dword ptr [g_101D4818]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edi, dword ptr [esp + 20]
    mov mov edx, dword ptr [eax]
    add add esp, 8
    push push 0
    add add esi, 8
    push push esi
    mov mov esi, dword ptr [esp + 16]
    push push 0
    push push ecx
    mov mov ecx, dword ptr [g_101D4814]
    push push ecx
    push push 75
    push push esi
    push push edi
    push push eax
    call call dword ptr [edx + 116]
    test test eax, eax
L2:
    jge sub_10022B26
    push push eax
    call sub_100EFF29
    push push eax
    push push esi
    push push edi
    push push 010196B6Ch
    push push 0
    call sub_10061DCC
FUN_10022940 ENDP
END
