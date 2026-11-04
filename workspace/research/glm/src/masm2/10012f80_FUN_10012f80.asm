.686
.MODEL FLAT, C
EXTRN sub_100052E6:PROC
EXTRN sub_1000AB11:PROC
EXTRN sub_1000BD26:PROC
EXTRN sub_10012CBA:PROC
EXTRN sub_10012E9B:PROC
EXTRN sub_10012F30:PROC
EXTRN sub_10020B80:PROC
EXTRN sub_10029465:PROC
EXTRN sub_1003AA6F:PROC
EXTRN sub_1005EE0F:PROC
EXTRN sub_1006078C:PROC
EXTRN EXTRN fp_101D49C8:DWORD:DWORD
EXTRN EXTRN fp_101D4BBC:DWORD:DWORD
EXTRN EXTRN g_101D481C:DWORD:DWORD
EXTRN EXTRN g_101D7E10:DWORD:DWORD
EXTRN EXTRN g_10764558:DWORD:DWORD
.CODE
FUN_10012f80 PROC
    push push ebp
    mov mov ebp, esp
    and and esp, -8
    sub sub esp, 12
    push push esi
    push push 010193ADCh
    push push 0
    call dword ptr [fp_101D49C8]
    call sub_1006078C
    call sub_1000AB11
    call sub_100052E6
    call sub_10012E9B
    call sub_10020B80
    call sub_10029465
    call sub_10012CBA
    push push 1
    push push 010197950h
    call sub_1000BD26
    mov mov dword ptr [g_10764558], eax
    call sub_10012F30
    mov mov eax, 0101D7210h
    mov mov esi, 0101D7A10h
    call sub_1005EE0F
    push push 0
    push push 0101D7E14h
    push push 0
    lea lea eax, [esp + 32]
    push push 1
    push push eax
    mov mov dword ptr [esp + 40], 0
    mov mov dword ptr [esp + 44], 0
    mov mov dword ptr [esp + 48], 0
    call dword ptr [fp_101D4BBC]
    add add esp, 36
    mov mov dword ptr [g_101D7E10], 0101D7E14h
    call sub_1003AA6F
    mov mov dword ptr [g_101D481C], eax
    pop pop esi
    mov mov esp, ebp
    pop pop ebp
    ret ret
FUN_10012f80 ENDP
END
