.686
.MODEL FLAT, C
EXTRN sub_10032E6C:PROC
EXTRN sub_10032E96:PROC
EXTRN EXTRN g_101D494C:DWORD:DWORD
EXTRN EXTRN g_101D4950:DWORD:DWORD
EXTRN EXTRN g_101D4958:DWORD:DWORD
.CODE
FUN_10032e20 PROC
    mov mov al, byte ptr [g_101D4958]
    test test al, al
    je L0
    mov mov eax, dword ptr [g_101D494C]
    mov mov ecx, dword ptr [eax]
    push push 1
    push push 0
    push push 0
    push push eax
    call call dword ptr [ecx + 28]
    cmp cmp eax, 088760868h
    je sub_10032E6C
    cmp cmp eax, 1
    setne setne al
    test test al, al
    je sub_10032E96
    mov mov byte ptr [g_101D4958], 0
    mov mov eax, dword ptr [g_101D4950]
    add add eax, 0FFFFB1E0h
    mov mov edx, eax
    sar sar edx, 31
    not not edx
    and and edx, eax
    mov mov dword ptr [g_101D4950], edx
    ret ret
FUN_10032e20 ENDP
END
