.686
.MODEL FLAT, C
EXTRN sub_1000D11D:PROC
EXTRN sub_1000D31A:PROC
EXTRN sub_1000D31B:PROC
EXTRN sub_1000D320:PROC
EXTRN sub_1000D327:PROC
EXTRN sub_1000D329:PROC
EXTRN sub_1000D335:PROC
.CODE
FUN_1000d2e0 PROC
    push push esi
    xor xor esi, esi
    mov mov eax, dword ptr [esi + 0101CEA68h]
    test test eax, eax
    je sub_1000D31A
    cmp cmp byte ptr [eax + 30], 5
    jb sub_1000D320
    mov mov ecx, dword ptr [eax + 4]
    test test ecx, ecx
    jne sub_1000D327
    cmp cmp eax, 0101CE890h
    jb sub_1000D329
    cmp cmp eax, 0101CEA64h
    jb sub_1000D335
    call sub_1000D11D
    add add esi, 4
    cmp cmp esi, 02000h
    jb sub_1000D31B
    pop pop esi
    ret ret
FUN_1000d2e0 ENDP
END
