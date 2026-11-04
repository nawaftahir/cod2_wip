.686
.MODEL FLAT, C
EXTRN sub_100F6C73:PROC
EXTRN sub_100F6D2F:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D494C:DWORD
EXTRN g_101D4958:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10032d10 PROC
L0:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010197EF4h
    push 010193358h
    push eax
    call sub_100F6D2F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6C73
    add esp, 16
L1:
    mov eax, dword ptr [g_101D494C]
    mov edx, dword ptr [eax]
    push 1
    push eax
    call dword ptr [edx + 0x18]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov byte ptr [g_101D4958], 1
    ret
FUN_10032d10 ENDP
END
