.686
.MODEL FLAT, C
EXTRN g_101D494C:DWORD
EXTRN g_101D4958:DWORD
.CODE
FUN_10032cd0 PROC
L0:
    mov al, byte ptr [g_101D4958]
    test al, al
    je L2
    mov eax, dword ptr [g_101D494C]
    mov ecx, dword ptr [eax]
    push 1
    push 0
    push 0
    push eax
    call dword ptr [ecx + 0x1c]
    cmp eax, 088760868h
    je L1
    cmp eax, 1
    setne al
    test al, al
    je L0
L1:
    mov byte ptr [g_101D4958], 0
L2:
    ret
FUN_10032cd0 ENDP
END
