.686
.MODEL FLAT, C
EXTRN sub_10032D2C:PROC
EXTRN sub_10032D36:PROC
EXTRN sub_10032D71:PROC
EXTRN sub_100F6C73:PROC
EXTRN sub_100F6D2F:PROC
EXTRN EXTRN fp_1010C028:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D492D:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10033010 PROC
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L2
    push push 010197EC0h
    push push 010193358h
    push push eax
    call sub_100F6D2F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6C73
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push eax
    call call dword ptr [edx + 0A8h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L1
L1:
    mov mov byte ptr [g_101D492D], 0
    call sub_10032D2C
    call sub_10032D71
    call sub_10032D36
    mov mov eax, dword ptr [esp + 4]
    push push eax
    call dword ptr [fp_1010C028]
    ret ret
FUN_10033010 ENDP
END
