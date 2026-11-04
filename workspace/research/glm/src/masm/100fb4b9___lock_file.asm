.686
.MODEL FLAT, C
EXTRN sub_100FC09F:PROC
EXTRN fp_1010C030:DWORD
.CODE
__lock_file PROC
    mov eax, dword ptr [esp + 4]
    mov ecx, 0101A48A0h
    cmp eax, ecx
    jb L0
    cmp eax, 0101A4B00h
    ja L0
    sub eax, ecx
    sar eax, 5
    add eax, 16
    push eax
    call sub_100FC09F
    pop ecx
    ret
L0:
    add eax, 32
    push eax
    call dword ptr [fp_1010C030]
    ret
__lock_file ENDP
END
