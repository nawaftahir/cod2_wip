.686
.MODEL FLAT, C
EXTRN sub_10032D0B:PROC
EXTRN sub_10032D1C:PROC
EXTRN EXTRN g_101D494C:DWORD:DWORD
EXTRN EXTRN g_101D4958:DWORD:DWORD
.CODE
FUN_10032cd0 PROC
    mov mov al, byte ptr [g_101D4958]
    test test al, al
    je sub_10032D0B
    mov mov eax, dword ptr [g_101D494C]
    mov mov ecx, dword ptr [eax]
    push push 1
    push push 0
    push push 0
    push push eax
    call call dword ptr [ecx + 28]
    cmp cmp eax, 088760868h
    je sub_10032D1C
    cmp cmp eax, 1
    setne setne al
    test test al, al
    je L0
L0:
    mov mov byte ptr [g_101D4958], 0
    ret ret
FUN_10032cd0 ENDP
END
