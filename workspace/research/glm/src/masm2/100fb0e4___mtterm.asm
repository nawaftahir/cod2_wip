.686
.MODEL FLAT, C
EXTRN sub_100FB106:PROC
EXTRN sub_100FBF78:PROC
EXTRN EXTRN fp_101ADDC4:DWORD:DWORD
EXTRN EXTRN g_101A4898:DWORD:DWORD
.CODE
__mtterm PROC
    mov mov eax, dword ptr [g_101A4898]
    cmp cmp eax, -1
    je sub_100FB106
    push push eax
    call dword ptr [fp_101ADDC4]
    or or dword ptr [g_101A4898], -1
    jmp sub_100FBF78
__mtterm ENDP
END
