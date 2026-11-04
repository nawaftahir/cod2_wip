.686
.MODEL FLAT, C
EXTRN sub_1003DDF2:PROC
EXTRN sub_1003EC23:PROC
EXTRN sub_10060C96:PROC
EXTRN sub_100F6C9A:PROC
EXTRN sub_100F6D0F:PROC
EXTRN sub_100F6D56:PROC
EXTRN sub_100F6DCC:PROC
EXTRN sub_100F6DEE:PROC
EXTRN sub_100F6EAB:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766718:DWORD
EXTRN g_1076671C:DWORD
EXTRN g_10766720:DWORD
EXTRN g_10766724:DWORD
EXTRN g_10766728:DWORD
EXTRN g_1076672C:DWORD
EXTRN g_10766730:DWORD
EXTRN g_10766734:DWORD
EXTRN g_10766738:DWORD
EXTRN g_1076673C:DWORD
EXTRN g_10766740:DWORD
EXTRN g_10766744:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1003ea30 PROC
    push esi
    mov esi, eax
    cmp esi, dword ptr [g_10766718]
    je sub_1003EC23
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    push esi
    push 010199108h
    call sub_10060C96
    mov ecx, dword ptr [g_101CE7EC]
    mov edx, dword ptr [ecx + 8]
    add esp, 8
    test edx, edx
    je L0
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne dl
    test dl, dl
    je L1
    push eax
    push 010193358h
    push ecx
    call sub_100F6D56
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6C9A
    add esp, 16
L0:
    mov ecx, dword ptr [g_10764584]
L1:
    push edi
    lea edi, [esi + esi*4]
    shl edi, 2
    mov dword ptr [g_10766718], esi
    mov esi, dword ptr [edi + 0101D4820h]
    test esi, esi
    je L2
    call sub_1003DDF2
    mov ecx, dword ptr [g_10764584]
L2:
    mov eax, dword ptr [g_10766728]
    cmp eax, dword ptr [edi + 0101D4824h]
    je L6
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
    push 0101990B8h
    push 010193358h
    push ecx
    call sub_100F6DCC
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6D0F
    add esp, 16
L5:
    mov edx, dword ptr [edi + 0101D4824h]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push 0
    push eax
    call dword ptr [ecx + 0x94]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L3
    mov ecx, dword ptr [g_10766718]
    mov eax, dword ptr [edi + 0101D4824h]
    mov edx, dword ptr [ecx*4 + 01019087Ch]
    mov ecx, dword ptr [edi + 0101D4830h]
    mov dword ptr [g_10766728], eax
    mov eax, dword ptr [edi + 0101D482Ch]
    mov dword ptr [g_10766720], ecx
    mov dword ptr [g_1076673C], ecx
    mov ecx, dword ptr [g_10764584]
    mov dword ptr [g_10766724], edx
    mov dword ptr [g_1076671C], eax
    mov dword ptr [g_10766730], 0
    mov dword ptr [g_10766734], 0
    mov dword ptr [g_10766738], eax
    mov dword ptr [g_10766740], 0
    mov dword ptr [g_10766744], 03F800000h
L6:
    mov eax, dword ptr [g_1076672C]
    cmp eax, dword ptr [edi + 0101D4828h]
    je L10
    jmp L8
L7:
    mov ecx, dword ptr [g_10764584]
    jmp L8
    lea ebx, [ebx]
L8:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L9
    test ecx, ecx
    setne al
    test al, al
    je L9
    push 010199060h
    push 010193358h
    push ecx
    call sub_100F6EAB
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6DEE
    add esp, 16
L9:
    mov edx, dword ptr [edi + 0101D4828h]
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push edx
    push eax
    call dword ptr [ecx + 0x9c]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L7
    mov eax, dword ptr [edi + 0101D4828h]
    mov dword ptr [g_1076672C], eax
L10:
    pop edi
    pop esi
FUN_1003ea30 ENDP
END
