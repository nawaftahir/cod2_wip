.686
.MODEL FLAT, C
EXTRN sub_100F7D23:PROC
EXTRN sub_100F7D37:PROC
EXTRN sub_100FC47B:PROC
EXTRN g_101A47C4:DWORD
.CODE
FUN_100f7cf3 PROC
    mov eax, dword ptr [g_101A47C4]
    push ebp
    xor ebp, ebp
    inc ebp
    test eax, eax
    jne sub_100F7D23
    push 000000351h
    call sub_100FC47B
    test eax, eax
    pop ecx
    mov dword ptr [g_101A47C4], eax
    jne sub_100F7D37
    pop ebp
    ret
FUN_100f7cf3 ENDP
END
