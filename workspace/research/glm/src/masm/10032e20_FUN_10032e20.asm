.686
.MODEL FLAT, C
EXTRN g_101D494C:DWORD
EXTRN g_101D4950:DWORD
EXTRN g_101D4958:DWORD
.CODE
FUN_10032e20 PROC
    mov al, byte ptr [g_101D4958]
    test al, al
    je L1
    mov eax, dword ptr [g_101D494C]
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 088760868h
    je L0
    cmp eax, 1
    setne al
    test al, al
    je L2
L0:
    mov byte ptr [g_101D4958], 0
L1:
    mov eax, dword ptr [g_101D4950]
    add eax, 0FFFFB1E0h
    mov edx, eax
    sar edx, 31
    not edx
    and edx, eax
    mov dword ptr [g_101D4950], edx
L2:
    ret
FUN_10032e20 ENDP
END
