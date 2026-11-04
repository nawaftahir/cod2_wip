.686
.MODEL FLAT, C
EXTRN sub_10046CF6:PROC
EXTRN sub_10046D09:PROC
EXTRN sub_10046D1C:PROC
EXTRN sub_10046D2F:PROC
.CODE
FUN_10046da0 PROC
    push push ebx
    mov mov ebx, eax
    lea lea eax, [ebx + 96]
    push push 010190B84h
    push push eax
    mov mov eax, 010190B70h
    call sub_10046CF6
    lea lea ecx, [ebx + 112]
    push push 010190BC8h
    push push ecx
    mov mov eax, 010190BB0h
    call sub_10046D09
    lea lea edx, [ebx + 100]
    push push 010190BA4h
    push push edx
    mov mov eax, 010190B90h
    call sub_10046D1C
    lea lea eax, [ebx + 116]
    push push 010190C80h
    push push eax
    mov mov eax, 010190C6Ch
    call sub_10046D2F
    add add esp, 32
    pop pop ebx
    ret ret
FUN_10046da0 ENDP
END
