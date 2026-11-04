.686
.MODEL FLAT, C
EXTRN sub_100F6CB5:PROC
EXTRN sub_100F6D72:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_101D1BF8:DWORD
EXTRN g_101D620C:DWORD
EXTRN g_1072DEC8:DWORD
EXTRN g_10764584:DWORD
EXTRN g_10766680:DWORD
EXTRN g_107667D8:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_10034bb0 PROC
    push ecx
    mov ecx, dword ptr [g_101D620C]
    test ecx, ecx
    je L5
    test eax, eax
    jne L6
    mov eax, dword ptr [g_10766680]
    and al, 0000000F0h
    cmp al, 32
    je L7
L0:
    mov ecx, dword ptr [g_1072DEC8]
    mov dword ptr [esp], ecx
L1:
    mov eax, dword ptr [g_107667D8]
    mov byte ptr [esp + 3], 0000000FFh
    push esi
    mov esi, dword ptr [esp + 4]
    cmp eax, esi
    je L4
L2:
    mov edx, dword ptr [g_101CE7EC]
    mov eax, dword ptr [edx + 8]
    test eax, eax
    je L3
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L3
    push 0101981E0h
    push 010193358h
    push eax
    call sub_100F6D72
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6CB5
    add esp, 16
L3:
    mov eax, dword ptr [g_101D1BF8]
    mov ecx, dword ptr [eax]
    push esi
    push 34
    push eax
    call dword ptr [ecx + 0xe4]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L2
    mov dword ptr [g_107667D8], esi
L4:
    pop esi
L5:
    pop ecx
    ret
L6:
    cmp eax, 2
    jne L0
L7:
    mov dword ptr [esp], 0
    jmp L1
FUN_10034bb0 ENDP
END
