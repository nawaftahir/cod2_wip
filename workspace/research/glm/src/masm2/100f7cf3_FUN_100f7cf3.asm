.686
.MODEL FLAT, C
EXTRN sub_100F7D23:PROC
EXTRN sub_100F7D37:PROC
EXTRN sub_100FC47B:PROC
EXTRN EXTRN g_101A47C4:DWORD:DWORD
.CODE
FUN_100f7cf3 PROC
    mov mov eax, dword ptr [g_101A47C4]
    push push ebp
    xor xor ebp, ebp
    inc inc ebp
    test test eax, eax
    jne sub_100F7D23
    push push 0351h
    call sub_100FC47B
    test test eax, eax
    pop pop ecx
    mov mov dword ptr [g_101A47C4], eax
    jne sub_100F7D37
    pop pop ebp
    ret ret
FUN_100f7cf3 ENDP
END
