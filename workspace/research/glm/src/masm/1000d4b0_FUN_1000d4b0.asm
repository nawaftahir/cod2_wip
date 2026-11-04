.686
.MODEL FLAT, C
EXTRN sub_100F6C74:PROC
EXTRN sub_100F6D30:PROC
EXTRN g_101CE7EC:DWORD
EXTRN g_10764584:DWORD
EXTRN g_1076A830:DWORD
.CODE
FUN_1000d4b0 PROC
    push ecx
L0:
    mov eax, dword ptr [g_101CE7EC]
    mov ecx, dword ptr [eax + 8]
    test ecx, ecx
    je L1
    mov eax, dword ptr [g_10764584]
    test eax, eax
    setne cl
    test cl, cl
    je L1
    push 010193510h
    push 010193358h
    push eax
    call sub_100F6D30
    mov ecx, dword ptr [g_10764584]
    push ecx
    call sub_100F6C74
    add esp, 16
L1:
    mov eax, dword ptr [esi + 4]
    mov edx, dword ptr [eax]
    lea ecx, [esp]
    push ecx
    push 0
    push eax
    call dword ptr [edx + 0x48]
    mov eax, dword ptr [g_1076A830]
    test eax, eax
    jne L0
    mov eax, dword ptr [esp]
    pop ecx
    ret
FUN_1000d4b0 ENDP
END
