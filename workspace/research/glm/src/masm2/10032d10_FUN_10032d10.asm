.686
.MODEL FLAT, C
EXTRN sub_100F6C73:PROC
EXTRN sub_100F6D2F:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D494C:DWORD:DWORD
EXTRN EXTRN g_101D4958:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10032d10 PROC
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L2
    push push 010197EF4h
    push push 010193358h
    push push eax
    call sub_100F6D2F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6C73
    add add esp, 16
    mov mov eax, dword ptr [g_101D494C]
    mov mov edx, dword ptr [eax]
    push push 1
    push push eax
    call call dword ptr [edx + 24]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L1
L1:
    mov mov byte ptr [g_101D4958], 1
    ret ret
FUN_10032d10 ENDP
END
