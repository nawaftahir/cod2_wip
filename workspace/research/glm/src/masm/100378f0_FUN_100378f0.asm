.686
.MODEL FLAT, C
EXTRN sub_100F6C6F:PROC
EXTRN sub_100F6D2C:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_100378f0 PROC
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L0
    mov ecx, dword ptr [g_10764584]
    test ecx, ecx
    setne al
    test al, al
    je L0
    push edx
    push 010193358h
    push ecx
    call sub_100F6D2C
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6C6F
    add esp, 16
L0:
    ret
FUN_100378f0 ENDP
END
