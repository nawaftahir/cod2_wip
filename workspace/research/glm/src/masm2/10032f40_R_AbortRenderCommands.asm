.686
.MODEL FLAT, C
EXTRN sub_10032F7E:PROC
EXTRN sub_10032F8F:PROC
EXTRN sub_10032F99:PROC
EXTRN EXTRN g_101D494C:DWORD:DWORD
EXTRN EXTRN g_101D4958:DWORD:DWORD
.CODE
R_AbortRenderCommands PROC
    mov mov al, byte ptr [g_101D4958]
    test test al, al
    je sub_10032F7E
    mov mov eax, dword ptr [g_101D494C]
    mov mov ecx, dword ptr [eax]
    push push 1
    push push 0
    push push 0
    push push eax
    call call dword ptr [ecx + 28]
    cmp cmp eax, 088760868h
    je sub_10032F8F
    cmp cmp eax, 1
    setne setne al
    test test al, al
    jne sub_10032F99
    xor xor eax, eax
    ret ret
    mov mov byte ptr [g_101D4958], 0
    mov mov eax, 1
    ret ret
R_AbortRenderCommands ENDP
END
