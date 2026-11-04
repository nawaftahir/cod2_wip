.686
.MODEL FLAT, C
EXTRN sub_10032D2C:PROC
EXTRN sub_10032D36:PROC
EXTRN sub_10032D71:PROC
EXTRN sub_100F6C73:PROC
EXTRN sub_100F6D2F:PROC
EXTRN fp_1010C028:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D492D:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10033010 PROC
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
    push 010197EC0h
    push 010193358h
    push eax
    call sub_100F6D2F
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6C73
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0xa8]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov byte ptr [g_101D492D], 0
    call sub_10032D2C
    call sub_10032D71
    call sub_10032D36
    mov eax, dword ptr [esp + 4]
    push eax
    call dword ptr [fp_1010C028]
    ret
FUN_10033010 ENDP
END
