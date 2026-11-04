.686
.MODEL FLAT, C
EXTRN sub_100F6C74:PROC
EXTRN sub_100F6D30:PROC
EXTRN EXTRN g_101CE7EC:DWORD:DWORD
EXTRN EXTRN g_10764584:DWORD:DWORD
EXTRN EXTRN g_1076A830:DWORD:DWORD
.CODE
FUN_1000d4b0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101CE7EC]
    mov mov ecx, dword ptr [eax + 8]
    test test ecx, ecx
    je L0
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    setne setne cl
    test test cl, cl
    je L2
    push push 010193510h
    push push 010193358h
    push push eax
    call sub_100F6D30
    mov mov ecx, dword ptr [g_10764584]
    push push ecx
    call sub_100F6C74
    add add esp, 16
    mov mov eax, dword ptr [esi + 4]
    mov mov edx, dword ptr [eax]
    lea lea ecx, [esp]
    push push ecx
    push push 0
    push push eax
    call call dword ptr [edx + 72]
    mov mov eax, dword ptr [g_1076A830]
    test test eax, eax
    jne L1
    mov mov eax, dword ptr [esp]
L2:
    pop pop ecx
    ret ret
FUN_1000d4b0 ENDP
END
