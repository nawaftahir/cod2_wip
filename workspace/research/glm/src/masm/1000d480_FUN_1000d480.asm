.686
.MODEL FLAT, C
.CODE
FUN_1000d480 PROC
    push esi
    xor esi, esi
L0:
    mov eax, dword ptr [esi + 0101CEA68h]
    test eax, eax
    je L2
    cmp eax, 0101CE890h
    jb L1
    cmp eax, 0101CEA64h
    jb L2
L1:
    push edi
    push eax
    call ebx
    add esp, 8
L2:
    add esi, 4
    cmp esi, 000002000h
    jb L0
    pop esi
    ret
FUN_1000d480 ENDP
END
