.686
.MODEL FLAT, C
EXTRN sub_101054BE:PROC
EXTRN sub_101054D0:PROC
EXTRN sub_10108B14:PROC
.CODE
write_char PROC
    test test byte ptr [eax + 12], 64
    je L0
    cmp cmp dword ptr [eax + 8], 0
    je sub_101054BE
    push push eax
    push push dword ptr [esp + 8]
    call sub_10108B14
    cmp cmp ax, 0FFFFh
    pop pop ecx
    pop pop ecx
    jne sub_101054D0
    or or dword ptr [esi], -1
    ret ret
    inc inc dword ptr [esi]
    ret ret
write_char ENDP
END
