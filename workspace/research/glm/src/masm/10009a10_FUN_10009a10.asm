.686
.MODEL FLAT, C
EXTRN sub_10007E5C:PROC
EXTRN sub_10009755:PROC
EXTRN g_1019BC84:DWORD
EXTRN g_101CE5D0:DWORD
EXTRN g_101CE5D4:DWORD
EXTRN g_101CE5D8:DWORD
EXTRN g_101CE5DC:DWORD
.CODE
FUN_10009a10 PROC
    push ebx
    mov ebx, eax
    mov al, byte ptr [ebx + 1]
    test al, al
    je L1
L0:
    mov al, 1
    pop ebx
    ret
L1:
    fld dword ptr [g_101CE5D4]
    fmul dword ptr [ebx + 12]
    fld dword ptr [g_101CE5D8]
    fmul dword ptr [ebx + 16]
    faddp st(1)
    fld dword ptr [g_101CE5DC]
    fmul dword ptr [ebx + 20]
    faddp st(1)
    fld dword ptr [g_101CE5D0]
    fmul dword ptr [ebx + 8]
    faddp st(1)
    fcomp dword ptr [g_1019BC84]
    fnstsw ax
    test ah, 65
    je L0
    mov eax, ebx
    call sub_10007E5C
    test al, al
    jne L0
    call sub_10009755
    test al, al
    setne al
    pop ebx
    ret
FUN_10009a10 ENDP
END
