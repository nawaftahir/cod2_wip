.686
.MODEL FLAT, C
EXTRN sub_10037867:PROC
EXTRN sub_100F70CD:PROC
EXTRN fp_101D4A6C:DWORD
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
.CODE
FUN_10037890 PROC
    mov ecx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    je L0
    mov edx, dword ptr [g_10764584]
    test edx, edx
    setne dl
    test dl, dl
    je L0
    dec eax
    push eax
    push ecx
    call dword ptr [fp_101D4A6C]
    mov ecx, dword ptr [g_101CE7EC]
    add esp, 8
L0:
    mov eax, dword ptr [ecx + 8]
    test eax, eax
    jne L2
    mov eax, dword ptr [g_10764584]
    test eax, eax
    je L1
    push eax
    call sub_100F70CD
    add esp, 4
    mov dword ptr [g_10764584], 0
L1:
    ret
L2:
    jmp sub_10037867
FUN_10037890 ENDP
END
