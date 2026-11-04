.686
.MODEL FLAT, C
EXTRN sub_10007E5C:PROC
EXTRN sub_10009755:PROC
EXTRN EXTRN g_1019BC84:DWORD:DWORD
EXTRN EXTRN g_101CE5D0:DWORD:DWORD
EXTRN EXTRN g_101CE5D4:DWORD:DWORD
EXTRN EXTRN g_101CE5D8:DWORD:DWORD
EXTRN EXTRN g_101CE5DC:DWORD:DWORD
.CODE
FUN_10009a10 PROC
    push push ebx
    mov mov ebx, eax
    mov mov al, byte ptr [ebx + 1]
    test test al, al
    je L0
    mov mov al, 1
    pop pop ebx
    ret ret
    fld fld dword ptr [g_101CE5D4]
    fmul fmul dword ptr [ebx + 12]
    fld fld dword ptr [g_101CE5D8]
    fmul fmul dword ptr [ebx + 16]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5DC]
    fmul fmul dword ptr [ebx + 20]
    faddp faddp st(1)
    fld fld dword ptr [g_101CE5D0]
    fmul fmul dword ptr [ebx + 8]
    faddp faddp st(1)
    fcomp fcomp dword ptr [g_1019BC84]
    fnstsw fnstsw ax
    test test ah, 65
    je L1
    mov mov eax, ebx
    call sub_10007E5C
    test test al, al
    jne L2
    call sub_10009755
    test test al, al
    setne setne al
L2:
    pop pop ebx
    ret ret
FUN_10009a10 ENDP
END
