.686
.MODEL FLAT, C
EXTRN sub_10037867:PROC
EXTRN sub_10037917:PROC
EXTRN sub_1003791F:PROC
EXTRN sub_100F70CD:PROC
EXTRN EXTRN fp_101D4A6C:DWORD:DWORD
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10037890 PROC
    mov mov ecx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    je L0
    mov mov edx, dword ptr [g_10764584]
    test test edx, edx
    setne setne dl
    test test dl, dl
    je L1
    dec dec eax
    push push eax
    push push ecx
    call dword ptr [fp_101D4A6C]
    mov mov ecx, dword ptr [g_101CE7EC]
    add add esp, 8
    mov mov eax, dword ptr [ecx + 8]
    test test eax, eax
    jne sub_10037917
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    je sub_1003791F
    push push eax
    call sub_100F70CD
    add add esp, 4
    mov mov dword ptr [g_10764584], 0
    ret ret
    jmp sub_10037867
FUN_10037890 ENDP
END
