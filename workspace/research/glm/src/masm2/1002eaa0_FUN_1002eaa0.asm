.686
.MODEL FLAT, C
EXTRN sub_1000D4B8:PROC
EXTRN sub_1002EBC6:PROC
EXTRN sub_1002EBC8:PROC
EXTRN sub_1002EBD4:PROC
EXTRN sub_100F6C83:PROC
EXTRN sub_100F6CE3:PROC
EXTRN sub_100F6D3F:PROC
EXTRN sub_100F6DA0:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_10766728:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1002eaa0 PROC
    push push esi
    mov mov esi, eax
    call sub_1000D4B8
    mov mov esi, eax
    lea lea ebx, [ebx]
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L1
    push push 0101980C8h
    push push 010193358h
    push push eax
    call sub_100F6D3F
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6C83
    add add esp, 16
    mov mov ecx, dword ptr [g_10766728]
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 2
    push push 0
    push push esi
    push push 0
    push push ecx
    push push eax
    call call dword ptr [edx + 088h]
L0:
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L2
    mov mov edi, edi
    mov mov edx, dword ptr [g_101CE7EC]
    mov mov eax, dword ptr [edx + 8]
    test test eax, eax
    je sub_1002EBC6
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je sub_1002EBD4
    push push 0101980ACh
    push push 010193358h
    push push eax
    call sub_100F6DA0
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6CE3
    add add esp, 16
    mov mov ecx, dword ptr [esi]
    push push esi
    call call dword ptr [ecx + 8]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne sub_1002EBC8
    pop pop esi
    ret ret
FUN_1002eaa0 ENDP
END
