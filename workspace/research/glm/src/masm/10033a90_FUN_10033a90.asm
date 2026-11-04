.686
.MODEL FLAT, C
EXTRN sub_10032CEB:PROC
EXTRN sub_10032D30:PROC
EXTRN sub_10032E8F:PROC
EXTRN sub_100F6CA3:PROC
EXTRN sub_100F6D5F:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D4810:DWORD
EXTRN g_101D492D:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10033a90 PROC
    mov eax, dword ptr [g_101D4810]
    cmp eax, 3
    jne L0
    call sub_10032E8F
    jmp L1
L0:
    cmp eax, 1
    jne L1
    call sub_10032CEB
    call sub_10032D30
L1:
    mov byte ptr [g_101D492D], 1
    jmp L2
    lea esp, [esp]
L2:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 010197ED8h
    push 010193358h
    push eax
    call sub_100F6D5F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6CA3
    add esp, 16
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0xa4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
FUN_10033a90 ENDP
END
