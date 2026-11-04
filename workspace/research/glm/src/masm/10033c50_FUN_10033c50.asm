.686
.MODEL FLAT, C
EXTRN sub_1000D38A:PROC
EXTRN sub_1003C46D:PROC
EXTRN sub_1003D8A6:PROC
EXTRN fp_101D4A5C:DWORD
EXTRN g_101CE644:DWORD
EXTRN g_101CE67C:DWORD
EXTRN g_101CE680:DWORD
EXTRN g_101CE6B4:DWORD
EXTRN g_101CE6F0:DWORD
EXTRN g_101D496E:DWORD
EXTRN g_1072DD20:DWORD
EXTRN g_1072DD24:DWORD
EXTRN g_1072DD28:DWORD
EXTRN g_1072DD2C:DWORD
EXTRN g_1072DEBE:DWORD
EXTRN g_10766688:DWORD
.CODE
FUN_10033c50 PROC
    push ecx
    mov eax, dword ptr [g_101CE644]
    mov cl, byte ptr [eax + 7]
    test cl, cl
    je L0
    push eax
    call dword ptr [fp_101D4A5C]
    mov eax, dword ptr [g_101CE644]
    mov ecx, dword ptr [eax + 8]
    mov dl, byte ptr [ecx + 0101906B0h]
    add esp, 4
    mov byte ptr [g_1072DEBE], dl
L0:
    mov eax, dword ptr [g_101CE6F0]
    mov cl, byte ptr [eax + 7]
    test cl, cl
    je L1
    push eax
    call dword ptr [fp_101D4A5C]
    add esp, 4
    call sub_1003D8A6
L1:
    mov eax, dword ptr [g_101CE680]
    mov cl, byte ptr [eax + 7]
    test cl, cl
    je L2
    push eax
    call dword ptr [fp_101D4A5C]
    mov eax, dword ptr [g_101CE680]
    mov ecx, dword ptr [eax + 8]
    add esp, 4
    push ecx
    call sub_1000D38A
    add esp, 4
L2:
    mov eax, dword ptr [g_101CE6B4]
    mov cl, byte ptr [eax + 7]
    test cl, cl
    je L3
    push eax
    call dword ptr [fp_101D4A5C]
    mov edx, dword ptr [g_101CE6B4]
    fld dword ptr [edx + 8]
    add esp, 4
    fst dword ptr [g_1072DD20]
    fst dword ptr [g_1072DD24]
    fst dword ptr [g_1072DD28]
    fstp dword ptr [g_1072DD2C]
L3:
    mov eax, dword ptr [g_101CE67C]
    mov cl, byte ptr [eax + 7]
    test cl, cl
    je L4
    push eax
    call dword ptr [fp_101D4A5C]
    mov al, byte ptr [g_101D496E]
    add esp, 4
    test al, al
    je L4
    mov eax, dword ptr [g_10766688]
    call sub_1003C46D
L4:
    pop ecx
    ret
FUN_10033c50 ENDP
END
