.686
.MODEL FLAT, C
EXTRN sub_10034C65:PROC
EXTRN sub_10034C79:PROC
EXTRN sub_10034C7A:PROC
EXTRN sub_10034C87:PROC
EXTRN sub_10034C88:PROC
EXTRN sub_10034C8B:PROC
EXTRN sub_10034C8D:PROC
EXTRN sub_100F6CB5:PROC
EXTRN sub_100F6D72:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D620C:DWORD:DWORD
EXTRN EXTRN g_1072DEC8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766680:DWORD:DWORD
EXTRN EXTRN g_107667D8:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_10034bb0 PROC
    push push ecx
    mov mov ecx, dword ptr [g_101D620C]
    test test ecx, ecx
    je L0
    test test eax, eax
    jne sub_10034C65
    mov mov eax, dword ptr [g_10766680]
    and and al, 0F0h
    cmp cmp al, 32
    je sub_10034C79
    mov mov ecx, dword ptr [g_1072DEC8]
    mov mov dword ptr [esp], ecx
    mov mov eax, dword ptr [g_107667D8]
    mov mov byte ptr [esp + 3], 0FFh
    push push esi
    mov mov esi, dword ptr [esp + 4]
    cmp cmp eax, esi
    je sub_10034C8D
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_10034C7A
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_10034C88
    push push 0101981E0h
    push push 010193358h
    push push eax
    call sub_100F6D72
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CB5
    add add esp, 16
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov ecx, dword ptr [eax]
    push push esi
    push push 34
    push push eax
    call call dword ptr [ecx + 0E4h]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_10034C87
    mov mov dword ptr [g_107667D8], esi
    pop pop esi
    pop pop ecx
    ret ret
    cmp cmp eax, 2
    jne sub_10034C79
    mov mov dword ptr [esp], 0
    jmp sub_10034C8B
FUN_10034bb0 ENDP
END
