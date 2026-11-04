.686
.MODEL FLAT, C
EXTRN sub_1000D38A:PROC
EXTRN sub_10033D6D:PROC
EXTRN sub_10033DCD:PROC
EXTRN sub_10033DE0:PROC
EXTRN sub_1003C46D:PROC
EXTRN sub_1003D8A6:PROC
EXTRN EXTRN fp_101D4A5C:DWORD:DWORD
EXTRN EXTRN g_101CE644:DWORD:DWORD
EXTRN EXTRN g_101CE67C:DWORD:DWORD
EXTRN EXTRN g_101CE680:DWORD:DWORD
EXTRN EXTRN g_101CE6B4:DWORD:DWORD
EXTRN EXTRN g_101CE6F0:DWORD:DWORD
EXTRN EXTRN g_101D496E:DWORD:DWORD
EXTRN EXTRN g_1072DD20:DWORD:DWORD
EXTRN EXTRN g_1072DD24:DWORD:DWORD
EXTRN EXTRN g_1072DD28:DWORD:DWORD
EXTRN EXTRN g_1072DD2C:DWORD:DWORD
EXTRN EXTRN g_1072DEBE:DWORD:DWORD
EXTRN EXTRN g_10766688:DWORD:DWORD
.CODE
FUN_10033c50 PROC
    push push ecx
    mov mov eax, dword ptr [g_101CE644]
    mov mov cl, byte ptr [eax + 7]
    test test cl, cl
    je L0
    push push eax
    call dword ptr [fp_101D4A5C]
    mov mov eax, dword ptr [g_101CE644]
    mov mov ecx, dword ptr [eax + 8]
    mov mov dl, byte ptr [ecx + 0101906B0h]
    add add esp, 4
    mov mov byte ptr [g_1072DEBE], dl
    mov mov eax, dword ptr [g_101CE6F0]
    mov mov cl, byte ptr [eax + 7]
    test test cl, cl
    je L1
    push push eax
L0:
    call dword ptr [fp_101D4A5C]
    add add esp, 4
    call sub_1003D8A6
    mov mov eax, dword ptr [g_101CE680]
    mov mov cl, byte ptr [eax + 7]
    test test cl, cl
    je L2
    push push eax
    call dword ptr [fp_101D4A5C]
    mov mov eax, dword ptr [g_101CE680]
    mov mov ecx, dword ptr [eax + 8]
    add add esp, 4
    push push ecx
    call sub_1000D38A
    add add esp, 4
    mov mov eax, dword ptr [g_101CE6B4]
    mov mov cl, byte ptr [eax + 7]
    test test cl, cl
    je sub_10033D6D
    push push eax
    call dword ptr [fp_101D4A5C]
    mov mov edx, dword ptr [g_101CE6B4]
    fld fld dword ptr [edx + 8]
    add add esp, 4
    fst fst dword ptr [g_1072DD20]
    fst fst dword ptr [g_1072DD24]
    fst fst dword ptr [g_1072DD28]
    fstp fstp dword ptr [g_1072DD2C]
    mov mov eax, dword ptr [g_101CE67C]
    mov mov cl, byte ptr [eax + 7]
    test test cl, cl
    je sub_10033DCD
    push push eax
    call dword ptr [fp_101D4A5C]
    mov mov al, byte ptr [g_101D496E]
    add add esp, 4
L2:
    test test al, al
    je sub_10033DE0
    mov mov eax, dword ptr [g_10766688]
    call sub_1003C46D
    pop pop ecx
    ret ret
FUN_10033c50 ENDP
END
