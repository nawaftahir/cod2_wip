.686
.MODEL FLAT, C
EXTRN sub_1003E9A8:PROC
EXTRN sub_1003E9B3:PROC
EXTRN sub_1003EA04:PROC
EXTRN sub_1003EA34:PROC
EXTRN sub_1003EA4B:PROC
EXTRN sub_1003EA54:PROC
EXTRN sub_10060C95:PROC
EXTRN sub_100F6C98:PROC
EXTRN sub_100F6D23:PROC
EXTRN sub_100F6D55:PROC
EXTRN sub_100F6DE0:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766730:DWORD:DWORD
EXTRN EXTRN g_10766734:DWORD:DWORD
EXTRN EXTRN g_10766738:DWORD:DWORD
EXTRN EXTRN g_1076673C:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003e8a0 PROC
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov ecx, dword ptr [esi + 12]
    mov mov edx, dword ptr [esi + 8]
    mov mov eax, dword ptr [esi + 4]
    push push ecx
    mov mov ecx, dword ptr [esi]
    push push edx
    push push eax
    push push ecx
    push push 010199150h
    call sub_10060C95
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [edx + 8]
    add add esp, 20
    test test ecx, ecx
    je L1
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je L2
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6D55
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6C98
    add add esp, 16
    mov mov ecx, dword ptr [g_10764584]
    mov mov eax, dword ptr [esi]
    cmp cmp eax, dword ptr [g_10766730]
    jne L3
    mov mov edx, dword ptr [esi + 4]
    cmp cmp edx, dword ptr [g_10766734]
    jne sub_1003E9A8
    mov mov edx, dword ptr [esi + 8]
    cmp cmp edx, dword ptr [g_10766738]
    jne sub_1003E9B3
    mov mov edx, dword ptr [esi + 12]
    cmp cmp edx, dword ptr [g_1076673C]
    je sub_1003EA34
    mov mov dword ptr [g_10766730], eax
    mov mov eax, dword ptr [esi + 4]
    mov mov dword ptr [g_10766734], eax
    mov mov edx, dword ptr [esi + 8]
    mov mov dword ptr [g_10766738], edx
    mov mov eax, dword ptr [esi + 12]
L2:
    mov mov dword ptr [g_1076673C], eax
    jmp sub_1003EA04
    mov mov ecx, dword ptr [g_10764584]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003EA4B
    test test ecx, ecx
    setne setne al
    test test al, al
    je sub_1003EA54
    push push 010199178h
    push push 010193358h
    push push ecx
    call sub_100F6DE0
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D23
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push 010766730h
    push push eax
    call call dword ptr [ecx + 0BCh]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003EA54
    ret ret
FUN_1003e8a0 ENDP
END
