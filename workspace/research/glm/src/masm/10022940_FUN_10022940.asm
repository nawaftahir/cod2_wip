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
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4814:DWORD
EXTRN g_101D4818:DWORD
EXTRN g_101D4C6C:DWORD
EXTRN g_101D4C70:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10022940 PROC
    mov ecx, dword ptr [g_101D4C70]
    sub esp, 8
    push esi
    mov esi, eax
    mov eax, dword ptr [g_101D4C6C]
    push edi
    push 0101D4940h
    mov dword ptr [esi + 12], eax
    mov dword ptr [esi + 16], ecx
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push 0
    push eax
    call dword ptr [edx + 0x38]
    test eax, eax
    jge L0
    push eax
    call sub_100EFE70
    push eax
    push 010196B38h
    push 0
    call sub_10061D11
    add esp, 12
L0:
    lea edi, [esi + 4]
    jmp L1
    lea esp, [esp]
L1:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L2
    push 010196AE0h
    push 010193358h
    push eax
    call sub_100F6D7F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CC3
    add esp, 16
L2:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push edi
    push 0
    push 0
    push 0
    push eax
    call dword ptr [edx + 0x48]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L1
    lea eax, [esp + 8]
    push eax
    lea ecx, [esp + 16]
    push ecx
    call sub_10022873
    mov ecx, dword ptr [g_101D4818]
    mov eax, dword ptr [g_101D1BF8]
    mov edi, dword ptr [esp + 20]
    mov edx, dword ptr [eax]
    add esp, 8
    push 0
    add esi, 8
    push esi
    mov esi, dword ptr [esp + 16]
    push 0
    push ecx
    mov ecx, dword ptr [g_101D4814]
    push ecx
    push 75
    push esi
    push edi
    push eax
    call dword ptr [edx + 0x74]
    test eax, eax
    jge sub_10022B26
    push eax
    call sub_100EFF29
    push eax
    push esi
    push edi
    push 010196B6Ch
    push 0
    call sub_10061DCC
FUN_10022940 ENDP
END
