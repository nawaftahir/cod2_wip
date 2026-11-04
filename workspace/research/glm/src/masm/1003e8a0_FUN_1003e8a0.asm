.686
.MODEL FLAT, C
EXTRN sub_10060C95:PROC
EXTRN sub_100F6C98:PROC
EXTRN sub_100F6D23:PROC
EXTRN sub_100F6D55:PROC
EXTRN sub_100F6DE0:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766730:DWORD
EXTRN g_10766734:DWORD
EXTRN g_10766738:DWORD
EXTRN g_1076673C:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003e8a0 PROC
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    mov ecx, dword ptr [esi + 12]
    mov edx, dword ptr [esi + 8]
    mov eax, dword ptr [esi + 4]
    push ecx
    mov ecx, dword ptr [esi]
    push edx
    push eax
    push ecx
    push 010199150h
    call sub_10060C95
    mov edx, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [edx + 8]
    add esp, 20
    test ecx, ecx
    je L0
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L1
    push eax
    push 010193358h
    push ecx
    call sub_100F6D55
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6C98
    add esp, 16
L0:
    mov ecx, dword ptr [g_10764584]
L1:
    mov eax, dword ptr [esi]
    cmp eax, dword ptr [g_10766730]
    jne L2
    mov edx, dword ptr [esi + 4]
    cmp edx, dword ptr [g_10766734]
    jne L2
    mov edx, dword ptr [esi + 8]
    cmp edx, dword ptr [g_10766738]
    jne L2
    mov edx, dword ptr [esi + 12]
    cmp edx, dword ptr [g_1076673C]
    je L6
L2:
    mov dword ptr [g_10766730], eax
    mov eax, dword ptr [esi + 4]
    mov dword ptr [g_10766734], eax
    mov edx, dword ptr [esi + 8]
    mov dword ptr [g_10766738], edx
    mov eax, dword ptr [esi + 12]
    mov dword ptr [g_1076673C], eax
    jmp L4
L3:
    mov ecx, dword ptr [g_10764584]
L4:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L5
    test ecx, ecx
    setne al
    test al, al
    je L5
    push 010199178h
    push 010193358h
    push ecx
    call sub_100F6DE0
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D23
    add esp, 16
L5:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push 010766730h
    push eax
    call dword ptr [ecx + 0xbc]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L3
L6:
    ret
FUN_1003e8a0 ENDP
END
