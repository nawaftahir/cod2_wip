.686
.MODEL FLAT, C
EXTRN sub_10032CD5:PROC
EXTRN sub_10032CDF:PROC
EXTRN sub_10032D1A:PROC
EXTRN sub_100F6C95:PROC
EXTRN sub_100F6D51:PROC
EXTRN fp_1010C028:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D492D:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10032f90 PROC
    call sub_10032CD5
    call sub_10032D1A
    call sub_10032CDF
    mov eax, dword ptr [esp + 4]
    push eax
    call dword ptr [fp_1010C028]
    mov byte ptr [g_101D492D], 1
L0:
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010197ED8h
    push 010193358h
    push eax
    call sub_100F6D51
    mov edx, dword ptr [g_10764584]
    push edx
    call sub_100F6C95
    add esp, 16
L1:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0xa4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    ret
FUN_10032f90 ENDP
END
