.686
.MODEL FLAT, C
EXTRN sub_1003DDF2:PROC
EXTRN sub_1003EC23:PROC
EXTRN sub_1003EC2C:PROC
EXTRN sub_1003ED22:PROC
EXTRN sub_1003ED2A:PROC
EXTRN sub_1003ED71:PROC
EXTRN sub_1003ED74:PROC
EXTRN sub_1003ED7A:PROC
EXTRN sub_1003ED7D:PROC
EXTRN sub_10060C96:PROC
EXTRN sub_100F6C9A:PROC
EXTRN sub_100F6D0F:PROC
EXTRN sub_100F6D56:PROC
EXTRN sub_100F6DCC:PROC
EXTRN sub_100F6DEE:PROC
EXTRN sub_100F6EAB:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766718:DWORD:DWORD
EXTRN EXTRN g_1076671C:DWORD:DWORD
EXTRN EXTRN g_10766720:DWORD:DWORD
EXTRN EXTRN g_10766724:DWORD:DWORD
EXTRN EXTRN g_10766728:DWORD:DWORD
EXTRN EXTRN g_1076672C:DWORD:DWORD
EXTRN EXTRN g_10766730:DWORD:DWORD
EXTRN EXTRN g_10766734:DWORD:DWORD
EXTRN EXTRN g_10766738:DWORD:DWORD
EXTRN EXTRN g_1076673C:DWORD:DWORD
EXTRN EXTRN g_10766740:DWORD:DWORD
EXTRN EXTRN g_10766744:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1003ea30 PROC
    push push esi
    mov mov esi, eax
    cmp cmp esi, dword ptr [g_10766718]
    je sub_1003EC23
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    push push esi
    push push 010199108h
    call sub_10060C96
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov edx, dword ptr [ecx + 8]
    add add esp, 8
    test test edx, edx
    je L1
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne dl
    test test dl, dl
    je L2
    push push eax
    push push 010193358h
    push push ecx
    call sub_100F6D56
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6C9A
    add add esp, 16
    mov mov ecx, dword ptr [g_10764584]
    push push edi
    lea lea edi, [esi + esi*4]
    shl shl edi, 2
    mov mov dword ptr [g_10766718], esi
    mov mov esi, dword ptr [edi + 0101D4820h]
    test test esi, esi
L0:
    je L3
    call sub_1003DDF2
    mov mov ecx, dword ptr [g_10764584]
    mov mov eax, dword ptr [g_10766728]
    cmp cmp eax, dword ptr [edi + 0101D4824h]
    je sub_1003EC2C
    jmp L4
    mov mov ecx, dword ptr [g_10764584]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je L5
    test test ecx, ecx
    setne setne al
    test test al, al
    je L6
    push push 0101990B8h
    push push 010193358h
    push push ecx
    call sub_100F6DCC
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6D0F
    add add esp, 16
    mov mov edx, dword ptr [edi + 0101D4824h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push 0
    push push eax
    call call dword ptr [ecx + 094h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L7
    mov mov ecx, dword ptr [g_10766718]
    mov mov eax, dword ptr [edi + 0101D4824h]
    mov mov edx, dword ptr [ecx*4 + 01019087Ch]
    mov mov ecx, dword ptr [edi + 0101D4830h]
    mov mov dword ptr [g_10766728], eax
    mov mov eax, dword ptr [edi + 0101D482Ch]
    mov mov dword ptr [g_10766720], ecx
    mov mov dword ptr [g_1076673C], ecx
    mov mov ecx, dword ptr [g_10764584]
    mov mov dword ptr [g_10766724], edx
    mov mov dword ptr [g_1076671C], eax
    mov mov dword ptr [g_10766730], 0
    mov mov dword ptr [g_10766734], 0
    mov mov dword ptr [g_10766738], eax
    mov mov dword ptr [g_10766740], 0
    mov mov dword ptr [g_10766744], 03F800000h
    mov mov eax, dword ptr [g_1076672C]
    cmp cmp eax, dword ptr [edi + 0101D4828h]
    je sub_1003ED7D
    jmp sub_1003ED22
    mov mov ecx, dword ptr [g_10764584]
    jmp sub_1003ED2A
    lea lea ebx, [ebx]
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1003ED71
    test test ecx, ecx
    setne setne al
    test test al, al
    je sub_1003ED7A
    push push 010199060h
    push push 010193358h
    push push ecx
    call sub_100F6EAB
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6DEE
    add add esp, 16
    mov mov edx, dword ptr [edi + 0101D4828h]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push edx
    push push eax
    call call dword ptr [ecx + 09Ch]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1003ED74
    mov mov eax, dword ptr [edi + 0101D4828h]
    mov mov dword ptr [g_1076672C], eax
    pop pop edi
    pop pop esi
FUN_1003ea30 ENDP
END
