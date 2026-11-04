.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_10107AD5:PROC
EXTRN sub_10107AF4:PROC
EXTRN sub_10107B44:PROC
EXTRN EXTRN fp_1010C04C:DWORD:DWORD
EXTRN EXTRN fp_1010C07C:DWORD:DWORD
EXTRN EXTRN g_101AE00C:DWORD:DWORD
EXTRN EXTRN g_101AE22C:DWORD:DWORD
.CODE
___crtInitCritSecAndSpinCount PROC
    push push 16
    push push 010182270h
    call sub_100FB61C
    mov mov eax, dword ptr [g_101AE22C]
    test test eax, eax
    jne L1
    cmp cmp dword ptr [g_101AE00C], 1
    je L0
    push push 01017C7ECh
    call dword ptr [fp_1010C07C]
    test test eax, eax
    je sub_10107AD5
    push push 010182244h
    push push eax
    call dword ptr [fp_1010C04C]
    mov mov dword ptr [g_101AE22C], eax
    test test eax, eax
    jne sub_10107AF4
    mov mov eax, 010107A56h
    mov mov dword ptr [g_101AE22C], eax
    and and dword ptr [ebp - 4], 0
    push push dword ptr [ebp + 12]
    push push dword ptr [ebp + 8]
    call call eax
    mov mov dword ptr [ebp - 32], eax
    jmp sub_10107B44
    mov mov eax, dword ptr [ebp - 20]
L0:
    mov mov eax, dword ptr [eax]
    mov mov eax, dword ptr [eax]
    mov mov dword ptr [ebp - 28], eax
___crtInitCritSecAndSpinCount ENDP
END
