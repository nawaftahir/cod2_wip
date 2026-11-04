.686
.MODEL FLAT, C
EXTRN sub_10032CD5:PROC
EXTRN sub_10032CDF:PROC
EXTRN sub_10032D1A:PROC
EXTRN sub_10033019:PROC
EXTRN sub_10033023:PROC
EXTRN sub_10033027:PROC
EXTRN sub_100F6C95:PROC
EXTRN sub_100F6D51:PROC
EXTRN EXTRN fp_1010C028:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D492D:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10032f90 PROC
    call sub_10032CD5
    call sub_10032D1A
    call sub_10032CDF
    mov mov eax, dword ptr [esp + 4]
    push push eax
    call dword ptr [fp_1010C028]
    mov mov byte ptr [g_101D492D], 1
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je sub_10033019
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_10033027
    push push 010197ED8h
    push push 010193358h
    push push eax
    call sub_100F6D51
    mov mov edx, dword ptr [g_10764584]
    push push edx
    call sub_100F6C95
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 0A4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10033023
    ret ret
FUN_10032f90 ENDP
END
