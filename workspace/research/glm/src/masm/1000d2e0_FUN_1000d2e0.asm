.686
.MODEL FLAT, C
EXTRN sub_1000D11D:PROC
.CODE
FUN_1000d2e0 PROC
    push esi
    xor esi, esi
L0:
    mov eax, dword ptr [esi + 0101CEA68h]
    test eax, eax
    je L2
    cmp byte ptr [eax + 30], 5
    jb L2
    mov ecx, dword ptr [eax + 4]
    test ecx, ecx
    jne L2
    cmp eax, 0101CE890h
    jb L1
    cmp eax, 0101CEA64h
    jb L2
L1:
    call sub_1000D11D
L2:
    add esi, 4
    cmp esi, 000002000h
    jb L0
    pop esi
    ret
FUN_1000d2e0 ENDP
END
