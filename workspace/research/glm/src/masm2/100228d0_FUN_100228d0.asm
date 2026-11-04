.686
.MODEL FLAT, C
EXTRN sub_1002296E:PROC
EXTRN sub_10061D2C:PROC
EXTRN sub_100EFE81:PROC
EXTRN EXTRN g_101D1BF8:DWORD:DWORD
EXTRN EXTRN g_101D4878:DWORD:DWORD
.CODE
FUN_100228d0 PROC
    push push ecx
    mov mov eax, dword ptr [g_101D4878]
    test test eax, eax
    je L0
    mov mov ecx, dword ptr [eax]
    push push eax
    call call dword ptr [ecx + 4]
    mov mov eax, dword ptr [g_101D4878]
    pop pop ecx
    ret ret
    mov mov eax, dword ptr [g_101D1BF8]
    mov mov edx, dword ptr [eax]
    push push 0
    lea lea ecx, [esp + 4]
    push push ecx
    push push 0
    push push 0
    push push 0
    push push 75
    push push 080h
    push push 080h
    push push eax
    call call dword ptr [edx + 116]
    test test eax, eax
    jge sub_1002296E
    push push eax
    call sub_100EFE81
    push push eax
    push push 080h
    push push 080h
    push push 010196B6Ch
    push push 0
    call sub_10061D2C
    add add esp, 20
    mov mov eax, dword ptr [esp]
    pop pop ecx
    ret ret
FUN_100228d0 ENDP
END
