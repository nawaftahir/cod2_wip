.686
.MODEL FLAT, C
EXTRN sub_100FBF78:PROC
EXTRN fp_101ADDC4:DWORD
EXTRN g_101A4898:DWORD
.CODE
__mtterm PROC
    mov eax, dword ptr [g_101A4898]
    cmp eax, -1
    je L0
    push eax
    call dword ptr [fp_101ADDC4]
    or dword ptr [g_101A4898], 0FFFFFFFFh
L0:
    jmp sub_100FBF78
__mtterm ENDP
END
