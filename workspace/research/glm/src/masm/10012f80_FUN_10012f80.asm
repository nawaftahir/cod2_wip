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
EXTRN fp_101D49C8:DWORD
EXTRN fp_101D4BBC:DWORD
EXTRN g_101D481C:DWORD
EXTRN g_101D7E10:DWORD
EXTRN g_10764558:DWORD
.CODE
FUN_10012f80 PROC
    push ebp
    mov ebp, esp
    and esp, 0FFFFFFF8h
    sub esp, 12
    push esi
    push 010193ADCh
    push 0
    call dword ptr [fp_101D49C8]
    call sub_1006078C
    call sub_1000AB11
    call sub_100052E6
    call sub_10012E9B
    call sub_10020B80
    call sub_10029465
    call sub_10012CBA
    push 1
    push 010197950h
    call sub_1000BD26
    mov dword ptr [g_10764558], eax
    call sub_10012F30
    mov eax, 0101D7210h
    mov esi, 0101D7A10h
    call sub_1005EE0F
    push 0
    push 0101D7E14h
    push 0
    lea eax, [esp + 32]
    push 1
    push eax
    mov dword ptr [esp + 40], 0
    mov dword ptr [esp + 44], 0
    mov dword ptr [esp + 48], 0
    call dword ptr [fp_101D4BBC]
    add esp, 36
    mov dword ptr [g_101D7E10], 0101D7E14h
    call sub_1003AA6F
    mov dword ptr [g_101D481C], eax
    pop esi
    mov esp, ebp
    pop ebp
    ret
FUN_10012f80 ENDP
END
