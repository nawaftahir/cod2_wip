.686
.MODEL FLAT, C
EXTRN sub_100FB61C:PROC
EXTRN sub_10107B44:PROC
EXTRN fp_1010C04C:DWORD
EXTRN fp_1010C07C:DWORD
EXTRN g_101AE00C:DWORD
EXTRN g_101AE22C:DWORD
.CODE
___crtInitCritSecAndSpinCount PROC
    push 16
    push 010182270h
    call sub_100FB61C
    mov eax, dword ptr [g_101AE22C]
    test eax, eax
    jne L1
    cmp dword ptr [g_101AE00C], 1
    je L0
    push 01017C7ECh
    call dword ptr [fp_1010C07C]
    test eax, eax
    je L0
    push 010182244h
    push eax
    call dword ptr [fp_1010C04C]
    mov dword ptr [g_101AE22C], eax
    test eax, eax
    jne L1
L0:
    mov eax, 010107A56h
    mov dword ptr [g_101AE22C], eax
L1:
    and dword ptr [ebp - 4], 0
    push dword ptr [ebp + 12]
    push dword ptr [ebp + 8]
    call eax
    mov dword ptr [ebp - 32], eax
    jmp sub_10107B44
    mov eax, dword ptr [ebp - 20]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax]
    mov dword ptr [ebp - 28], eax
___crtInitCritSecAndSpinCount ENDP
END
