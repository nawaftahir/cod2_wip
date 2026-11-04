.686
.MODEL FLAT, C
EXTRN sub_1000D4AF:PROC
EXTRN sub_1000D4B0:PROC
EXTRN sub_1000D4BD:PROC
.CODE
FUN_1000d480 PROC
    push push esi
    xor xor esi, esi
    mov mov eax, dword ptr [esi + 0101CEA68h]
    test test eax, eax
    je sub_1000D4AF
    cmp cmp eax, 0101CE890h
    jb sub_1000D4AF
    cmp cmp eax, 0101CEA64h
    jb sub_1000D4BD
    push push edi
    push push eax
    call call ebx
    add add esp, 8
    add add esi, 4
    cmp cmp esi, 02000h
    jb sub_1000D4B0
    pop pop esi
    ret ret
FUN_1000d480 ENDP
END
