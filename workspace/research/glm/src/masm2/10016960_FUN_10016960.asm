.686
.MODEL FLAT, C
EXTRN sub_100138DE:PROC
EXTRN sub_1001690B:PROC
EXTRN EXTRN g_101D92D0:DWORD:DWORD
.CODE
FUN_10016960 PROC
    push push ecx
    cmp cmp dword ptr [g_101D92D0], 03FFh
    jne L0
    push push 03FFh
    push push 010194488h
    push push 1
    call sub_100138DE
    add add esp, 12
    push push ebx
    lea lea ebx, [esp + 4]
    call sub_1001690B
    mov mov eax, dword ptr [g_101D92D0]
    mov mov ecx, dword ptr [esp + 12]
    inc inc eax
    mov mov dword ptr [g_101D92D0], eax
    mov mov eax, dword ptr [esp + 4]
    mov mov dword ptr [eax*4 + 0101D92D4h], ecx
    pop pop ebx
    pop pop ecx
    ret ret
FUN_10016960 ENDP
END
