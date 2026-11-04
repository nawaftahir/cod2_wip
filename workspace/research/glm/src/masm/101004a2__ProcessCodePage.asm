.686
.MODEL FLAT, C
EXTRN sub_100F7411:PROC
EXTRN sub_101003C5:PROC
EXTRN sub_101003D6:PROC
EXTRN sub_10100DC1:PROC
EXTRN fp_101AE18C:DWORD
EXTRN g_101A50D0:DWORD
EXTRN g_101AE174:DWORD
.CODE
_ProcessCodePage PROC
    push ebp
    mov ebp, esp
    sub esp, 12
    mov eax, dword ptr [g_101A50D0]
    push esi
    mov esi, ecx
    test esi, esi
    mov dword ptr [ebp - 4], eax
    je L0
    cmp byte ptr [esi], 0
    je L0
    push 01017E288h
    push esi
    call sub_101003C5
    test eax, eax
    pop ecx
    pop ecx
    je L0
    push 01017E284h
    push esi
    call sub_101003D6
    test eax, eax
    pop ecx
    pop ecx
    jne L2
    push 8
    lea eax, [ebp - 12]
    push eax
    push 11
    jmp L1
L0:
    push 8
    lea eax, [ebp - 12]
    push eax
    push 000001004h
L1:
    push dword ptr [g_101AE174]
    call dword ptr [fp_101AE18C]
    test eax, eax
    je L3
    lea esi, [ebp - 12]
L2:
    push esi
    call sub_100F7411
    pop ecx
L3:
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100DC1
    leave
    ret
_ProcessCodePage ENDP
END
