.686
.MODEL FLAT, C
EXTRN sub_10032CEB:PROC
EXTRN sub_10032D30:PROC
EXTRN sub_10032E8F:PROC
EXTRN sub_10033B35:PROC
EXTRN sub_10033B40:PROC
EXTRN sub_10033B43:PROC
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D5F:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4810:DWORD:DWORD
EXTRN EXTRN g_101D492D:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10033a90 PROC
    mov mov eax, dword ptr [g_101D4810]
    cmp cmp eax, 3
    jne L0
    call sub_10032E8F
    jmp L1
    cmp cmp eax, 1
    jne L2
    call sub_10032CEB
L0:
    call sub_10032D30
    mov mov byte ptr [g_101D492D], 1
    jmp L3
    lea lea esp, [esp]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_10033B35
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_10033B43
    push push 010197ED8h
    push push 010193358h
    push push eax
    call sub_100F6D5F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6CA3
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 0A4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10033B40
FUN_10033a90 ENDP
END
