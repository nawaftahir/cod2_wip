.686
.MODEL FLAT, C
EXTRN sub_100F7411:PROC
EXTRN sub_101003C5:PROC
EXTRN sub_101003D6:PROC
EXTRN sub_10100539:PROC
EXTRN sub_10100542:PROC
EXTRN sub_1010056E:PROC
EXTRN sub_10100DC1:PROC
EXTRN EXTRN fp_101AE18C:DWORD:DWORD
EXTRN EXTRN g_101A50D0:DWORD:DWORD
EXTRN EXTRN g_101AE174:DWORD:DWORD
.CODE
_ProcessCodePage PROC
    push push ebp
    mov mov ebp, esp
    sub sub esp, 12
    mov mov eax, dword ptr [g_101A50D0]
    push push esi
    mov mov esi, ecx
    test test esi, esi
    mov mov dword ptr [ebp - 4], eax
    je L0
    cmp cmp byte ptr [esi], 0
    je L1
    push push 01017E288h
    push push esi
    call sub_101003C5
    test test eax, eax
    pop pop ecx
    pop pop ecx
    je L2
    push push 01017E284h
    push push esi
    call sub_101003D6
    test test eax, eax
    pop pop ecx
    pop pop ecx
    jne sub_10100542
    push push 8
    lea lea eax, [ebp - 12]
    push push eax
    push push 11
    jmp sub_10100539
    push push 8
    lea lea eax, [ebp - 12]
    push push eax
    push push 01004h
    push push dword ptr [g_101AE174]
    call dword ptr [fp_101AE18C]
    test test eax, eax
    je sub_1010056E
    lea lea esi, [ebp - 12]
    push push esi
    call sub_100F7411
    pop pop ecx
    mov mov ecx, dword ptr [ebp - 4]
    pop pop esi
    call sub_10100DC1
    leave leave
    ret ret
_ProcessCodePage ENDP
END
