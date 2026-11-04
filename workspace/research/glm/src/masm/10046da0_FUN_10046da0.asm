.686
.MODEL FLAT, C
EXTRN sub_10046CF6:PROC
EXTRN sub_10046D09:PROC
EXTRN sub_10046D1C:PROC
EXTRN sub_10046D2F:PROC
.CODE
FUN_10046da0 PROC
    push ebx
    mov ebx, eax
    lea eax, [ebx + 96]
    push 010190B84h
    push eax
    mov eax, 010190B70h
    call sub_10046CF6
    lea ecx, [ebx + 112]
    push 010190BC8h
    push ecx
    mov eax, 010190BB0h
    call sub_10046D09
    lea edx, [ebx + 100]
    push 010190BA4h
    push edx
    mov eax, 010190B90h
    call sub_10046D1C
    lea eax, [ebx + 116]
    push 010190C80h
    push eax
    mov eax, 010190C6Ch
    call sub_10046D2F
    add esp, 32
    pop ebx
    ret
FUN_10046da0 ENDP
END
