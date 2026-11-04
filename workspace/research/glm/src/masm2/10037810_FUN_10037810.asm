.686
.MODEL FLAT, C
EXTRN sub_10037878:PROC
EXTRN sub_10037893:PROC
EXTRN sub_100F6C98:PROC
EXTRN sub_100F6D0B:PROC
EXTRN sub_100F6D55:PROC
EXTRN sub_100F6DB7:PROC
EXTRN sub_100F6EBC:PROC
EXTRN sub_100F7032:PROC
EXTRN EXTRN g_10764584:DWORD:DWORD
.CODE
FUN_10037810 PROC
    push push ecx
    mov mov eax, dword ptr [g_10764584]
    test test eax, eax
    jne sub_10037878
    push push 01019890Ch
    push push 010198904h
    call sub_100F6D0B
    add add esp, 8
    test test eax, eax
    mov mov dword ptr [g_10764584], eax
    je sub_10037893
    lea lea eax, [esp]
    push push eax
    call sub_100F7032
    lea lea ecx, [esp + 4]
    push push ecx
    call sub_100F6EBC
    push push eax
    call sub_100F6DB7
    mov mov edx, dword ptr [g_10764584]
    push push eax
    push push 010194210h
    push push edx
    call sub_100F6D55
    mov mov eax, dword ptr [g_10764584]
    push push eax
    call sub_100F6C98
    add add esp, 28
    pop pop ecx
    ret ret
FUN_10037810 ENDP
END
