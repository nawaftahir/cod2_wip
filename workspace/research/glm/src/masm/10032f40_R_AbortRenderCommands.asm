.686
.MODEL FLAT, C
EXTRN g_101D494C:DWORD
EXTRN g_101D4958:DWORD
.CODE
R_AbortRenderCommands PROC
    mov al, byte ptr [g_101D4958]
    test al, al
    je L1
    mov eax, dword ptr [g_101D494C]
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 088760868h
    je L0
    cmp eax, 1
    setne al
    test al, al
    jne L0
    xor eax, eax
    ret
L0:
    mov byte ptr [g_101D4958], 0
L1:
    mov eax, 1
    ret
R_AbortRenderCommands ENDP
END
