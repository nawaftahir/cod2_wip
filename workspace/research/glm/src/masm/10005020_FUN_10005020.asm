.686
.MODEL FLAT, C
EXTRN sub_100F6C73:PROC
EXTRN sub_100F6D2F:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10005020 PROC
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
    push 010191B04h
    push 010193358h
    push eax
    call sub_100F6D2F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6C73
    add esp, 16
L1:
    mov edx, dword ptr [esi]
    push esi
    call dword ptr [edx + 0x30]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    ret
FUN_10005020 ENDP
END
