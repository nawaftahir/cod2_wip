.686
.MODEL FLAT, C
EXTRN sub_100F6C98:PROC
EXTRN sub_100F6D0B:PROC
EXTRN sub_100F6D55:PROC
EXTRN sub_100F6DB7:PROC
EXTRN sub_100F6EBC:PROC
EXTRN sub_100F7032:PROC
EXTRN g_10764584:DWORD
.CODE
FUN_10037810 PROC
    push ecx
    mov eax, dword ptr [g_10764584]
    test eax, eax
    jne L0
    push 01019890Ch
    push 010198904h
    call sub_100F6D0B
    add esp, 8
    test eax, eax
    mov dword ptr [g_10764584], eax
    je L0
    lea eax, [esp]
    push eax
    call sub_100F7032
    lea ecx, [esp + 4]
    push ecx
    call sub_100F6EBC
    push eax
    call sub_100F6DB7
    mov edx, dword ptr [g_10764584]
    push eax
    push 010194210h
    push edx
    call sub_100F6D55
    mov eax, dword ptr [g_10764584]
    push eax
    call sub_100F6C98
    add esp, 28
L0:
    pop ecx
    ret
FUN_10037810 ENDP
END
