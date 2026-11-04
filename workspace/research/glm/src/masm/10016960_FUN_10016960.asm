.686
.MODEL FLAT, C
EXTRN sub_100138DE:PROC
EXTRN sub_1001690B:PROC
EXTRN g_101D92D0:DWORD
.CODE
FUN_10016960 PROC
    push ecx
    cmp dword ptr [g_101D92D0], 0000003FFh
    jne L0
    push 0000003FFh
    push 010194488h
    push 1
    call sub_100138DE
    add esp, 12
L0:
    push ebx
    lea ebx, [esp + 4]
    call sub_1001690B
    mov eax, dword ptr [g_101D92D0]
    mov ecx, dword ptr [esp + 12]
    inc eax
    mov dword ptr [g_101D92D0], eax
    mov eax, dword ptr [esp + 4]
    mov dword ptr [eax*4 + 0101D92D4h], ecx
    pop ebx
    pop ecx
    ret
FUN_10016960 ENDP
END
