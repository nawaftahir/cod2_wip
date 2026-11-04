.686
.MODEL FLAT, C
EXTRN sub_10037931:PROC
EXTRN sub_10037940:PROC
EXTRN sub_100F6C6F:PROC
EXTRN sub_100F6D2C:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_100378f0 PROC
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je sub_10037931
    mov mov ecx, dword ptr [g_10764584]
    test test ecx, ecx
    setne setne al
    test test al, al
    je sub_10037940
    push push edx
    push push 010193358h
    push push ecx
    call sub_100F6D2C
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6C6F
    add add esp, 16
    ret ret
FUN_100378f0 ENDP
END
